import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/functionbloc/functions_bloc.dart';
import 'package:hidhayah/bloc/locationbloc/location_bloc.dart';
import 'package:hidhayah/bloc/statusbloc/status_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/gradient.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/calendar/view/calendarpage.dart';
import 'package:hidhayah/view/common/widgets/customtext.dart';
import 'package:hidhayah/view/dashboard/widgets/dashboardicons.dart';
import 'package:hidhayah/view/dashboard/widgets/dashheadleft.dart';
import 'package:hidhayah/view/dashboard/widgets/dashheadright.dart';
import 'package:hidhayah/view/dashboard/widgets/gradientcontainer.dart';
import 'package:hidhayah/view/dashboard/widgets/gradientcontent.dart';
import 'package:hidhayah/view/duas/view/duapage.dart';
import 'package:hidhayah/view/loginsignup/view/login_page.dart';
import 'package:hidhayah/view/nearbymasjid/view/nearbymasjid.dart';
import 'package:hidhayah/view/prayertime/view/prayertime.dart';
import 'package:hidhayah/view/profile/view/profilepage.dart';
import 'package:hidhayah/view/qibladirection/view/qibladirectionpage.dart';
import 'package:hidhayah/view/quiz/view/quizpage.dart';
import 'package:hidhayah/view/quran/view/quranpage.dart';
import 'package:hidhayah/view/tasbihpage.dart/view/tasbihpage.dart';
import 'package:hidhayah/view/videospage/view/videospage.dart';
import 'package:intl/intl.dart';

class DashboardpageWrapper extends StatelessWidget {
  const DashboardpageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FunctionsBloc(),
        ),
        BlocProvider(
          create: (context) => LocationBloc()..add(LocationFetchEvent()),
        ),
        BlocProvider(
          create: (context) => StatusBloc(),
        ),
      ],
      child: const DashBoardPage(),
    );
  }
}

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  // late UserModel user;
  String? city;
  String? country;
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
  }

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
                          text: 'Assalamu Alaikum,',
                          style: TextStyles.dashboardHeadStyle,
                        ),
                        BlocListener<FunctionsBloc, FunctionsState>(
                          listener: (context, state) {
                            if (state is Loading) {
                              print('loading');
                            }
                            if (state.status == Status.loggedIn) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const ProfilePageWrapper()));
                            }
                            if (state.status == Status.notLoggedIn) {
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
                        GestureDetector(
                          onTap: () {
                            if (city != null && country != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => PrayerTimeWrapper(
                                            city: city!,
                                            country: country!,
                                          )));
                            } else {
                              print('retry');
                            }
                          },
                          child: DashHeadLeft(
                            salah: DateFormat('hh:mm a').format(DateTime.now()),
                          ),
                        ),
                        BlocBuilder<LocationBloc, LocationState>(
                          builder: (context, state) {
                            if (state is LocationFetchState) {
                              latitude = state.latitude;
                              longitude = state.longitude;
                              city = state.city;
                              country = state.country;
                              return DashHeadRight(
                                date: DateFormat('dd MMM yyyy')
                                    .format(DateTime.now()),
                                place: city ?? 'loading...',
                              );
                            }
                            return const Text('Loading...');
                          },
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
                    color: Constants.greenDark2,
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
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const QuranpageWrapper()));
                            },
                            size: size,
                            gradient: Gradients.gradientBox1,
                            child: GradientContainerContent(
                              title: 'Read the\nQuran',
                              icon: Constants.arrowRight,
                            ),
                          ),
                          GradientContainer(
                            onTap: () {
                              if (city != null && country != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PrayerTimeWrapper(
                                              city: city!,
                                              country: country!,
                                            )));
                              } else {
                                print('retry');
                              }
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const VideospageWrapper()));
                            },
                            size: size,
                            gradient: Gradients.gradientBox4,
                            child: const GradientContainerContent(
                              title: 'Videos',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DashboardIcons(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const QiblaDir()));
                                  },
                                  text: 'Qibla',
                                  image: Constants.qiblaDirIcon,
                                  padding: const EdgeInsets.all(5),
                                ),
                                DashboardIcons(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const DuapageWrapper()));
                                    },
                                    text: 'Duas',
                                    image: Constants.duaIcon),
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocListener<StatusBloc, StatusState>(
                                  listener: (context, state) {
                                    if (state is Loading) {
                                      print('loading');
                                    }
                                    if (state is StatusCheckState) {
                                      if (state.status == Status.loggedIn) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const QuizpageWrapper()));
                                      } else if (state.status ==
                                          Status.notLoggedIn) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            const SnackBar(
                                                content: Text('Plase Log in!')),
                                          );
                                      }
                                    }
                                  },
                                  child: DashboardIcons(
                                    onTap: () {
                                      context
                                          .read<StatusBloc>()
                                          .add(CheckStatusQuizEvent());
                                    },
                                    text: 'Quiz',
                                    image: Constants.quiz,
                                    padding: const EdgeInsets.all(5),
                                  ),
                                ),
                                DashboardIcons(
                                  text: 'Calendar',
                                  image: Constants.calendar,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const CalendarPage()));
                                  },
                                ),
                                DashboardIcons(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => NearbyWrapper(
                                            latitude: latitude!,
                                            longitude: longitude!,
                                          ),
                                        ),
                                      );
                                    },
                                    text: 'Masgid Near Me',
                                    image: Constants.mapIcon),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ))));
  }
}
