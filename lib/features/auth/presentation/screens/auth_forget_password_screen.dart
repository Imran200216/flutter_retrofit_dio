import 'package:flutter/material.dart';
import 'package:flutter_retrofit_dio/common/widgets/app_spacer.dart';
import 'package:flutter_retrofit_dio/config/app_constants.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_filled_btn.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_text_btn.dart';
import 'package:go_router/go_router.dart';

class AuthForgetPasswordScreen extends StatefulWidget {
  const AuthForgetPasswordScreen({super.key});

  @override
  State<AuthForgetPasswordScreen> createState() =>
      _AuthForgetPasswordScreenState();
}

class _AuthForgetPasswordScreenState extends State<AuthForgetPasswordScreen> {
  // Controllers
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // auth forget password
              Text(
                AppConstants.forgetPasswordText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              const Spacer(flex: 1),

              // Email Address
              CustomInputField(
                label: AppConstants.emailAddressLabelText,
                hintText: AppConstants.emailHintText,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const Spacer(flex: 1),

              // Forget password sent link btn
              CustomFilledBtn(
                text: AppConstants.sentLinkText,
                onPressed: () {},
              ),

              AppVerticalSpacer(12),

              // back to login text btn
              CustomTextBtn(
                textBtnTitle: AppConstants.backToLoginText,
                textBtnOnTap: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
