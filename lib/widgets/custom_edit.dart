import 'package:flutter/material.dart';

class CustomEdit extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final password;

  CustomEdit({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    required this.validator,
    this.isPassword = false,
    this.password
  });

  @override
  State<CustomEdit> createState() => _CustomEditState();
}

class _CustomEditState extends State<CustomEdit> {
  var _validated = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      validator: widget.validator,
      onChanged: (value) {
        setState(() {
          _validated = true;
        });
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _validated ? Colors.green : Colors.grey),
              borderRadius: BorderRadius.circular(10)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _validated ? Colors.green : Colors.grey),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
