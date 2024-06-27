import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/functionbloc/functions_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/gradient.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/common/widgets/customtext.dart';
import 'package:hidhayah/view/dashboard/widgets/dashboardicons.dart';
import 'package:hidhayah/view/dashboard/widgets/dashheadleft.dart';
import 'package:hidhayah/view/dashboard/widgets/dashheadright.dart';
import 'package:hidhayah/view/dashboard/widgets/gradientcontainer.dart';
import 'package:hidhayah/view/dashboard/widgets/gradientcontent.dart';
import 'package:hidhayah/view/loginsignup/view/login_page.dart';
import 'package:hidhayah/view/prayertime/view/prayertime.dart';
import 'package:hidhayah/view/profile/view/profilepage.dart';
import 'package:hidhayah/view/qibladirection/view/qibladirectionpage.dart';
import 'package:hidhayah/view/tasbihpage.dart/view/tasbihpage.dart';
import 'package:intl/intl.dart';

class DashboardpageWrapper extends StatelessWidget {
  const DashboardpageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FunctionsBloc>(
      create: (context) => FunctionsBloc(),
      child: DashBoardPage(),
    );
  }
}

class DashBoardPage extends StatelessWidget {
  DashBoardPage({super.key});
  late UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: Constants.dashHeadPadd,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Salaam,',
                            style: TextStyles.dashboardHeadStyle,
                          ),
                          BlocListener<FunctionsBloc, FunctionsState>(
                            listener: (context, state) {
                              if (state is Loading) {
                                print('loading');
                              }
                              if (state.user != null) {
                                user = state.user!;
                              }
                              if (state.status == Status.loggedIn) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ProfilePageWrapper(
                                            userModel: user)));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginPagee()));
                              }
                            },
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<FunctionsBloc>()
                                    .add(const CheckStatusEvent());
                              },
                              child: CircleAvatar(
                                backgroundColor: Constants.gradGreenDark,
                                child: Constants.profile,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Constants.height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const DashHeadLeft(
                            salah: 'Asr',
                          ),
                          DashHeadRight(
                            date: DateFormat('dd MMM yyyy')
                                .format(DateTime.now()),
                            place: 'Kozhikode',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Constants.height8,
                Expanded(
                  child: Container(
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
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>const PrayerTimeWrapper()));
                              },
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
                                title: 'Islamic ',
                                subtitle: 'Watch',
                              ),
                            ),
                          ],
                        ),
                        Constants.height10,
                        Padding(
                          padding: Constants.mainContainSubPadd,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DashboardIcons(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const QiblaDir()));
                                    },
                                    text: 'Qibla',
                                    image: Constants.qiblaDirIcon,
                                    padding: const EdgeInsets.all(5),
                                  ),
                                  const DashboardIcons(
                                      text: 'Duas', image: Constants.duaIcon),
                                  DashboardIcons(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const TasbihPageWrapper()));
                                    },
                                    text: 'Tasbih',
                                    image: Constants.tasbih2,
                                  ),
                                ],
                              ),
                              Constants.height20,
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        // Constants.height20,
                        // Container(
                        //   padding: Constants.duaBoxPadd,
                        //   width: size.width,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Constants.lightGreen,
                        //   ),
                        //   child: const Text('data'),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
