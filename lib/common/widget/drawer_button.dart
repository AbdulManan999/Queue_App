import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:provider/provider.dart';
import 'global_variables_methods.dart';

class DrawerButton extends StatelessWidget {
  final IconData icon;
  final String title;
  bool isSelected;
  final Function onPressed;

  DrawerButton({
    this.icon,
    this.title,
    this.isSelected,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          // color: Provider.of<ThemeProvider>(context).getTheme()
          //     ? darkThemeBackgroundColor
          //     : isSelected
          //         ? Color(0x335A8DEE)
          //         : Provider.of<ThemeProvider>(context).getTheme()
          //             ? darkTextColor
          //             : backgroundColor,
          color: isSelected ? Color(0x335A8DEE) : backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Color(0xFF5A8DEE)
                  // : Provider.of<ThemeProvider>(context).getTheme()
                  //     ? darkTextColor
                  : textColor,
              size: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected
                    ? Color(0xFF5A8DEE)
                    // : Provider.of<ThemeProvider>(context).getTheme()
                    //     ? darkTextColor
                    : textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
