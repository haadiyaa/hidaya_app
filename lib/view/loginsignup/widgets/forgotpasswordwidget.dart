import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hidhayah/bloc/loginbloc/login_bloc.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/loginsignup/widgets/customlightbutton.dart';
import 'package:hidhayah/view/loginsignup/widgets/forgottextfield.dart';

class ForgotPasseordWrapper extends StatelessWidget {
  const ForgotPasseordWrapper({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: ForgotPasswordWidget(
        size: size,
      ),
    );
  }
}

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({
    super.key,
    required this.size,
  });
  final TextEditingController emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.greenDark,
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Form(
          key: _key,
          child: Column(
            children: [
              const Text(
                  'Reset your password to regain access to your account.'),
              Constants.height10,
              ForgotTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Plase enter something';
                  }
                  return null;
                },
                label: 'Email',
                controller: emailController,
                focusNode: emailFocusNode,
                textInputType: TextInputType.name,
              ),
              Constants.height10,
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.loading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text(state.message.toString())));
                  }
                  if (state.loginStatus == LoginStatus.restpass) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text(state.message.toString())));
                  }
                },
                child: CustomLightButton(
                  size: size,
                  text: 'Send Mail',
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_key.currentState!.validate()) {
                      context.read<LoginBloc>().add(ForgotPasswordEvent(
                          email: emailController.text.trim()));
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          )),
    );
  }
}
