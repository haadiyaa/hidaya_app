import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/model/usermodel.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/loginsignup/widgets/custombutton.dart';
import 'package:hidhayah/view/loginsignup/widgets/customtextfield.dart';
import 'package:hidhayah/view/profile/view/profilepage.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({
    super.key,
    required this.controller,
  });

  final TabController controller;
  final _key = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController pass2Controller = TextEditingController();

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
                  label: 'User Name',
                  controller: userNameController,
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
                  textInputType: TextInputType.visiblePassword,
                ),
                CusomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Plase enter something';
                    } else if (passController.text.trim() !=
                        pass2Controller.text.trim()) {
                      return 'Please enter same password';
                    }
                    return null;
                  },
                  label: 'Confirm Password',
                  controller: pass2Controller,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.loginStatus == LoginStatus.error) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text(state.message.toString())),
                        );
                    }
                    if (state.loginStatus == LoginStatus.loading) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Submitting...')),
                        );
                    }
                    if (state.loginStatus == LoginStatus.success) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(content: Text('Sign up successfull!')),
                        );
                      controller.animateTo(0);
                    }
                    // else {
                    //   ScaffoldMessenger.of(context)
                    //   ..hideCurrentSnackBar()
                    //   ..showSnackBar(const SnackBar(
                    //       content: Text('Sign up not successfull!')));
                    // }
                  },
                  child: CustomButton(
                    size: size,
                    text: 'Sign Up',
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                      final user = UserModel(
                        email: emailController.text.trim(),
                        name: userNameController.text.trim(),
                        password: passController.text.trim(),
                      );
                      context.read<LoginBloc>().add(
                            SignUpApi(
                              user: user,
                            ),
                          );
                      }
                    },
                  ),
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
