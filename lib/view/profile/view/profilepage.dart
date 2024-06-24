import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/bloc/functionbloc/functions_bloc.dart';
import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/profile/widgets/customprofilebutton.dart';

class ProfilePageWrapper extends StatelessWidget {
  const ProfilePageWrapper({
    super.key, required this.userModel,
    // this.name,
    // this.email,
  });
  // final String? name;
  // final String? email;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FunctionsBloc(),
      child: ProfilePage(
        userModel: userModel,
          // name: name,
          // email: email,
          ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  // final String? name;
  // final String? email;
  final UserModel userModel;
  const ProfilePage({
    super.key, required this.userModel,
    // this.name,
    // this.email,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    user=widget.userModel;
    // user = UserModel(
    //   name: widget.name,
    //   email: widget.email,
    // );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.greenDark,
      appBar: AppBar(
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
                // Container(
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle, color: Colors.amber),
                //   clipBehavior: Clip.antiAlias,
                //   height: 100,
                //   width: 100,
                // ),
                 Text(
                   user.name??'no name',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                 Text(
                  user.email??'no email',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Constants.height20,
                CustomProfileButton(
                  onPressed: () {},
                  text: 'Edit Profile',
                ),
                Constants.height10,
                const ListTile(
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      color: Constants.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Constants.white,
                  ),
                ),
                const ListTile(
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Constants.white,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Constants.white,
                  ),
                ),
                Constants.height20,
                BlocListener<FunctionsBloc, FunctionsState>(
                  listener: (context, state) {
                    if (state.status==Status.notLoggedIn) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Signed Out')),
                        );
                      GoRouter.of(context).pushReplacementNamed(
                          MyAppRouteConstants.loginRoute2);
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
