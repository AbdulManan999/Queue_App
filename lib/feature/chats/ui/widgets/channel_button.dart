import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChannelButton extends StatefulWidget {
  final String title;

  ChannelButton({this.title});

  @override
  _ChannelButtonState createState() => _ChannelButtonState();
}

class _ChannelButtonState extends State<ChannelButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.height * 1,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '# ${widget.title}',
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xFF475F7B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
