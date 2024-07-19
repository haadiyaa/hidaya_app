
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/utils/constants/constants.dart';

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
        height: size.height * 0.5,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.lightgreengrey,
              ),
              child: Text(
                'Select Category',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Constants.greenDark),
              ),
            ),
            Constants.height20,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Constants.lightgreengrey,
              ),
              child: SizedBox(
                height: 150,
                width: size.width * 0.8,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    color: Constants.black,
                  ),
                  itemCount: Constants.quizCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        // category= Constants.quizCategory[index];
                        Navigator.pop(context, Constants.quizCategory[index]);
                      },
                      dense: true,
                      title: Text(Constants.quizCategory[index]),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
