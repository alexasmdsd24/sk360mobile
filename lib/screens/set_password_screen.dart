import 'package:flutter/material.dart';

import '../ui/app_ui.dart';
import 'verification_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  final String email;

  const SetPasswordScreen({super.key, required this.email});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isAgreed = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: SafeArea(
          child: AppHeader(
            appName: 'SK 360°',
            subtitle: 'Youth Governance Platform',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set Your Password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose a strong password for your account',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 32),
              AppInputField(
                label: 'Password',
                hintText: 'Create a strong password',
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 8),
              const Text(
                'Must be at least 8 characters with uppercase, lowercase, and number',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.lightText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              AppInputField(
                label: 'Confirm Password',
                hintText: 'Confirm your password',
                controller: _confirmPasswordController,
                isPassword: true,
              ),
              const SizedBox(height: 32),
              AppCheckboxAgreement(
                isChecked: _isAgreed,
                onChanged: (value) {
                  setState(() {
                    _isAgreed = value;
                  });
                },
                text:
                    'I agree to the Terms of Service and Privacy Policy, and I understand that my account will be subject to role-based access controls for data security.',
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'Back',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isPrimary: false,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      label: 'Create Account',
                      onPressed: () {
                        final email = widget.email.trim().isEmpty
                            ? 'your email'
                            : widget.email.trim();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Verification code sent to $email'),
                            backgroundColor: AppColors.primaryRed,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(
                              email: widget.email,
                            ),
                          ),
                        );
                      },
                      isPrimary: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
