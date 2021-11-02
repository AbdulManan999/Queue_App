import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/feature/chats/ui/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatButton extends StatefulWidget {
  final String fullName;
  final String lastMessage;
  final String profileImageUrl;
  final String source;

  ChatButton({
    this.fullName,
    this.lastMessage,
    this.profileImageUrl,
    this.source,
  });

  @override
  _ChatButtonState createState() => _ChatButtonState();
}

class _ChatButtonState extends State<ChatButton> {
  @override
  Widget build(BuildContext context) {
    // print("width: ${MediaQuery.of(context).size.width * 0.17}");
    // print("height: ${MediaQuery.of(context).size.height * 0.1}");
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ChatScreen.routeName);
      },
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.11,
        height: 90.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          // vertical: 15,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.1,
                  // width: MediaQuery.of(context).size.width * 0.17,
                  height: 78.h,
                  width: 66.w,
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                widget.source == "twitter"
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 0.05,
                          // width: MediaQuery.of(context).size.width * 0.09,
                          height: 40.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 0.05,
                          // width: MediaQuery.of(context).size.width * 0.09,
                          height: 40.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width * 0.03,
              width: 10.w,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.fullName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        // color: Provider.of<ThemeProvider>(context).getTheme()
                        //     ? darkTextHeadingColor
                        //     : textColor,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.005,
                      height: 5.h,
                    ),
                    Text(
                      widget.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
                        // color: Provider.of<ThemeProvider>(context).getTheme()
                        //     ? darkTextColor
                        //     : textColor,
                        color: textColor,
                      ),
                    ),
                    Text(
                      '1/10/2021 1:34pm',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.sp,
                        // color: Provider.of<ThemeProvider>(context).getTheme()
                        //     ? darkTextColor
                        //     : textColor,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
