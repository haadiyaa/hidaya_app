import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/loginsignup/widgets/loginwidget.dart';
import 'package:hidhayah/view/loginsignup/widgets/signup_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return
   Scaffold(
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
          // flexibleSpace: ,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Constants.greenLight,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
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
                ],
              controller: tabController,
              ),
            ),
          ),
        ),
        backgroundColor: Constants.greenDark,
        body: TabBarView(
          controller: tabController,
          children: [
            LoginWidget(),
            SignUpWidget(),
            // Icon(Icons.car_crash),
          ],
        ),
   );
  }
}
