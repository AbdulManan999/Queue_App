import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HeadingDetailsWidget extends StatelessWidget {
  final String heading;
  final String detail;

  HeadingDetailsWidget({
    this.heading,
    this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Text(
            heading,
            style: TextStyle(
              // color: Provider.of<ThemeProvider>(context).getTheme()
              //     ? darkTextColor
              //     : textColor,
              color: textColor,
              fontSize: 16.sp,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            detail,
            style: TextStyle(
              // color: Provider.of<ThemeProvider>(context).getTheme()
              //     ? darkTextColor
              //     : textColor,
              color: textColor,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
