import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';
import 'package:hidhayah/view/loginsignup/view/signup_page.dart';
import 'package:hidhayah/view/loginsignup/widgets/custombutton.dart';
import 'package:hidhayah/view/loginsignup/widgets/customtextfield.dart';
import 'package:hidhayah/view/loginsignup/widgets/forgotpasswordwidget.dart';
import 'package:hidhayah/view/profile/view/profilepage.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

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
            boxShadow: const [BoxShadow(offset: Offset(5, 5), blurRadius: 10)],
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
                  label: 'Email',
                  controller: emailController,
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
                  textInputType: TextInputType.visiblePassword,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     showBottomSheet(
                    //       backgroundColor: Constants.greenLight,
                    //       enableDrag: true,
                    //       showDragHandle: true,
                    //       context: context,
                    //       builder: (context) {
                    //         return SingleChildScrollView(
                    //           child: BottomSheet(
                    //             enableDrag: true,
                    //             backgroundColor: Constants.greenLight,
                    //             onClosing: () {},
                    //             builder: (context) {
                    //               return ForgotPasseordWrapper(size: size);
                    //             },
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   },
                    //   child: const Padding(
                    //     padding: EdgeInsets.only(bottom: 10.0),
                    //     child: Text(
                    //       'Forgot Password?',
                    //       style: TextStyles.forgotPasStyle,
                    //     ),
                    //   ),
                    // ),
                    Constants.height10
                  ],
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
                          const SnackBar(content: Text('Sign in successfull!')),
                        );
                      // final user =
                      //     UserModel(name: state.name, email: state.email);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ProfilePageWrapper()));
                      // GoRouter.of(context)
                      //         .pushReplacementNamed(MyAppRouteConstants.profileRoute,extra: user);
                    }
                  },
                  child: CustomButton(
                    size: size,
                    text: 'Sign In',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_key.currentState!.validate()) {
                        context.read<LoginBloc>().add(LoginApi(
                            email: emailController.text.trim(),
                            password: passController.text.trim()));
                      }
                    },
                  ),
                ),
                Constants.height15,
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const SignUpPage()));
                    // GoRouter.of(context)
                    //             .pushReplacementNamed(MyAppRouteConstants.signup);
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
