







import 'package:bookly/Features/home/presentation/views/widgets/shimmer_featured_books_list_view_item.dart';
import 'package:flutter/material.dart';



class ShimmerFeaturedListView extends StatelessWidget {
  const ShimmerFeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0,),
            child: ShimmerFeaturedListViewItem(),
          );
        },
        itemCount: 5,),
    );
  }
}


