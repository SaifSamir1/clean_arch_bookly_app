import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_consumer.dart';
import 'newest_books_list_view_bloc_consumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
            padding: EdgeInsets.only(
              left: 20
            ),
            child: CustomAppBar()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Other books that might like you :',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: kGtSectraFine,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const FeaturedBooksListViewBlocConsumer(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Main Books',
            style: Styles.textStyle20.copyWith(
              fontFamily: kGtSectraFine,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: NewestBooksListViewBlocConsumer(),
          ),
        ),
      ],
    );
  }
}



