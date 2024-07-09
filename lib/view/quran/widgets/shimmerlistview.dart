
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerlistView extends StatelessWidget {
  const ShimmerlistView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Constants.greenDark,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Constants.greenDark,
                            highlightColor: Constants.greenDark2,
                            child: Container(
                              height: 15,
                              width: size.width * 0.9,
                              decoration: const BoxDecoration(
                                  color: Constants.black),
                            ),
                          ),
                          Constants.height5,
                          Shimmer.fromColors(
                            baseColor: Constants.greenDark,
                            highlightColor: Constants.greenDark2,
                            child: Container(
                              height: 15,
                              width: size.width * 0.4,
                              decoration: const BoxDecoration(
                                  color: Constants.black),
                            ),
                          ),
                        ],
                      ),
                      Constants.height10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Constants.greenDark,
                            highlightColor: Constants.greenDark2,
                            child: Container(
                              height: 20,
                              width: size.width * 0.9,
                              decoration: const BoxDecoration(
                                  color: Constants.black),
                            ),
                          ),
                          Constants.height5,
                          Shimmer.fromColors(
                            baseColor: Constants.greenDark,
                            highlightColor: Constants.greenDark2,
                            child: Container(
                              height: 20,
                              width: size.width * 0.6,
                              decoration: const BoxDecoration(
                                  color: Constants.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
