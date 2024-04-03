import "package:flutter/material.dart";
import "package:gold_team_investor_go/gold_team/presentation/widgets/password_text_field.dart";


class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget(
      {super.key,
      required this.hint,
      required this.controller,
      required this.leading,
      required this.prefIcon,required this.close});

  final String hint;
  final TextEditingController controller;
  final Widget leading;
  final Widget prefIcon;
  final bool close;

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
              child: PasswordTextField(
                close: close,
                hintText: hint,
                leadingIcon: leading,
                controller: controller,
                prefixIcon: prefIcon,
              ),
            )),
      ),
    );
  }
}
