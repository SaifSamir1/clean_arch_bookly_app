import 'package:bookly/Features/home/presentation/views/widgets/shimmer_newset_books_list_view_item.dart';
import 'package:flutter/material.dart';

class ShimmerNewestListView extends StatelessWidget {
  const ShimmerNewestListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ShimmerNewestListViewItem(),
        );
      },
      itemCount: 10,
    );
  }
}

