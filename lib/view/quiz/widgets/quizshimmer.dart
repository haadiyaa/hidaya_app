
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class QuizShimmer extends StatelessWidget {
  const QuizShimmer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text('1 out of 10'),
            ],
          ),
        ),
        Constants.height10,
        Shimmer.fromColors(
          baseColor: Constants.greenDark,
          highlightColor: Constants.greenDark2,
          child: Container(
            width: size.width * 0.9,
            padding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.greenLight),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1.'),
                Text('mnbvfcxsdfghnbvfghjk\nbvnbgfth'),
              ],
            ),
          ),
        ),
        Constants.height15,
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            // separatorBuilder: (BuildContext context, int index) {
            //   return Constants.height8;
            // },
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Constants.greenDark,
                highlightColor: Constants.greenDark2,
                child: Container(
                  width: size.width * 0.9,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Constants.greenLight),
                  child: const Text('data'),
                ),
              );
            },
          ),
        ),
        // Expanded(
        //   child: Column(
        //     children: [
        //       Container(
        //         width: size.width * 0.9,
        //         padding: const EdgeInsets.symmetric(
        //             horizontal: 15, vertical: 10),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Constants.greenLight),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
