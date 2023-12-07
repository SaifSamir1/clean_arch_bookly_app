import 'package:bookly/Features/Splash/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_bottom.dart';

class MainBookSelectionScreenBody extends StatelessWidget {
  const MainBookSelectionScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'What is your main interest in books ?',
              style: Styles.textStyle30.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .22,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomTextField(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          const Center(
            child: CustomBottom(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
        ],
      ),
    );
  }
}

