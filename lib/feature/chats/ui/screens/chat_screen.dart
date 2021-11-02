import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/feature/chats/ui/widgets/chat_textfield.dart';
import 'package:engage_app/common/widget/message_bubble.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/ChatRoom';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FocusNode _chatFocusNode = FocusNode();
  var _chatController = TextEditingController();
  bool _isEmojiVisible = false;
  List<Widget> chats = [];

  @override
  void initState() {
    super.initState();
  }

  void toggle(bool value) {
    // setState(() {
    _isEmojiVisible = value;
    // });
  }

  @override
  void dispose() {
    _chatFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appbarHeight = 90.0.h;
    double contHeight = MediaQuery.of(context).size.height * 0.09;
    double appbarWidth = MediaQuery.of(context).size.height * 1;
    double bodyHeight = 680.h;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Provider.of<ThemeProvider>(context).getTheme()
        //     ? darkThemeBackgroundColor
        //     : Color(0xFFE3E6F1),
        backgroundColor: Color(0xFFE3E6F1),
        // appBar: PreferredSize(
        //   preferredSize: Size(appbarWidth, appbarHeight),
        //   child: Column(
        //     children: [
        //       Container(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 20,
        //           vertical: 15,
        //         ),
        //         decoration: BoxDecoration(
        //           color: Color(0xFFF2F4F4),
        //         ),
        //         height: contHeight,
        //         child: Container(
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Container(
        //                 child: Container(
        //                   height: MediaQuery.of(context).size.height * 0.06,
        //                   width: MediaQuery.of(context).size.width * 0.14,
        //                   decoration: BoxDecoration(
        //                     shape: BoxShape.circle,
        //                     image: DecorationImage(
        //                       image: AssetImage('images/useravatar.jpg'),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: MediaQuery.of(context).size.width * 0.05,
        //               ),
        //               Expanded(
        //                 flex: 3,
        //                 child: Container(
        //                   height: MediaQuery.of(context).size.height * 0.07,
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Elizabeth Elliott',
        //                         style: TextStyle(
        //                           fontSize: 16.sp,
        //                           color: Color(0xFF475F7B),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Expanded(
        //                 flex: 1,
        //                 child: Container(
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                     children: [
        //                       Icon(
        //                         FontAwesomeIcons.star,
        //                         color: Color(0xFF475F7B),
        //                       ),
        //                       Icon(
        //                         Icons.more_vert,
        //                         color: Color(0xFF475F7B),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        appBar: PreferredSize(
          preferredSize: Size(appbarWidth, appbarHeight),
          child: Container(
            // color: Provider.of<ThemeProvider>(context).getTheme()
            //     ? darkThemeBackgroundColor
            //     : backgroundColor,
            color: backgroundColor,
            height: appbarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          // color: Provider.of<ThemeProvider>(context).getTheme()
                          //     ? darkTextColor
                          //     : textColor,
                          color: textColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/useravatar.jpg'),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            "Messages",
                            style: TextStyle(
                              fontSize: 20.sp,
                              // color:
                              //     Provider.of<ThemeProvider>(context).getTheme()
                              //         ? darkTextHeadingColor
                              //         : textColor,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          // color: Provider.of<ThemeProvider>(context).getTheme()
                          //     ? darkTextColor
                          //     : textColor,
                          color: textColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
                // AppBar(
                //   backgroundColor: Color(0xFFF2F4F4),
                //   elevation: 0,
                //   leading: InkWell(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Icon(
                //       Icons.arrow_back_ios,
                //       color: textColor,
                //     ),
                //   ),
                //   centerTitle: true,
                //   title: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         child: Container(
                //           height: MediaQuery.of(context).size.height * 0.06,
                //           width: MediaQuery.of(context).size.width * 0.14,
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             image: DecorationImage(
                //               image: AssetImage('images/useravatar.jpg'),
                //             ),
                //           ),
                //         ),
                //       ),
                //       Text(
                //         "Messages",
                //         style: TextStyle(
                //           fontSize: 20.sp,
                //           color: Color(0xFF475F7B),
                //         ),
                //       ),
                //     ],
                //   ),
                //   actions: [
                //     IconButton(
                //       icon: Icon(
                //         Icons.more_vert,
                //         size: 28,
                //         color: textColor,
                //       ),
                //       onPressed: () {},
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
        body: KeyboardVisibilityBuilder(
          builder: (context, visibility) {
            if (visibility) {
              toggle(false);
            }
            print('_isEmojiVisible: $_isEmojiVisible');
            print(visibility);
            return Container(
              width: MediaQuery.of(context).size.width * 1,
              height: bodyHeight,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.66,
                      // color: Provider.of<ThemeProvider>(context).getTheme()
                      //     ? Color(0xFF101724)
                      //     : Color(0xFFE3E6F1),
                      color: Color(0xFFE3E6F1),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: ListView(
                        controller: ScrollController(),
                        reverse: true,
                        dragStartBehavior: DragStartBehavior.down,
                        // textDirection: TextDirection.rtl,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        // verticalDirection: VerticalDirection.up,
                        children: List.from(chats.reversed),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.013,
                    ),
                    // color: Provider.of<ThemeProvider>(context).getTheme()
                    //     ? darkThemeBackgroundColor
                    //     : Colors.white,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Icon(
                              !_isEmojiVisible
                                  ? FontAwesomeIcons.grin
                                  : FontAwesomeIcons.solidKeyboard,
                              color: Color(0xFF647890),
                            ),
                          ),
                          onTap: !_isEmojiVisible
                              ? () async {
                                  // FocusScope.of(context).unfocus();
                                  print('blah');
                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide');
                                  await Future.delayed(
                                    Duration(milliseconds: 80),
                                  );
                                  toggle(true);
                                  setState(() {});
                                }
                              : () async {
                                  FocusScope.of(context).unfocus();
                                  await Future.delayed(
                                    Duration(seconds: 1),
                                  );
                                  FocusScope.of(context)
                                      .requestFocus(_chatFocusNode);
                                },
                        ),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Icon(
                              FontAwesomeIcons.paperclip,
                              color: Color(0xFF647890),
                            ),
                          ),
                          onTap: () {},
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: ChatTextField(
                            controller: _chatController,
                            obscureText: false,
                            hintText: 'Type your message here...',
                            keyboardType: TextInputType.text,
                            validator: (value) {},
                            focusNode: _chatFocusNode,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF437DEC),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                FontAwesomeIcons.paperPlane,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _chatFocusNode.unfocus();

                                setState(() {
                                  chats.add(
                                    MessageBubble(
                                      isMe: true,
                                      message: _chatController.text,
                                    ),
                                  );
                                  _chatController.text = '';
                                });
                              },
                            ),
                          ),
                        )
                        // TextField(
                        //   decoration: InputDecoration(
                        //     hintText: 'Text',
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  // _isEmojiVisible
                  //     ? EmojiPicker(
                  //         rows: 4,
                  //         columns: 7,
                  //         buttonMode: ButtonMode.MATERIAL,
                  //         onEmojiSelected: (emoji, category) {
                  //           // setState(() {
                  //           //
                  //           // });
                  //           _chatController.text =
                  //               _chatController.text + emoji.emoji;
                  //         },
                  //       )
                  //     : Container(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
