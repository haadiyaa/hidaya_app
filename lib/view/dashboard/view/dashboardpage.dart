import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/gradient.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/common/widgets/customtext.dart';
import 'package:hidhayah/view/dashboard/widgets/dashboardicons.dart';
import 'package:hidhayah/view/dashboard/widgets/dashheadleft.dart';
import 'package:hidhayah/view/dashboard/widgets/dashheadright.dart';
import 'package:hidhayah/view/dashboard/widgets/gradientcontainer.dart';
import 'package:hidhayah/view/dashboard/widgets/gradientcontent.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: Constants.dashHeadPadd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Salaam,',
                      style: TextStyles.dashboardHeadStyle,
                    ),
                    Constants.height10,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashHeadLeft(
                          salah: 'Asr',
                        ),
                        DashHeadRight(
                          date: '12 June 2024',
                          place: 'Kozhikode',
                        )
                      ],
                    ),
                    // Text('${MediaQuery.of(context).size.width}'),
                    // Text('${MediaQuery.of(context).size.height}'),
                  ],
                ),
              ),
              Constants.height8,
              Container(
                padding: Constants.mainContainPadd,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Constants.greenDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientContainer(
                          size: size,
                          gradient: Gradients.gradientBox1,
                          child: GradientContainerContent(
                            title: 'Read the\nQuran',
                            icon: Constants.arrowRight,
                          ),
                        ),
                        GradientContainer(
                          size: size,
                          gradient: Gradients.gradientBox2,
                          child: GradientContainerContent(
                            title: 'Track\nPrayers',
                            icon: Constants.arrowRight,
                          ),
                        )
                      ],
                    ),
                    Constants.height20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientContainer(
                          size: size,
                          gradient: Gradients.gradientBox3,
                          child: const GradientContainerContent(
                            title: 'Salah',
                            subtitle: 'Learn',
                          ),
                        ),
                        GradientContainer(
                          size: size,
                          gradient: Gradients.gradientBox4,
                          child: const GradientContainerContent(
                            title: 'Islamic Videos',
                            subtitle: 'Watch',
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: Constants.mainContainSubPadd,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardIcons(
                                text: 'Qibla',
                                image: Constants.qiblaDirIcon,
                                padding: EdgeInsets.all(5),
                              ),
                              DashboardIcons(
                                  text: 'Duas', image: Constants.duaIcon),
                              DashboardIcons(
                                  text: 'Tasbih', image: Constants.tasbih2),
                            ],
                          ),
                          Constants.height20,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardIcons(
                                text: 'Quiz',
                                image: Constants.quiz,
                                padding: EdgeInsets.all(5),
                              ),
                              DashboardIcons(
                                  text: 'Calendar',
                                  image: Constants.calendar),
                              DashboardIcons(
                                  text: 'Masgid Near Me',
                                  image: Constants.mapIcon),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Constants.height20,
                    Container(
                      padding: Constants.duaBoxPadd,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.grey,
                      ),
                      child: const Text('data'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
