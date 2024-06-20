import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';
import 'package:hidhayah/utils/styles/borderstyles.dart';
import 'package:hidhayah/utils/styles/textstyle.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({
    super.key,
  });

  // final GlobalKey _key=GlobalKey<FormState>();
  final TextEditingController userNameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passController=TextEditingController();

  final userFocusNode=FocusNode();
  final emailFocusNode=FocusNode();
  final passFocusNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Constants.greenLight,
        ),
        child: Column(
          children: [
            CusomTextField(label: 'User Name',controller: userNameController,focusNode: userFocusNode,textInputType: TextInputType.name,),
            CusomTextField(label: 'Email',controller: emailController,focusNode: emailFocusNode,textInputType: TextInputType.emailAddress,),
            CusomTextField(label: 'Password',controller: passController,focusNode: passFocusNode,textInputType: TextInputType.visiblePassword,),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}

class CusomTextField extends StatelessWidget {
  const CusomTextField({
    super.key, required this.label, required this.controller, required this.focusNode, required this.textInputType,
  });
  final FocusNode focusNode;
  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
      child: TextFormField(
        keyboardType: textInputType,
        focusNode: focusNode,
        controller: controller,
        // autofocus: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyles.loginLabelStyle,
          enabledBorder: BorderStyles.textfieldBorder,
          focusedBorder: BorderStyles.textfieldBorder,
          focusedErrorBorder: BorderStyles.textfieldBorder,
          errorBorder: BorderStyles.textfieldBorder,
        ),
      ),
    );
  }
}
