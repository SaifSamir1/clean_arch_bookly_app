




import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.backGroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    required this.onPressed,
    this.fontSize,
    super.key,
  });

  final Color backGroundColor;
  final String text;
  final double? fontSize;
  final Color textColor;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed:onPressed ,
        style:TextButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
                borderRadius:borderRadius ?? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                )
            )
        ) ,
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize ?? 18,
              color:textColor,
              fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}
