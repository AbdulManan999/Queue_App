import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MessageBubble extends StatefulWidget {
  bool isMe;
  String message;

  MessageBubble({
    this.isMe,
    this.message,
  });

  @override
  _MessageBubbleState createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.isMe ? Alignment.topRight : Alignment.topLeft,
      child: Column(
        crossAxisAlignment:
            widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            child: Container(
              padding: EdgeInsets.all(15),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                widget.message,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: widget.isMe
                      ? Colors.white
                      // : Provider.of<ThemeProvider>(context).getTheme()
                      //     ? darkTextColor
                      //     : textColor,
                      : textColor,
                ),
              ),
              decoration: BoxDecoration(
                color: widget.isMe
                    ? Color(0xFF437DEC)
                    // : Provider.of<ThemeProvider>(context).getTheme()
                    //     ? darkThemeContainerColor
                    : Colors.white,
                borderRadius: widget.isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomLeft: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.5),
                //     spreadRadius: 0.5,
                //     blurRadius: 5,
                //     offset: Offset(
                //       0,
                //       2,
                //     ),
                //   ),
                // ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            alignment: widget.isMe ? Alignment.topRight : Alignment.topLeft,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              '11:48 PM',
              style: TextStyle(
                // color: Provider.of<ThemeProvider>(context).getTheme()
                //     ? darkTextColor
                //     : textColor,
                color: textColor,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ),
    );
  }
}
