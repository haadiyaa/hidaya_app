import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/functionbloc/functions_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/functions/functions.dart';
import 'package:hidhayah/view/about/view/aboutus.dart';
import 'package:hidhayah/view/dashboard/view/dashboardpage.dart';
import 'package:hidhayah/view/privacypolicy/view/privacypolicy.dart';
import 'package:hidhayah/view/profile/widgets/customprofilebutton.dart';

class ProfilePageWrapper extends StatelessWidget {
  const ProfilePageWrapper({
    super.key, // required this.userModel,
  });
  // final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FunctionsBloc(),
      child: const ProfilePage(
          // userModel: userModel,
          ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  // final UserModel userModel;
  const ProfilePage({
    super.key, // required this.userModel,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    // _getUserData();
    user=UserModel(name: 'Loading...',email: 'loading...');
  }

  Future<void> _getUserData() async {
    final user =
        await Functions.fetchUser();
    setState(() {
      this.user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getUserData();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const DashboardpageWrapper()));
            },
            icon: const Icon(Icons.cancel_outlined),
          ),
        ],
        automaticallyImplyLeading: false,
        title: const Text('profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: size.width,
            height: size.height * 0.7,
            decoration: const BoxDecoration(
              color: Constants.greenDark2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Text(
                  user.name ?? 'no name',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  user.email ?? 'no email',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Constants.height20,
                Constants.height10,
                 ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const AboutUs()));
                  },
                  title: const Text(
                    'About Us',
                    style: TextStyle(
                      color: Constants.white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Constants.white,
                  ),
                ),
                const Divider(),
                 ListTile(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const PrivacyPolicy()));
                },
                  title: const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Constants.white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Constants.white,
                  ),
                ),
                Constants.height20,
                BlocListener<FunctionsBloc, FunctionsState>(
                  listener: (context, state) {
                    if (state.status == Status.notLoggedIn) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Signed Out')),
                        );
                      Navigator.pop(context);
                      // GoRouter.of(context).goNamed(
                      //     MyAppRouteConstants.loginRoute);
                    }
                  },
                  child: CustomProfileButton(
                    fgcolor: Constants.greenDark,
                    bgcolor: Constants.greenLight,
                    text: 'Sign Out',
                    onPressed: () {
                      context.read<FunctionsBloc>().add(const LogoutEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
          // Center(
          //   child:
          // ),
        ],
      ),
    );
  }
}
