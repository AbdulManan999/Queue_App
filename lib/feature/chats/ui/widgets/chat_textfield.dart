import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final Function validator;
  FocusNode focusNode;

  ChatTextField({
    @required this.controller,
    @required this.obscureText,
    @required this.hintText,
    @required this.keyboardType,
    @required this.validator,
    this.focusNode,
  });

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.focusNode.hasFocus ? 6 : 0,
      child: TextFormField(
        autofocus: true,
        maxLines: 10,
        minLines: 1,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          fillColor: Color(0xFF101724),
          // filled: Provider.of<ThemeProvider>(context).getTheme(),
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
              color: Color(0x7A5ADB5),
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
            borderSide: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(6),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
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
    );
  }
}
