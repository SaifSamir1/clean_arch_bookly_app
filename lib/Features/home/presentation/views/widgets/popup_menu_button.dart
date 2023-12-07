


import 'package:bookly/Features/Splash/presentation/views/widgets/custom_text_form_field.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/functions/delete_box_from_hive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/functions/hive_service.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';

class PopupMenuButtonWidget extends StatelessWidget {
  const PopupMenuButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value:'option1' ,
          child: Text('Change Main Books',
            style: Styles.textStyle16.copyWith(
                color: kPrimaryColor
            ),
          ),
        ),
      ],
      position: PopupMenuPosition.under,
      onSelected: (value){
        _showCustomDialog(context);
      },
      color: Colors.white,
      child: const Icon(
        Icons.more_vert,
        size: 28,
      ),
    );
  }
}

void _showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Use a custom AlertDialog widget
      return CustomAlertDialog(
        title: '',
        content: 'Are you sure you want to change the main books?',
        nameOfPositiveButton: 'Yes',
        nameOfNegativeButton: 'Cancel',
        onPositiveButtonPressed: () {
          deleteAllData(boxNamed:kNewestBox);
          myBox!.put("selectingBooks", "false");
          mainBooksController.clear();
          Future.delayed(const Duration(milliseconds:300),(){
            GoRouter.of(context).pushReplacement(AppRouter.kSelectionBooksView);
          });
          },
        onNegativeButtonPressed: () {
          Navigator.of(context).pop(); // Close the dialog
          // Add custom logic for negative button
        },
      );
    },
  );
}


