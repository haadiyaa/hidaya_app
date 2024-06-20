
import 'package:flutter/material.dart';
import 'package:hidhayah/utils/constants/constants.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({
    super.key,
  });

  // final GlobalKey _key=GlobalKey<FormState>();
  // final TextEditingController controller=TextEditingController();

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
            TextFormField(
              // controller: controller,
              // autofocus: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Constants.greenDark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Constants.greenDark),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Constants.greenDark),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Constants.greenDark),
                ),
              ),
            ),
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
