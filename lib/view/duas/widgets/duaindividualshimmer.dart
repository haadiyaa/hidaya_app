
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class DuaIndividualShimmer extends StatelessWidget {
  const DuaIndividualShimmer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: 5,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 0.5);
      },
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Constants.greenDark,
              highlightColor: Constants.greenDark2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 20,
                width: size.width,
              ),
            ),
            Constants.height15,
            Shimmer.fromColors(
              baseColor: Constants.greenDark,
              highlightColor: Constants.greenDark2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 10,
                width: size.width*0.7,
              ),
            ),
            Constants.height20,
            Shimmer.fromColors(
              baseColor: Constants.greenDark,
              highlightColor: Constants.greenDark2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 20,
                width: size.width*0.7,
              ),
            ),
            Constants.height10,
            Shimmer.fromColors(
              baseColor: Constants.greenDark,
              highlightColor: Constants.greenDark2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)), 
                height: 20,
                width: size.width*0.7,
              ),
            ),
            Constants.height10,
          ],
        );
      },
    );
  }
}
