import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:shimmer/shimmer.dart';

class SalatPage extends StatelessWidget {
  const SalatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark,
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Constants.greenLight,
          highlightColor: Constants.greenDark2,
          child: Text('COMING SOON...',style: TextStyles.size20,),
        ),
      ),
    );
  }
}
