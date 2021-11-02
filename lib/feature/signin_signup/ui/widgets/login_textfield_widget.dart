import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class LoginTextField extends StatefulWidget {
  final String textFieldTitle;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Function validator;
  FocusNode focusNode;

  LoginTextField({
    @required this.textFieldTitle,
    @required this.controller,
    @required this.obscureText,
    @required this.hintText,
    @required this.keyboardType,
    @required this.validator,
    this.focusNode,
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 0.w, bottom: 8.0.h),
          height: 17.h,
          child: Text(
            widget.textFieldTitle,
            style: TextStyle(
              fontSize: 14.sp,
              // color: Provider.of<ThemeProvider>(context).getTheme()
              //     ? darkTextColor
              //     : textColor,
              color: Color(0xFF475F7B),
            ),
          ),
        ),
        Material(
          // color: Provider.of<ThemeProvider>(context).getTheme()
          //     ? darkThemeBackgroundColor
          //     : Colors.white,
          color: Colors.white,
          elevation: widget.focusNode.hasFocus ? 6 : 0,
          child: TextFormField(
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              // fillColor: Provider.of<ThemeProvider>(context).getTheme()
              //     ? darkTextFieldColor
              //     : backgroundColor,
              fillColor: Color(0xFFF2F4F4),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.w,
                  color: Colors.grey, //Color(0x7A5ADB5),
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.w,
                  color: Colors.grey, //Color(0x7A5ADB5),
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[600],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Colors.red),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.w, color: Colors.red),
                borderRadius: BorderRadius.circular(6),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
                vertical: 16.0.h,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                // color: Provider.of<ThemeProvider>(context).getTheme()
                //     ? Colors.grey
                //     : textColor,
                color: Color(0xFF475F7B),
                fontSize: 14.sp,
              ),
            ),
            style: TextStyle(
              fontSize: 16.sp,
            ),
            obscureText: widget.obscureText,
            controller: widget.controller,
            validator: widget.validator,
          ),
        ),
        SizedBox(
          height: 4.0.h,
        ),
      ],
    );
  }
}
