
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class DuapageListShimmer extends StatelessWidget {
  const DuapageListShimmer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          padding: const EdgeInsets.all(10),
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return Constants.height10;
        },
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: Constants.greenDark,
            highlightColor: Constants.greenDark2,
            child: Container(
              width: size.width * 0.9,
              height: size.height*0.1,
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.lightgreengrey,
              ),
            ),
          );
        },
      );
  }
}
