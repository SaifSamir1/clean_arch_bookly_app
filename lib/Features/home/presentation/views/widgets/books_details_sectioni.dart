import 'package:flutter/material.dart';

import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookDetails});

  final BookEntity bookDetails;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child:  CustomBookImage(imageUrl:bookDetails.image?? 'https://th.bing.com/th/id/OIP.yVPcqCZQLPX9NJic_Pnh4AHaHa?pid=ImgDet&rs=1',),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookDetails.title,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookDetails.authorName ?? 'Unknown',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center, rating:bookDetails.rating ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksAction(bookEntity: bookDetails,),
      ],
    );
  }
}
