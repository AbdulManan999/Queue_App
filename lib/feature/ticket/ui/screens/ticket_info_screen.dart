import 'package:engage_app/common/widget/dialogs/AddCommentDialog.dart';
import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/common/widget/shadow_tags.dart';
import 'package:engage_app/feature/ticket/ui/widgets/heading_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TicketInfoScreen extends StatefulWidget {
  static const String routeName = "/ticketInfo";
  @override
  _TicketInfoScreenState createState() => _TicketInfoScreenState();
}

class _TicketInfoScreenState extends State<TicketInfoScreen> {
  String dropdownStatusValue = 'Open';
  List statusItems = <String>['Open', 'Processing', 'Closed', 'Completed']
      .map(
        (var value) => DropdownMenuItem(
          value: value,
          child: Row(
            children: [
              Text(value),
            ],
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    double appbarHeight = 88.h;
    double contHeight = MediaQuery.of(context).size.height * 0.09;
    double appbarWidth = MediaQuery.of(context).size.height * 1;
    double bodyHeight = (MediaQuery.of(context).size.height * 1) -
        appbarHeight -
        MediaQuery.of(context).padding.top;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Provider.of<ThemeProvider>(context).getTheme()
        //     ? darkThemeBackgroundColor
        //     : backgroundColor,
        backgroundColor: backgroundColor,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text(
                        "Ticket Details",
                        style: TextStyle(
                          fontSize: 20.sp,
                          // color: Provider.of<ThemeProvider>(context).getTheme()
                          //     ? darkTextHeadingColor
                          //     : textColor,
                          color: textColor,
                        ),
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
                ),
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
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              children: [
                Container(
                  height: 60.h,
                  width: 330.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ticket 0001",
                            style: TextStyle(
                              // color:
                              //     Provider.of<ThemeProvider>(context).getTheme()
                              //         ? darkTextHeadingColor
                              //         : textColor,
                              color: textColor,
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            "# DE202152024",
                            style: TextStyle(
                              // color:
                              //     Provider.of<ThemeProvider>(context).getTheme()
                              //         ? darkTextHeadingColor
                              //         : textColor,
                              color: textColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF6695EF),
                          ),
                          onPressed: () {},
                          child: Text('Edit'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 330.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 35,
                  ),
                  decoration: BoxDecoration(
                    // color: Provider.of<ThemeProvider>(context).getTheme()
                    //     ? darkThemeContainerColor
                    //     : Colors.white,
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey[300],
                    //     blurRadius: 12,
                    //     spreadRadius: 5,
                    //     offset: Offset(
                    //       -15,
                    //       15,
                    //     ),
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      HeadingDetailsWidget(
                        heading: "Created by:",
                        detail: "Engage24 SA - Super - admin",
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.02,
                        height: 16.h,
                      ),

                      HeadingDetailsWidget(
                        heading: "Assign to:",
                        detail: "Datalyticx - Sales",
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.02,
                        height: 16.h,
                      ),

                      HeadingDetailsWidget(
                        heading: "Current Status:",
                        detail: "Open",
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.02,
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Tags",
                              style: TextStyle(
                                // color: Provider.of<ThemeProvider>(context)
                                //         .getTheme()
                                //     ? darkTextColor
                                //     : textColor,
                                color: textColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                ShadowTags(
                                  colorScheme: 'any',
                                  title: 'Internet',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // HeadingDetailsWidget(heading: "Assign to:",detail: "Datalyticx - Sales",),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.02,
                        height: 16.h,
                      ),

                      HeadingDetailsWidget(
                        heading: "Client Name:",
                        detail: "Muhammad Sarfraz - @smmux",
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.02,
                        height: 16.h,
                      ),

                      HeadingDetailsWidget(
                        heading: "Social handle name:",
                        detail: "Datalytics24",
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.02,
                        height: 16.h,
                      ),

                      HeadingDetailsWidget(
                        heading: "Platform:",
                        detail: "Twitter",
                      ),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.02,
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Update Status:",
                            style: TextStyle(
                              // color:
                              //     Provider.of<ThemeProvider>(context).getTheme()
                              //         ? darkTextColor
                              //         : textColor,
                              color: textColor,
                              fontSize: 16.sp,
                            ),
                          )),
                          Expanded(
                            child: Container(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  padding: EdgeInsets.all(0),
                                  alignedDropdown: true,
                                  child: DropdownButton(
                                    value: dropdownStatusValue,
                                    items: statusItems,
                                    onChanged: (value) {
                                      setState(() {
                                        dropdownStatusValue = value;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      // color: Provider.of<ThemeProvider>(context)
                                      //         .getTheme()
                                      //     ? darkTextColor
                                      //     : textColor,
                                      color: textColor,
                                    ),
                                    // dropdownColor:
                                    //     Provider.of<ThemeProvider>(context)
                                    //             .getTheme()
                                    //         ? darkThemeBackgroundColor
                                    //         : backgroundColor,
                                    dropdownColor: backgroundColor,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      // color: Provider.of<ThemeProvider>(context)
                                      //         .getTheme()
                                      //     ? darkTextColor
                                      //     : textColor,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * 0.6,
                  height: 486.h,
                  width: 330.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    // color: Provider.of<ThemeProvider>(context).getTheme()
                    //     ? darkThemeContainerColor
                    //     : Colors.white,
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey[300],
                    //     blurRadius: 12,
                    //     spreadRadius: 5,
                    //     offset: Offset(
                    //       -15,
                    //       15,
                    //     ),
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            // color:
                            //     Provider.of<ThemeProvider>(context).getTheme()
                            //         ? darkTextColor
                            //         : textColor,
                            color: textColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            "Comments",
                            style: TextStyle(
                              // color:
                              //     Provider.of<ThemeProvider>(context).getTheme()
                              //         ? darkTextHeadingColor
                              //         : textColor,
                              color: textColor,
                              fontSize: 22.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => AddCommentDialog(),
                              );
                            },
                            child: ShadowTags(
                              colorScheme: 'any',
                              title: 'Add Comments',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 30.h,
                          // color: Provider.of<ThemeProvider>(context).getTheme()
                          //     ? darkThemeContainerColor
                          //     : Colors.white,
                          color: Colors.white,
                          child: StreamBuilder(
                            stream: comments.stream,
                            builder: (BuildContext context, snapshot) {
                              print("Snapshot: ${snapshot.data}");
                              if (snapshot.hasData) {
                                return ListView(
                                  children: snapshot.data,
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
