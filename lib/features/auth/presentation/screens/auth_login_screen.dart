import 'package:flutter/material.dart';
import 'package:flutter_retrofit_dio/config/app_constants.dart';
import 'package:flutter_retrofit_dio/config/route_constants.dart';
import 'package:flutter_retrofit_dio/core/utils/app_validators.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom-outlined_btn.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_auth_footer.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_filled_btn.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_text_btn.dart';
import 'package:go_router/go_router.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  // controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // form key
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // auth login
                Text(
                  AppConstants.loginText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                const Spacer(flex: 1),

                // Email Address
                CustomInputField(
                  validator: (p0) => AppValidators.validateEmail(p0),
                  label: AppConstants.emailAddressLabelText,
                  hintText: AppConstants.emailHintText,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 30),

                // Email Address
                CustomInputField(
                  validator: (p0) => AppValidators.validatePassword(p0),
                  label: AppConstants.passwordLabelText,
                  hintText: AppConstants.passwordHintText,
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),

                const SizedBox(height: 8),

                // Forget password text btn
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomTextBtn(
                    textBtnTitle: AppConstants.forgetPasswordTextBtn,
                    textBtnOnTap: () {
                      // auth forget password screen
                      GoRouter.of(
                        context,
                      ).pushNamed(RouteConstants.authForgetPassword);
                    },
                  ),
                ),

                const Spacer(flex: 2),

                // Login Btn
                CustomFilledBtn(text: AppConstants.loginText, onPressed: () {}),

                const SizedBox(height: 12),

                Text(
                  AppConstants.orText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 12),

                // Sign in with google btn
                CustomOutlinedBtn(
                  text: AppConstants.signInWithGoogleText,
                  onPressed: () {},
                ),

                const SizedBox(height: 12),

                // auth footer
                CustomAuthFooter(
                  authFooterDescription: AppConstants.dontHaveAnAccountText,
                  authFooterTextBtnTitle: AppConstants.signUpText,
                  authFooterTextBtnOnTap: () {
                    // auth sign up screen
                    GoRouter.of(context).pushNamed(RouteConstants.authSignUp);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
