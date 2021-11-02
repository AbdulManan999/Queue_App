import 'package:flutter/material.dart';
import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:flutter_screenutil/size_extension.dart';

class HeadingAndItsNumber extends StatelessWidget {
  final String title;
  final String value;

  HeadingAndItsNumber({
    this.title,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              // color: Provider.of<ThemeProvider>(context).getTheme()
              //     ? darkTextColor
              //     : textColor,
                 color : textColor,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height * 0.01).h,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 35.sp,
              // color: Provider.of<ThemeProvider>(context).getTheme()
              //     ? darkTextHeadingColor
              //     : textColor,
                 color : textColor,
            ),
          ),
        ],
      ),
    );
  }
}
