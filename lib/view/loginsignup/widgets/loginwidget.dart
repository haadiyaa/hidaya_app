import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidhayah/routes/approuteconst.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/loginsignup/widgets/custombutton.dart';
import 'package:hidhayah/view/loginsignup/widgets/customtextfield.dart';
import 'package:hidhayah/view/loginsignup/widgets/forgotpasswordwidget.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({
    super.key,
    required this.controller,
  });
  final TabController controller;

  final _key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final userFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Constants.greenLight,
              boxShadow: const [
                BoxShadow(offset: Offset(5, 5), blurRadius: 10)
              ]),
          child: Form(
            key: _key,
            child: Column(
              children: [
                CusomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Plase enter something';
                    }
                    return null;
                  },
                  label: 'Email',
                  controller: emailController,
                  focusNode: userFocusNode,
                  textInputType: TextInputType.name,
                ),
                CusomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Plase enter something';
                    }
                    return null;
                  },
                  label: 'Password',
                  controller: passController,
                  focusNode: passFocusNode,
                  textInputType: TextInputType.visiblePassword,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showBottomSheet(
                          backgroundColor: Constants.greenLight,
                          enableDrag: true,
                          showDragHandle: true,
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              child: BottomSheet(
                                enableDrag: true,
                                backgroundColor: Constants.greenLight,
                                onClosing: () {},
                                builder: (context) {
                                  return ForgotPasswordWidget(size: size);
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.forgotPasStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  size: size,
                  text: 'Sign In',
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      GoRouter.of(context)
                          .pushNamed(MyAppRouteConstants.profileRoute);
                    }
                  },
                ),
                Constants.height15,
                GestureDetector(
                  onTap: () {
                    controller.animateTo(1);
                  },
                  child: const Text(
                    'Don\'t have an account?  Register Now!',
                    style: TextStyles.loginfooterStyle,
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
