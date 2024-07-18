
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/videospage/widgets/shimmerlist.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerYoutube extends StatelessWidget {
  const ShimmerYoutube({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Constants.greenDark,
            highlightColor: Constants.greenDark2,
            child: Container(
              color: Constants.greenDark,
              width: size.width,
              height: size.height * 0.3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            child: Text(
              'Kids', 
              style: TextStyles.gradContainerTextStyle,
            ),
          ),
          Shimmerlist(
            size: size,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            child: Text(
              'Umar (R. A.)',
              style: TextStyles.gradContainerTextStyle,
            ),
          ),
          Shimmerlist(
            size: size,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            child: Text(
              'The Jannath',
              style: TextStyles.gradContainerTextStyle,
            ),
          ),
          Shimmerlist(
            size: size,
          ),
        ],
      );
  }
}
