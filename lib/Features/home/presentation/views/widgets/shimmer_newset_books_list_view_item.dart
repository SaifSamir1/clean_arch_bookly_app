









import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewestListViewItem extends StatelessWidget {
  const ShimmerNewestListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
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
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.4 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Container(
                    color: Colors.white,
                    height: 18,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Container(
                      color: Colors.white,
                      height: 18,
                      width: double.infinity,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                        child: Container(
                          color: Colors.white,
                          height: 18,
                          width: double.infinity,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                        child: Container(
                          color: Colors.white,
                          height: 18,
                          width: double.infinity,
                        ),)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
