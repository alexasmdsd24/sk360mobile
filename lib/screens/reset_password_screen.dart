import 'package:flutter/material.dart';

import '../ui/app_ui.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _useEmail = true;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelText = _useEmail ? 'Email Address' : 'Phone Number';
    final hintText = _useEmail ? 'Enter your email address' : 'Enter your phone number';

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
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.darkGray),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 8),
              const Text(
                'Reset Your Password',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your preferred reset method',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightText,
                ),
              ),
              const SizedBox(height: 24),
              _buildToggle(),
              const SizedBox(height: 24),
              AppInputField(
                label: labelText,
                hintText: hintText,
                controller: _useEmail ? _emailController : _phoneController,
                keyboardType:
                    _useEmail ? TextInputType.emailAddress : TextInputType.phone,
              ),
              const SizedBox(height: 32),
              AppButton(
                label: 'Resend Link',
                onPressed: () {
                  final message = _useEmail
                      ? 'Reset link sent to your email'
                      : 'Reset code sent to your phone number';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: AppColors.primaryRed,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                _useEmail
                    ? 'A one-time link will be sent to your email address.'
                    : 'A one-time code will be sent to your phone number.',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.lightText,
                ),
              ),
              const SizedBox(height: 80),
              const Center(
                child: Text(
                  'Empowering Youth Governance',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.lightText,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.softPink,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderPink, width: 1.5),
      ),
      child: Row(
        children: [
          _ToggleOption(
            label: 'Email',
            isActive: _useEmail,
            onTap: () {
              if (!_useEmail) {
                setState(() {
                  _useEmail = true;
                });
              }
            },
          ),
          _ToggleOption(
            label: 'Phone',
            isActive: !_useEmail,
            onTap: () {
              if (_useEmail) {
                setState(() {
                  _useEmail = false;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ToggleOption extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _ToggleOption({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryRed : AppColors.softPink,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: AppColors.primaryRed.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isActive ? AppColors.white : AppColors.darkGray,
            ),
          ),
        ),
      ),
    );
  }
}
