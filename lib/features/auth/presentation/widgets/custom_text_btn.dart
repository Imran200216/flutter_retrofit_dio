import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  final String textBtnTitle;
  final VoidCallback textBtnOnTap;
  const CustomTextBtn({
    super.key,
    required this.textBtnTitle,
    required this.textBtnOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        textBtnOnTap();
      },
      child: Text(
        textBtnTitle,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
      ),
    );
  }
}
