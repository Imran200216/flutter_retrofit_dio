import 'package:flutter/material.dart';

class CustomAuthFooter extends StatelessWidget {
  final String authFooterDescription;
  final String authFooterTextBtnTitle;
  final VoidCallback authFooterTextBtnOnTap;

  const CustomAuthFooter({
    super.key,
    required this.authFooterDescription,
    required this.authFooterTextBtnTitle,
    required this.authFooterTextBtnOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // auth footer title
        Text(
          authFooterDescription,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey,
          ),
        ),

        // auth Footer Text btn
        TextButton(
          onPressed: () {
            authFooterTextBtnOnTap();
          },
          child: Text(
            authFooterTextBtnTitle,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
