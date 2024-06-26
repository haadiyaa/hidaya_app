
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/view/loginsignup/widgets/customlightbutton.dart';
import 'package:hidhayah/view/loginsignup/widgets/forgottextfield.dart';

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
          child: Column(
        children: [
          const Text('Reset your password to regain access to your account.'),
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
          CustomLightButton(
            size: size,
            text: 'Send Mail',
            onPressed: () {
              if (_key.currentState!.validate()) {
              }
            },
          ),
        ],
      )),
    );
  }
}
