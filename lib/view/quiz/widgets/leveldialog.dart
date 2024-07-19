
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class LevelDialog extends StatelessWidget {
  const LevelDialog({
    super.key,
    required this.size,
    required this.category,
  });

  final Size size;
  final String category;

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
                'Select Level',
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
                height: 190,
                width: size.width * 0.8,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    color: Constants.black,
                  ),
                  itemCount: Constants.quizLevel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        Navigator.pop(
                          context,
                          {
                            'category': category,
                            'level': Constants.quizLevel[index],
                          },
                        );
                      },
                      dense: true,
                      title: Text(Constants.quizLevel[index]),
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
