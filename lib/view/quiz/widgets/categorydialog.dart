import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class CategoryDialog extends StatelessWidget {
  const CategoryDialog({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.transparent,
      alignment: Alignment.center,
      content: SizedBox(
        height: size.height * 0.3,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Constants.lightgreengrey,
          ),
          child: Column(
            children: [
              Text(
                'Select Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Constants.greenDark,
                ),
              ),
              Constants.height25,
              SizedBox(
                height: size.height * 0.18,
                width: size.width * 0.8,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Constants.height15,
                  itemCount: Constants.quizCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NeumorphicButton(
                      bottomRightShadowBlurRadius: 15,
                      bottomRightShadowSpreadRadius: 1,
                      borderRadius: 10,
                      backgroundColor: Constants.lightgreengrey,
                      topLeftShadowBlurRadius: 10,
                      topLeftShadowSpreadRadius: 1,
                      topLeftShadowColor: Constants.white,
                      bottomRightShadowColor: Colors.black,
                      height: size.height * 0.05,
                      width: size.width * 0.35,
                      bottomRightOffset: const Offset(4, 5),
                      topLeftOffset: const Offset(-4, -4),
                      padding: const EdgeInsets.all(5),
                      onTap: () {
                        // category= Constants.quizCategory[index];
                        Navigator.pop(
                            context, Constants.quizCategory[index]);
                      },
                      child: Center(
                        child: Text(
                          Constants.quizCategory[index],
                          style: TextStyles.size18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
