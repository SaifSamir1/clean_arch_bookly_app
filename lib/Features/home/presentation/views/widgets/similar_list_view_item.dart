import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/entities/book_entity.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/functions/delete_box_from_hive.dart';
import 'custom_list_view_item_image.dart';

class SimilarListViewItem extends StatelessWidget {
  const SimilarListViewItem({Key? key, required this.imageUrl, required this.bookEntity}) : super(key: key);
  final String imageUrl;
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        deleteAllData(boxNamed: kSimilarBox);
        Future.delayed(const Duration(milliseconds: 200),(){
          GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: bookEntity);
        });
      },
      child: CustomListViewItemImage(
        imageUrl: imageUrl,
      ),
    );
  }
}
