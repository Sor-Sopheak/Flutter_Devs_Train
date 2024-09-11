import 'package:flutter/material.dart';
import 'package:products_api/constants/color_constants.dart';

class AuthTextField extends StatefulWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Function? suffixAction;
  final String? hintText;
  final String? labelText;
  final bool isPassword;

  const AuthTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.suffixAction,
    this.isPassword = false,
  });

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword
          ? _obscureText
          : false, // Toggle for password fields
      keyboardType: widget.isPassword
          ? TextInputType.visiblePassword
          : TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.lightGreyColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.darkGreyColor)
        ),
        focusColor: ColorConstants.pinkColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: ColorConstants.darkGreyColor
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: ColorConstants.darkGreyColor,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: ColorConstants.darkGreyColor,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon != null
                ? IconButton(
                    icon: widget.suffixIcon!,
                    onPressed: () => widget.suffixAction?.call(),
                  )
                : null,
      ),
      textInputAction: TextInputAction.done,
    );
  }
}
