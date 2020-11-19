import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final bool obscureText;

  const CustomTextFormFieldWidget({
    Key key,
    this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _CustomTextFormFieldWidgetState createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      obscureText: widget.obscureText,
    );
  }
}
