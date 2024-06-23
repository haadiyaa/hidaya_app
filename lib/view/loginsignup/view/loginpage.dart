import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/loginsignup/widgets/loginwidget.dart';
import 'package:hidhayah/view/loginsignup/widgets/signup_widget.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late LoginBloc loginBloc;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    loginBloc=LoginBloc();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Constants.greenLight,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(5, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TabBar(
              unselectedLabelColor: Constants.greenDark,
              splashBorderRadius: BorderRadius.circular(30),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Constants.transparent,
              dividerColor: Constants.transparent,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(95, 46, 63, 32),
                    Color.fromARGB(95, 35, 58, 13),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              tabs: const [
                Tab(
                  text: 'Sign In',
                ),
                Tab(
                  text: 'Sign Up',
                ),
                // Tab(
                //   text: 'Forgot Password',
                // ),
              ],
              controller: tabController,
            ),
          ),
        ),
      ),
      backgroundColor: Constants.greenDark,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: size.height * 0.3,
              width: size.width * 0.4,
              child: LottieBuilder.asset(Constants.loginanimation2),
            ),
          ),
          BlocProvider(
            create: (context) => loginBloc,
            child: TabBarView(
              controller: tabController,
              children: [
                // LoginWidget(
                //   controller: tabController,
                // ),
                SignUpWidget(
                  controller: tabController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
