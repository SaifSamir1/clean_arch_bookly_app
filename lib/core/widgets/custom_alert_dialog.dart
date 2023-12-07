import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String nameOfPositiveButton;
  final String nameOfNegativeButton;
  final VoidCallback? onPositiveButtonPressed;
  final VoidCallback? onNegativeButtonPressed;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.onPositiveButtonPressed,
    this.onNegativeButtonPressed,
    required this.nameOfPositiveButton,
    required this.nameOfNegativeButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,style: Styles.textStyle16.copyWith(
        color: kPrimaryColor
      ),),
      content: Text(content,style: Styles.textStyle16.copyWith(
          color: kPrimaryColor
      ),),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: onNegativeButtonPressed,
          child: Text(nameOfNegativeButton,style: Styles.textStyle14.copyWith(color: kPrimaryColor,fontWeight: FontWeight.bold),),
        ),
        TextButton(
          onPressed: onPositiveButtonPressed,
          child: Text(nameOfPositiveButton,style: Styles.textStyle16.copyWith(color: kPrimaryColor,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
