import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:intl/intl.dart';

class PrayerTimeWrapper extends StatelessWidget {
  const PrayerTimeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrayerTime();
  }
}

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark2,
      appBar: AppBar(
        title: const Text('Prayer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.mainContainSubPadd,
          child: Center(
            child: SizedBox(
              height: size.height,
              child: Column(
                children: [
                  Text(
                    'Today , ${DateFormat('dd MMM yyyy').format(DateTime.now())}',
                    style: TextStyles.prayerTodayStyle,
                  ),
                  Constants.height20,
                  Expanded(
                    child: ListView.builder(
                      itemCount: Constants.prayer.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            Constants.prayer[index],
                            style: TextStyles.forgotLabelStyle,
                          ),
                          trailing: Text('4.02',style: TextStyles.forgotLabelStyle,),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
