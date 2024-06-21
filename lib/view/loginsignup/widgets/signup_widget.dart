import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/loginsignup/widgets/custombutton.dart';
import 'package:hidhayah/view/loginsignup/widgets/customlightbutton.dart';
import 'package:hidhayah/view/loginsignup/widgets/customtextfield.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({
    super.key, required this.controller,
  });

final TabController controller;
  final _key = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
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
            boxShadow: const[ BoxShadow(offset: Offset(5, 5),blurRadius: 10)]

          ),
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
                  label: 'User Name',
                  controller: userNameController,
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
                  label: 'Email',
                  controller: emailController,
                  focusNode: emailFocusNode,
                  textInputType: TextInputType.emailAddress,
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
                CusomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Plase enter something';
                    }
                    return null;
                  },
                  label: 'Confirm Password',
                  controller: passController,
                  focusNode: passFocusNode,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  size: size,
                  text: 'Sign Up',
                  onPressed: () {
                    if (_key.currentState!.validate()) {}
                  },
                ),
                Constants.height15,
                GestureDetector(
                  onTap: () {
                    controller.animateTo(0);
                  },
                  child: const Text(
                    'Already have an account?  Sign In!',
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
