import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lexigo/auth/presentation/auth_controller.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/common/routes/route_path.dart';
import 'package:lexigo/gen/assets.gen.dart';

@RoutePage()
class OtpVerificationPage extends ConsumerStatefulWidget {
  const OtpVerificationPage({
    required this.email,
    super.key,
  });

  final String email;

  @override
  ConsumerState<OtpVerificationPage> createState() =>
      _OtpVerificationPageState();
}

class _OtpVerificationPageState extends ConsumerState<OtpVerificationPage>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _timer;
  int _secondsRemaining = 60;
  bool _canResend = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    _canResend = false;
    _secondsRemaining = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF374151),
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Logo and Header
                _buildHeader(),

                const SizedBox(height: 40),

                // OTP Form
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildOtpForm(authState),
                  ),
                ),

                // Back button
                _buildBackButton(),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF007AFF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4D007AFF),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Assets.icons.logo.image(
              width: 40,
              height: 40,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Nhập mã xác thực',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A1A1A),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Chúng tôi đã gửi mã 6 chữ số đến\n${widget.email}',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF6B7280),
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildOtpForm(AsyncValue<void> authState) {
    return Column(
      children: [
        const SizedBox(height: 20),

        // OTP Input Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, _buildOtpField),
        ),

        const SizedBox(height: 32),

        // Verify Button
        _buildVerifyButton(
          onPressed: authState.isLoading ? null : _verifyOtp,
          isLoading: authState.isLoading,
        ),

        const SizedBox(height: 24),

        // Resend Code
        _buildResendSection(),
      ],
    );
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _controllers[index].text.isNotEmpty
              ? const Color(0xFF007AFF)
              : const Color(0xFFE5E7EB),
          width: _controllers[index].text.isNotEmpty ? 2 : 1,
        ),
        color: const Color(0xFFF9FAFB),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1A1A1A),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < 5) {
              _focusNodes[index + 1].requestFocus();
            } else {
              _focusNodes[index].unfocus();
            }
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
          setState(() {});
        },
      ),
    );
  }

  Widget _buildVerifyButton({
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    final isOtpComplete = _controllers.every(
      (controller) => controller.text.isNotEmpty,
    );

    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: isOtpComplete
            ? const [
                BoxShadow(
                  color: Color(0x4D007AFF),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: isOtpComplete ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isOtpComplete ? const Color(0xFF007AFF) : const Color(0xFFE5E7EB),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Xác thực',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildResendSection() {
    return Column(
      children: [
        if (!_canResend) ...[
          Text(
            'Gửi lại mã trong $_secondsRemaining giây',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF6B7280),
            ),
          ),
        ] else ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Không nhận được mã? ',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6B7280),
                ),
              ),
              TextButton(
                onPressed: _resendOtp,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Gửi lại',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF007AFF),
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildBackButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Nhớ mật khẩu rồi? ',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF6B7280),
          ),
        ),
        TextButton(
          onPressed: () => context.router.popUntil(
            (route) => route.settings.name == RoutePath.signIn,
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Đăng nhập',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF007AFF),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _verifyOtp() async {
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == 6) {
      final result = ref
          .read(authControllerProvider.notifier)
          .verifyOtp(widget.email, otp);
      if (await result) {
        await context.router.replace(
          ResetPasswordRoute(email: widget.email),
        );
      } else {
        _showSnackBar('Mã OTP không đúng. Vui lòng thử lại.', isError: true);
      }
    }
  }

  void _resendOtp() {
    // Call resend OTP API
    ref.read(authControllerProvider.notifier).forgotPassword(widget.email);
    _startTimer();
    _showSnackBar('Mã xác thực đã được gửi lại!');
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor:
            isError ? const Color(0xFFEF4444) : const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
