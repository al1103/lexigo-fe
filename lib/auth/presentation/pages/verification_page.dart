import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/auth/presentation/auth_controller.dart';
import 'package:lexigo/common/widgets/app_button.dart';
import 'package:lexigo/common/widgets/app_toast.dart';

@RoutePage()
class VerificationPage extends ConsumerStatefulWidget {
  const VerificationPage({
    required this.email,
    super.key,
  });

  final String email;

  @override
  ConsumerState<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String get verificationCode {
    return _controllers.map((controller) => controller.text).join();
  }

  bool get isCodeComplete {
    return verificationCode.length == 6;
  }

  void _onCodeChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    // Auto submit when all 6 digits are entered
    if (isCodeComplete) {
      _handleVerification();
    }
  }

  Future<void> _handleVerification() async {
    if (!isCodeComplete) {
      AppToast.error('Vui lòng nhập đầy đủ mã xác nhận');
      return;
    }

    final authController = ref.read(authControllerProvider.notifier);

    final response = await authController.verifyRegistration(
      widget.email,
      verificationCode,
    );

    if (response != null) {
      if (response.status == '200' || response.status == 'success') {
        AppToast.success('Đăng ký thành công!');
        // Navigate to login or home screen
        if (mounted) {
          context.router.pop();
        }
      } else {
        AppToast.error(response.message ?? 'Mã xác thực không đúng');
        // Clear the code on error
        _clearCode();
      }
    } else {
      AppToast.error('Đã xảy ra lỗi trong quá trình xác thực');
      _clearCode();
    }
  }

  void _clearCode() {
    for (final controller in _controllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
  }

  Future<void> _resendCode() async {
    final authController = ref.read(authControllerProvider.notifier);

    // Resend the registration request to get a new code
    final response = await authController.signUp(
      '', // These values don't matter for resend
      widget.email,
      '',
      '',
    );

    if (response != null && response.status == '200') {
      AppToast.success('Mã xác nhận đã được gửi lại đến email của bạn');
    } else {
      AppToast.error('Không thể gửi lại mã xác nhận. Vui lòng thử lại sau.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Xác thực email'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.router.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),

              // Email icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.email_outlined,
                  size: 40,
                  color: Colors.blue.shade600,
                ),
              ),

              const SizedBox(height: 32),

              // Title
              Text(
                'Xác thực email của bạn',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Subtitle
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                  children: [
                    const TextSpan(
                      text: 'Chúng tôi đã gửi mã xác nhận 6 chữ số đến\n',
                    ),
                    TextSpan(
                      text: widget.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Code input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 45,
                    height: 60,
                    child: TextFormField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: Colors.blue.shade600, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onChanged: (value) => _onCodeChanged(value, index),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 32),

              // Resend code
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Không nhận được mã? ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  TextButton(
                    onPressed: isLoading ? null : _resendCode,
                    child: Text(
                      'Gửi lại',
                      style: TextStyle(
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Verify button
              AppButton.primary(
                text: 'Xác thực',
                onPressed:
                    (isLoading || !isCodeComplete) ? null : _handleVerification,
                isLoading: isLoading,
                isFullWidth: true,
              ),

              const SizedBox(height: 16),

              // Change email
              TextButton(
                onPressed: () => context.router.pop(),
                child: Text(
                  'Thay đổi địa chỉ email',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
