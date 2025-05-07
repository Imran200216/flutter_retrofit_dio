import 'package:flutter/material.dart';

class CustomOutlinedBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;

  const CustomOutlinedBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.borderColor = Colors.blue,
    this.textColor = Colors.blue,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        ),
        child: isLoading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(textColor),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Loading...',
                    style: TextStyle(fontSize: 16, color: textColor),
                  ),
                ],
              )
            : Text(text, style: TextStyle(fontSize: 16, color: textColor)),
      ),
    );
  }
}
