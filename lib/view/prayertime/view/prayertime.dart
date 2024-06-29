import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/prayertimesbloc/prayertime_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/functions/functions.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:intl/intl.dart';

class PrayerTimeWrapper extends StatelessWidget {
  const PrayerTimeWrapper(
      {super.key, required this.city, required this.country});
  final String city;
  final String country;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayertimeBloc(),
      child: PrayerTime(
        city: city,
        country: country,
      ),
    );
  }
}

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key, required this.city, required this.country});
  final String city;
  final String country;

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  final PrayertimeBloc prayertimeBloc = PrayertimeBloc();
  @override
  void initState() {
    super.initState();
    prayertimeBloc
        .add(FetchPrayerTimeEvent(city: widget.city, country: widget.country));
  }

  @override
  void dispose() {
    super.dispose();
    prayertimeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<PrayertimeBloc, PrayertimeState>(
      bloc: prayertimeBloc,
      builder: (context, state) {
        if (state is FetchPrayerTimeState) {
          final time = state.prayerTimeModel;
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
                              final prayer = Constants.prayer[index];
                              String prayerTime="";
                              switch (prayer) {
                                case "Fajr":
                                  prayerTime = '${time.data[0].timings.Fajr.split(' ')[0]}:00';
                                  break;
                                case "Dhuhr":
                                  prayerTime = '${time.data[0].timings.Dhuhr.split(' ')[0]}:00';
                                  break;
                                case "Asr":
                                  prayerTime = '${time.data[0].timings.Asr.split(' ')[0]}:00';
                                  break;
                                case "Maghrib":
                                  prayerTime = '${time.data[0].timings.Maghrib.split(' ')[0]}:00';
                                  break;
                                case "Isha":
                                  prayerTime = '${time.data[0].timings.Isha.split(' ')[0]}:00';
                                  break;
                                default:
                                  prayerTime = "N/A";
                              }
                              return ListTile(
                                title: Text(
                                  prayer,
                                  style: TextStyles.forgotLabelStyle,
                                ),
                                trailing: Text(
                                  Functions.convertTime(prayerTime),
                                  style: TextStyles.forgotLabelStyle,
                                ),
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
        if (state is FetchPrayerTimeErrorState) {
          Scaffold(
            body: Center(
              child: Text(state.msg),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
