




import 'package:bookly/Features/Splash/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/build_future_delay.dart';
import '../../../../../core/utils/functions/hive_service.dart';
import '../../../../../core/widgets/custom_alert_dialog.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        onPressed: () {
          if(mainBooksController.text.isNotEmpty)
            {
              myBox!.put("selectingBooks", "true");
              myBox!.put("mainBooks", mainBooksController.text);
              mainBooks = myBox!.get("mainBooks");
              buildFutureDelayedFunction(
                duration: const Duration(milliseconds: 300),
                function: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                },
              );
            }
          else{
            _showCustomDialog(context);
          }
        },
        color: Colors.grey,
        height: 50,
        child: const Text(
          'Go to Home Screen',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Use a custom AlertDialog widget
        return CustomAlertDialog(
          title: '',
          content: 'Please Enter your main books\'s name',
          nameOfPositiveButton: 'Ok',
          nameOfNegativeButton: 'Cancel',
          onPositiveButtonPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          onNegativeButtonPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            // Add custom logic for negative button
          },
        );
      },
    );
  }
}
