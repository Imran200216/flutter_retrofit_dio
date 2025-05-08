import 'package:flutter/material.dart';
import 'package:flutter_retrofit_dio/common/widgets/app_spacer.dart';
import 'package:flutter_retrofit_dio/core/constants/app_constants.dart';
import 'package:flutter_retrofit_dio/config/route_constants.dart';
import 'package:flutter_retrofit_dio/core/utils/app_validators.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom-outlined_btn.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_auth_footer.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_filled_btn.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:go_router/go_router.dart';

class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  // Controllers
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // form key
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                // auth sign up
                Text(
                  AppConstants.signUpText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                const Spacer(flex: 1),

                // Username
                CustomInputField(
                  validator: (p0) => AppValidators.validateName(p0),
                  label: AppConstants.userNameLabelText,
                  hintText: AppConstants.userNameHintText,
                  controller: userNameController,
                  keyboardType: TextInputType.emailAddress,
                ),

                AppVerticalSpacer(12),

                // Email Address
                CustomInputField(
                  validator: (p0) => AppValidators.validateEmail(p0),
                  label: AppConstants.emailAddressLabelText,
                  hintText: AppConstants.emailHintText,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),

                AppVerticalSpacer(12),

                // Password
                CustomInputField(
                  validator: (p0) => AppValidators.validatePassword(p0),
                  label: AppConstants.passwordLabelText,
                  hintText: AppConstants.passwordHintText,
                  obscureText: true,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),

                const Spacer(flex: 2),

                // Sign Up btn
                CustomFilledBtn(
                  text: AppConstants.signUpText,
                  onPressed: () {},
                ),

                AppVerticalSpacer(12),

                Text(
                  AppConstants.orText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),

                AppVerticalSpacer(12),

                // Sign in with google btn
                CustomOutlinedBtn(
                  text: AppConstants.signInWithGoogleText,
                  onPressed: () {},
                ),

                // auth footer
                CustomAuthFooter(
                  authFooterDescription: AppConstants.alreadyHaveAnAccountText,
                  authFooterTextBtnTitle: AppConstants.loginText,
                  authFooterTextBtnOnTap: () {
                    // auth login screen
                    GoRouter.of(context).pushNamed(RouteConstants.authLogin);
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
