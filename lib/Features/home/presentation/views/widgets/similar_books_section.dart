
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.bookCategory});

  final String bookCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SimilarBooksListViewBlocConsumer(bookCategory: bookCategory,),
      ],
    );
  }
}
