import 'package:bookly/Features/Splash/presentation/views/widgets/main_book_selection_screen_body.dart';
import 'package:flutter/material.dart';

class MainBookSelectionScreen extends StatelessWidget {
  const MainBookSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MainBookSelectionScreenBody(),
      ),
    );
  }
}
