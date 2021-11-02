import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../route/routes.dart';
import 'drawer_button.dart';
import 'global_variables_methods.dart';
import 'shadow_tags.dart';

class AppDrawer extends StatefulWidget {
  var scaffoldKey;

  AppDrawer({this.scaffoldKey});

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  ExpandableController _adminExpandableController =
      ExpandableController(initialExpanded: false);
  ExpandableController _customersExpandableController =
      ExpandableController(initialExpanded: false);
  ExpandableController _ticketingExpandableController =
      ExpandableController(initialExpanded: false);
  ExpandableController _chatExpandableController =
      ExpandableController(initialExpanded: false);
  bool isAdminSelected = false;
  bool isCustomersSelected = false;
  bool isTicketingSelected = false;
  bool isChatSelected = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        //   color: Provider.of<ThemeProvider>(context).getTheme()
        //       ? darkThemeBackgroundColor
        //       : backgroundColor,
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  // color: Provider.of<ThemeProvider>(context).getTheme()
                  //     ? darkThemeBackgroundColor
                  //     : backgroundColor,
                  color: backgroundColor,
                  height: 700.h,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.08,
                                      width: MediaQuery.of(context).size.width *
                                          0.16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/sarfraz.png'),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ShadowTags(
                                    title: "Available",
                                    colorScheme: "green",
                                  ),
                                  // Text(
                                  //   'Available',
                                  //   style: TextStyle(
                                  //     fontSize: 16.sp,
                                  //     color: Color(0xFF475F7B),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Expanded(
                                    //   flex: 1,
                                    //   child: Column(
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         'Name:',
                                    //         style: TextStyle(
                                    //           fontSize: 16.sp,
                                    //           color: Color(0xFF475F7B),
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         'Role:',
                                    //         style: TextStyle(
                                    //           fontSize: 16.sp,
                                    //           color: Color(0xFF475F7B),
                                    //         ),
                                    //       ),
                                    //       Text(
                                    //         'Status:',
                                    //         style: TextStyle(
                                    //           fontSize: 16.sp,
                                    //           color: Color(0xFF475F7B),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   width: MediaQuery.of(context).size.width * 0.05,
                                    // ),

                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Engage24 SA (Super-Admin)',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              // color: Provider.of<ThemeProvider>(
                                              //         context)
                                              //     .getTheme()
                                              // ? darkTextColor
                                              // : textColor,
                                              color: textColor,
                                            ),
                                          ),
                                          Text(
                                            '@ammux',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              // color: Provider.of<ThemeProvider>(
                                              //         context)
                                              //     .getTheme()
                                              // ? darkTextColor
                                              // : textColor,
                                              color: textColor,
                                            ),
                                          ),

                                          // Text(
                                          //   'Available',
                                          //   style: TextStyle(
                                          //     fontSize: 16.sp,
                                          //     color: Color(0xFF475F7B),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              DrawerButton(
                                title: 'Dashboard',
                                icon: Icons.home_outlined,
                                isSelected: false,
                                onPressed: () {
                                  // setState(() {
                                  //   isButton1Selected = true;
                                  //   isButton2Selected = false;
                                  // });
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      Routes.dashboard, (route) => false);
                                  // Navigator.of(context).pushNamed(Dashboard.routeName);
                                },
                              ),
                              DrawerButton(
                                title: 'Chats',
                                icon: Icons.question_answer_outlined,
                                isSelected: false,
                                onPressed: () {
                                  // setState(() {
                                  //   isButton1Selected = false;
                                  //   isButton2Selected = true;
                                  // });
                                  // Navigator.of(context).pushNamedAndRemoveUntil(
                                  //     ChatListScreen.routeName, (route) => false);

                                  Navigator.of(context)
                                      .pushNamed(Routes.chatList);
                                },
                              ),
                              DrawerButton(
                                title: 'Tickets',
                                icon: CupertinoIcons.doc_plaintext,
                                isSelected: false,
                                onPressed: () {
                                  // setState(() {
                                  //   isButton1Selected = false;
                                  //   isButton2Selected = true;
                                  // });
                                  // Navigator.of(context).pushNamedAndRemoveUntil(
                                  //     DataTableScreen.routeName, (route) => false);

                                  Navigator.popAndPushNamed(
                                      context, Routes.ticketList);
                                },
                              ),

                              Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Icon(
                                      // Provider.of<ThemeProvider>(context)
                                      //         .getTheme()
                                      //     ? FontAwesomeIcons.solidMoon
                                      //     : FontAwesomeIcons.solidSun,
                                      FontAwesomeIcons.solidSun,
                                      // color: Provider.of<ThemeProvider>(context)
                                      //         .getTheme()
                                      //     ? darkTextColor
                                      //     : textColor,
                                      color: textColor,
                                    ),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Text(
                                      "Dark Mode",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        // color:
                                        // Provider.of<ThemeProvider>(context)
                                        //         .getTheme()
                                        //     ? darkTextColor
                                        //     : textColor,
                                        color: textColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 42.w,
                                    ),
                                    CupertinoSwitch(
                                      // value: Provider.of<ThemeProvider>(context,
                                      //         listen: false)
                                      //     .getTheme(),
                                      value: false,
                                      onChanged: (value) {
                                        // setState(() {
                                        //   Provider.of<ThemeProvider>(context,
                                        //           listen: false)
                                        //       .changeTheme();
                                        // });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // ExpandableContainer(
                              //   headerTitle: "Admins",
                              //   leadingIcon: FontAwesomeIcons.user,
                              //   headerIconColor: Color(0xFF5A8DEE),
                              //   headerContainerColor:
                              //       isAdminSelected ? Colors.white : Color(0xFFEEF1F1),
                              //   headerTitleColor: Colors.black,
                              //   controller: _adminExpandableController,
                              //   onPressed: () {
                              //     _adminExpandableController.toggle();
                              //     setState(() {
                              //       isAdminSelected = !isAdminSelected;
                              //     });
                              //   },
                              //   expandedBodyWidget: Container(
                              //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                              //     width: MediaQuery.of(context).size.width * 1,
                              //     color: Colors.white,
                              //     child: Column(
                              //       children: [
                              //         InnerExpandedButton(
                              //           onPressed: () {},
                              //           title: "Roles",
                              //         ),
                              //         InnerExpandedButton(
                              //           onPressed: () {},
                              //           title: "Permissions",
                              //         ),
                              //         InnerExpandedButton(
                              //           onPressed: () {},
                              //           title: "Department",
                              //         ),
                              //         InnerExpandedButton(
                              //           onPressed: () {},
                              //           title: "Agents",
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // DrawerButton(
                              //   title: 'Connect Channels',
                              //   icon: Icons.pie_chart_outline_outlined,
                              //   isSelected: false,
                              //   onPressed: () {
                              //     // setState(() {
                              //     //   isButton1Selected = false;
                              //     //   isButton2Selected = true;
                              //     // });
                              //     Navigator.of(context)
                              //         .pushNamed(ChatListScreen.routeName);
                              //   },
                              // ),
                              // ExpandableContainer(
                              //   headerTitle: "Customers",
                              //   leadingIcon: Icons.tag_faces,
                              //   headerIconColor: Color(0xFF5A8DEE),
                              //   headerContainerColor: isCustomersSelected
                              //       ? Colors.white
                              //       : Color(0xFFEEF1F1),
                              //   headerTitleColor: Colors.black,
                              //   controller: _customersExpandableController,
                              //   onPressed: () {
                              //     _customersExpandableController.toggle();
                              //     setState(() {
                              //       isCustomersSelected = !isCustomersSelected;
                              //     });
                              //   },
                              //   expandedBodyWidget: Container(
                              //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                              //     width: MediaQuery.of(context).size.width * 1,
                              //     color: Colors.white,
                              //     child: Column(
                              //       children: [
                              //         InnerExpandedButton(
                              //           onPressed: () async {
                              //             Navigator.popAndPushNamed(
                              //                 context, DataTableScreen.routeName);
                              //           },
                              //           title: "List",
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // ExpandableContainer(
                              //   headerTitle: "Ticketing Settings",
                              //   leadingIcon: CupertinoIcons.doc_plaintext,
                              //   headerIconColor: Color(0xFF5A8DEE),
                              //   headerContainerColor: isTicketingSelected
                              //       ? Colors.white
                              //       : Color(0xFFEEF1F1),
                              //   headerTitleColor: Colors.black,
                              //   controller: _ticketingExpandableController,
                              //   onPressed: () {
                              //     _ticketingExpandableController.toggle();
                              //     setState(() {
                              //       isTicketingSelected = !isTicketingSelected;
                              //     });
                              //   },
                              //   expandedBodyWidget: Container(
                              //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                              //     width: MediaQuery.of(context).size.width * 1,
                              //     color: Colors.white,
                              //     child: Column(
                              //       children: [
                              //         InnerExpandedButton(
                              //           onPressed: () {
                              //             Navigator.popAndPushNamed(
                              //                 context, DataTableScreen.routeName);
                              //           },
                              //           title: "List",
                              //         ),
                              //         InnerExpandedButton(
                              //           onPressed: () {
                              //             Navigator.popAndPushNamed(
                              //                 context, DataTableScreen.routeName);
                              //           },
                              //           title: "Saved Replies",
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // ExpandableContainer(
                              //   headerTitle: "Chat Settings",
                              //   leadingIcon: Icons.settings,
                              //   headerIconColor: Color(0xFF5A8DEE),
                              //   headerContainerColor:
                              //       isChatSelected ? Colors.white : Color(0xFFEEF1F1),
                              //   headerTitleColor: Colors.black,
                              //   controller: _chatExpandableController,
                              //   onPressed: () {
                              //     _chatExpandableController.toggle();
                              //     setState(() {
                              //       isChatSelected = !isChatSelected;
                              //     });
                              //   },
                              //   expandedBodyWidget: Container(
                              //     padding: EdgeInsets.symmetric(horizontal: 8.0),
                              //     width: MediaQuery.of(context).size.width * 1,
                              //     color: Colors.white,
                              //     child: Column(
                              //       children: [
                              //         InnerExpandedButton(
                              //           onPressed: () {},
                              //           title: "List",
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      DrawerButton(
                        icon: Icons.logout,
                        title: "Logout",
                        isSelected: false,
                        onPressed: () {
                          // setState(() {
                          //   isButton1Selected = false;
                          //   isButton2Selected = true;
                          // });
                          // Navigator.of(context).pushNamedAndRemoveUntil(
                          //     ChatListScreen.routeName, (route) => false);

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.signIn, (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
