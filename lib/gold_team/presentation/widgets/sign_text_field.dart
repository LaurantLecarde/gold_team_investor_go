import 'package:flutter/material.dart';

import 'App_private_textfield.dart';

class SignTextFieldWidget extends StatelessWidget {
  const SignTextFieldWidget(
      {super.key,
      required this.hint,
      required this.leading,
      required this.controller});

  final String hint;
  final Widget leading;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 65,
        width: double.infinity,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.black26)),
            elevation: 3,
            color: Colors.lightBlue.shade50,
            shadowColor: Colors.black,
            surfaceTintColor: Colors.lightBlue.shade50,
            clipBehavior: Clip.hardEdge,
            child: Center(
              child: AppTextField(
                  hintText: hint, leadingIcon: leading, controller: controller),
            )),
      ),
    );
  }
}
