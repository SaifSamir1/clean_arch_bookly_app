







import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFeaturedListViewItem extends StatelessWidget {
  const ShimmerFeaturedListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 4,
      child: Shimmer(
        gradient: LinearGradient(
          colors: [
            Colors.grey[400]!,
            Colors.grey[300]!,
            Colors.grey[400]!,
          ],
          stops: const [
            0.1,
            0.5,
            0.9,
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
