import 'package:flutter/material.dart';

import '../routes.dart';
import '../ui/app_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                'Welcome Back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to access your SK 360° dashboard',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightText,
                ),
              ),
              const SizedBox(height: 32),
              AppInputField(
                label: 'Email Address',
                hintText: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              AppInputField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    activeColor: AppColors.primaryRed,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.resetPassword);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryRed,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AppButton(
                label: 'Sign In',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.presidentHome,
                  );
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.registration);
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.lightText,
                          ),
                        ),
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
