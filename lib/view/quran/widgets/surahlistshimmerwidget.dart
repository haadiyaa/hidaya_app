
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class SurahlistShimmerWidget extends StatelessWidget {
  const SurahlistShimmerWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                loop: 10,
                baseColor: Constants.greenDark,
                highlightColor: Constants.greenDark2,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Constants.greenDark,
                  ),
                ),
              ),
              Constants.width20,
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    loop: 10,
                    baseColor: Constants.greenDark,
                    highlightColor: Constants.greenDark2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8),
                        color: Constants.greenDark,
                      ),
                      height: 20,
                      width: size.width * 0.6,
                    ),
                  ),
                  Constants.height5,
                  Shimmer.fromColors(
                    loop: 10,
                    baseColor: Constants.greenDark,
                    highlightColor: Constants.greenDark2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8),
                        color: Constants.greenDark,
                      ),
                      height: 10,
                      width: size.width * 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
