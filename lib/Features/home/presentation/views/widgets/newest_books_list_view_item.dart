import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/functions/delete_box_from_hive.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_list_view_item_image.dart';

class NewestBookListViewItem extends StatelessWidget {
  const NewestBookListViewItem({super.key, required this.book});
final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        deleteAllData(boxNamed: kSimilarBox);
        Future.delayed(const Duration(milliseconds: 200),(){
          GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book);
        });
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: CustomListViewItemImage(
                  imageUrl: book.image ?? 'https://th.bing.com/th/id/OIP.yVPcqCZQLPX9NJic_Pnh4AHaHa?pid=ImgDet&rs=1',),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                  book.authorName ?? 'un knowing ',
                    style: Styles.textStyle14,
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: book.rating ?? 0,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
