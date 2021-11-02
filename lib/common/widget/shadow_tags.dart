import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'global_variables_methods.dart';

class ShadowTags extends StatefulWidget {
  String title;
  String colorScheme;

  ShadowTags({
    @required this.title,
    @required this.colorScheme,
  });

  @override
  _ShadowTagsState createState() => _ShadowTagsState();
}

class _ShadowTagsState extends State<ShadowTags> {
  Color titleColor;

  Color textShadow;

  void getColorScheme(context) {
    if (widget.colorScheme == "red") {
      // textShadow = Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkShadowOpenColor
      //     : shadowOpenColor;
      textShadow = shadowOpenColor;
      titleColor = Colors.redAccent;
    } else if (widget.colorScheme == "yellow") {
      // textShadow = Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkShadowProcessingColor
      //     : shadowProcessingColor;
      textShadow = shadowProcessingColor;
      titleColor = Color(0xFFF0A441);
    } else if (widget.colorScheme == "grey") {
      // textShadow = Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkShadowClosedColor
      //     : shadowClosedColor;
      textShadow = shadowClosedColor;
      titleColor = Color(0xFF5B7189);
    } else if (widget.colorScheme == "cyan") {
      // textShadow = Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkShadowTwitterColor
      //     : shadowTwitterColor;
      textShadow = shadowTwitterColor;
      titleColor = Colors.cyan[400];
    } else if (widget.colorScheme == "green") {
      // textShadow = Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkShadowWhatsappColor
      //     : shadowWhatsappColor;
      textShadow = shadowWhatsappColor;
      titleColor = Color(0xFF3FDB8D);
    } else {
      // textShadow = Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkShadowAnyColor
      //     : shadowAnyColor;
      textShadow = shadowAnyColor;
      titleColor = Color(0xFF6695EF);
    }
  }

  @override
  Widget build(BuildContext context) {
    getColorScheme(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: textShadow,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16.sp,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
