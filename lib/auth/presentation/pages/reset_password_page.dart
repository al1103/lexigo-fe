import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lexigo/auth/presentation/auth_controller.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/gen/assets.gen.dart';

@RoutePage()
class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({
    required this.email,
    super.key,
  });

  final String email;

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String _password = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      switch (next) {
        case AsyncError():
          _showSnackBar('Có lỗi xảy ra. Vui lòng thử lại.', isError: true);
        case AsyncData():
          _showSnackBar('Mật khẩu đã được đặt lại thành công!');
          Future.delayed(const Duration(seconds: 2), () {
            context.router.pushAndPopUntil(
              const SignInRoute(),
              predicate: (route) => false,
            );
          });
        default:
          break;
      }
    });

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

                // Form
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildForm(authState),
                  ),
                ),

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
          'Tạo mật khẩu mới',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A1A1A),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Mật khẩu mới phải khác mật khẩu cũ\nvà có ít nhất 8 ký tự',
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

  Widget _buildForm(AsyncValue<void> authState) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),

          // Password field
          _buildTextField(
            label: 'Mật khẩu mới',
            icon: Icons.lock_outline,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: const Color(0xFF9CA3AF),
                size: 20,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập mật khẩu mới';
              }
              if (value.length < 8) {
                return 'Mật khẩu phải có ít nhất 8 ký tự';
              }
              return null;
            },
            onSaved: (value) => _password = value ?? '',
          ),

          const SizedBox(height: 20),

          // Confirm Password field
          _buildTextField(
            label: 'Xác nhận mật khẩu',
            icon: Icons.lock_outline,
            obscureText: _obscureConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: const Color(0xFF9CA3AF),
                size: 20,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng xác nhận mật khẩu';
              }
              if (value != _password) {
                return 'Mật khẩu xác nhận không khớp';
              }
              return null;
            },
          ),

          const SizedBox(height: 8),

          // Password requirements
          _buildPasswordRequirements(),

          const SizedBox(height: 32),

          // Reset Password button
          _buildResetButton(
            onPressed: authState.isLoading ? null : _resetPassword,
            isLoading: authState.isLoading,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          onSaved: onSaved,
          onChanged: (value) {
            if (label == 'Mật khẩu mới') {
              _password = value;
            }
            setState(() {});
          },
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF1A1A1A),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF9CA3AF),
              size: 20,
            ),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF007AFF), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFEF4444)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            errorStyle: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFEF4444),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordRequirements() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Yêu cầu mật khẩu:',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 4),
          _buildRequirement('Ít nhất 8 ký tự', _password.length >= 8),
          _buildRequirement(
            'Có chữ hoa và chữ thường',
            _password.contains(RegExp('[A-Z]')) &&
                _password.contains(RegExp('[a-z]')),
          ),
          _buildRequirement('Có số', _password.contains(RegExp('[0-9]'))),
        ],
      ),
    );
  }

  Widget _buildRequirement(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 16,
          color: isValid ? const Color(0xFF10B981) : const Color(0xFF9CA3AF),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isValid ? const Color(0xFF10B981) : const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  Widget _buildResetButton({
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D007AFF),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007AFF),
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
                'Đặt lại mật khẩu',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  void _resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      ref.read(authControllerProvider.notifier).resetPassword(
            widget.email,
            _password,
          );
    }
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
