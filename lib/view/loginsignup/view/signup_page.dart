import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/loginsignup/widgets/signup_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.greenDark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop(MyAppRouteConstants.loginPopRoute);
            },
            icon: const Icon(Icons.cancel_outlined),
          ),
        ],
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(child: BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
            child: SignUpWidget(
                  // controller: tabController,
                ),
          ),)
        ],),
      ),
    );
  }
}