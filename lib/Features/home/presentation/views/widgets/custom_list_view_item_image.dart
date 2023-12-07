



import 'package:bookly/Features/home/presentation/views/widgets/shimmer_featured_books_list_view_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomListViewItemImage extends StatelessWidget {
  const CustomListViewItemImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: imageUrl,
        //دي الحاجه اللي بتظهر قبل التحميل
        placeholder: (context, url) => const Center(child: ShimmerFeaturedListViewItem()),
        errorWidget:(context, url, error) =>const Icon(Icons.error_rounded) ,
      ),
    );
  }
}
