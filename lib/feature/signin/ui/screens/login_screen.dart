import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/feature/signin/ui/widgets/login_textfield_widget.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/route/routes.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/Login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenSize = 750.h;
    return Scaffold(
      // backgroundColor: Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkThemeBackgroundColor
      //     : backgroundColor,
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () {
          exitDialog(context);
          return Future.value(false);
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              // color: Provider.of<ThemeProvider>(context).getTheme()
              //     ? darkThemeBackgroundColor
              //     : backgroundColor,
              color: backgroundColor,
              height: screenSize,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: 290.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      // height: (MediaQuery.of(context).size.height * 0.4).h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 18.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontSize: 24.sp,
                              // color:
                              // Provider.of<ThemeProvider>(context).getTheme()
                              //     ? darkTextHeadingColor
                              //     : textColor,
                              color: textColor,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: LoginTextField(
                              textFieldTitle: 'EMAIL ADDRESS',
                              controller: emailController,
                              obscureText: false,
                              hintText: 'Email Address',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {},
                              focusNode: _emailFocusNode,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          LoginTextField(
                            textFieldTitle: 'PASSWORD',
                            controller: passwordController,
                            obscureText: true,
                            hintText: 'Password',
                            keyboardType: TextInputType.name,
                            validator: (value) {},
                            focusNode: _passwordFocusNode,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  // color: Provider.of<ThemeProvider>(context)
                                  //         .getTheme()
                                  //     ? darkTextColor
                                  //     : textColor,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Container(
                            height: 50.h,
                            child: ElevatedButton(
                              //5A8DEE
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF5A8DEE),
                              ),
                              onPressed: () async {
                                // Navigator.of(context)
                                //     .pushNamed(ChatListScreen.routeName);
                                Navigator.of(context)
                                    .pushNamed(Routes.dashboard);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(FontAwesomeIcons.arrowRight),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         child: Divider(
                          //           thickness: 1,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: MediaQuery.of(context).size.width * 0.05,
                          //     ),
                          //     Text(
                          //       'OR LOGIN WITH EMAIL',
                          //       style: TextStyle(
                          //         color: Color(0xFFA5ADB5),
                          //         fontSize: 14.sp,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: MediaQuery.of(context).size.width * 0.05,
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         child: Divider(
                          //           thickness: 1,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.02,
                          // ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         height: MediaQuery.of(context).size.height * 0.06,
                          //         child: ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //             padding: EdgeInsets.all(0),
                          //             primary: Colors.red,
                          //           ),
                          //           onPressed: () {},
                          //           child: Row(
                          //             children: [
                          //               Expanded(
                          //                 flex: 2,
                          //                 child: Center(
                          //                   child: Icon(
                          //                     FontAwesomeIcons.google,
                          //                     size: 20,
                          //                   ),
                          //                 ),
                          //               ),
                          //               Container(
                          //                 height:
                          //                     MediaQuery.of(context).size.height *
                          //                         0.05,
                          //                 child: VerticalDivider(
                          //                   thickness: 1,
                          //                   width: 1,
                          //                 ),
                          //               ),
                          //               Expanded(
                          //                 flex: 5,
                          //                 child: Container(
                          //                   child: Center(
                          //                     child: Text(
                          //                       'Google',
                          //                       style: TextStyle(
                          //                         fontSize: 15.sp,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: MediaQuery.of(context).size.width * 0.05,
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         height: MediaQuery.of(context).size.height * 0.06,
                          //         child: ElevatedButton(
                          //           style: ElevatedButton.styleFrom(
                          //             padding: EdgeInsets.all(0),
                          //             primary: Color(0xFF3B5998),
                          //           ),
                          //           onPressed: () {},
                          //           child: Row(
                          //             children: [
                          //               Expanded(
                          //                 flex: 2,
                          //                 child: Center(
                          //                   child: Icon(
                          //                     FontAwesomeIcons.facebookSquare,
                          //                     size: 20,
                          //                   ),
                          //                 ),
                          //               ),
                          //               Container(
                          //                 height:
                          //                     MediaQuery.of(context).size.height *
                          //                         0.05,
                          //                 child: VerticalDivider(
                          //                   thickness: 1,
                          //                   width: 1,
                          //                 ),
                          //               ),
                          //               Expanded(
                          //                 flex: 5,
                          //                 child: Container(
                          //                   child: Center(
                          //                     child: Text(
                          //                       'Facebook',
                          //                       style: TextStyle(
                          //                         fontSize: 15.sp,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
