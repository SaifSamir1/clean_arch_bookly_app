
import 'package:bookly/Features/home/presentation/views/widgets/shimmer_featured_books_list_view_item.dart';
import 'package:flutter/material.dart';



class ShimmerSimilarListView extends StatelessWidget {
  const ShimmerSimilarListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index) {
          return const Padding(
            padding: EdgeInsets.only(right: 5, top: 15),
            child: ShimmerFeaturedListViewItem(),
          );
        },
        itemCount: 10,),
    );
  }
}