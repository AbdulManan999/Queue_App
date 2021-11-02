import 'package:engage_app/common/route/routes.dart';
import 'package:engage_app/common/widget/app_drawer.dart';
import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/feature/ticket/ui/widgets/expandable_container.dart';
import 'package:engage_app/feature/ticket/ui/widgets/heading_detail_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TicketListScreen extends StatefulWidget {
  static const String routeName = '/dataTable';

  @override
  _TicketListScreenState createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  String dropdownFilter = 'All';
  String dropdownValueNumber = '10';
  List filterItems =
      <String>['All', 'Open', 'Processing', 'Closed', 'Completed']
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
  List itemsNumbers = <String>['10', '25', '50', '100']
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

  List<bool> selected = List<bool>.generate(10, (int index) => false);

  int sortColumnIndex;
  bool isAssending = false;

  List expandableListController = [
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
    ExpandableController(initialExpanded: false),
  ];

  // void onSort(int index, bool assending) {
  //   setState(() {
  //     sortColumnIndex = index;
  //     isAssending = assending;
  //   });
  // }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // double appbarHeight = (MediaQuery.of(context).size.height * 0.09).h;
    double appbarHeight = 75.h;
    double contHeight = (MediaQuery.of(context).size.height * 0.09).h;
    double appbarWidth = (MediaQuery.of(context).size.height * 1).w;
    double bodyHeight = (MediaQuery.of(context).size.height * 1).h -
        appbarHeight -
        MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: PreferredSize(
        //   preferredSize: Size(appbarWidth, appbarHeight),
        //   child: Column(
        //     children: [
        //       Container(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: 30,
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
        //               IconButton(
        //                 icon: Icon(
        //                   Icons.menu,
        //                   color: Color(0xFF475F7B),
        //                   size: 30,
        //                 ),
        //                 onPressed: () {
        //                   _scaffoldKey.currentState.openDrawer();
        //                 },
        //               ),
        //               Expanded(
        //                 flex: 2,
        //                 child: SizedBox(),
        //               ),
        //               Expanded(
        //                 flex: 1,
        //                 child: Container(
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                     children: [
        //                       // Icon(
        //                       //   Icons.search,
        //                       //   color: Color(0xFF475F7B),
        //                       //   size: 35,
        //                       // ),
        //                       Icon(
        //                         Icons.notifications_outlined,
        //                         color: Color(0xFF475F7B),
        //                         size: 30,
        //                       ),
        //                       Container(
        //                         child: Container(
        //                           height:
        //                               MediaQuery.of(context).size.height * 0.06,
        //                           width:
        //                               MediaQuery.of(context).size.width * 0.14,
        //                           decoration: BoxDecoration(
        //                             shape: BoxShape.circle,
        //                             image: DecorationImage(
        //                               image:
        //                                   AssetImage('images/useravatar.jpg'),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
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
            padding: EdgeInsets.only(right: 15.w, left: 28.w),
            // color: Provider.of<ThemeProvider>(context).getTheme()
            //     ? darkThemeBackgroundColor
            //     : backgroundColor,
            color: backgroundColor,
            height: appbarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  // backgroundColor:
                  //     Provider.of<ThemeProvider>(context).getTheme()
                  //         ? darkThemeBackgroundColor
                  //         : backgroundColor,
                  backgroundColor: backgroundColor,
                  elevation: 0,
                  leading: InkWell(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage("assets/images/sarfraz.png"),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.14,
                        child: Image.asset(
                          "assets/images/logo2.png",
                          height: 30.h,
                          width: 30.w,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        size: 28,
                        // color: Provider.of<ThemeProvider>(context).getTheme()
                        //     ? darkTextColor
                        //     : textColor,
                        color: textColor,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        size: 28,
                        // color: Provider.of<ThemeProvider>(context).getTheme()
                        //     ? darkTextColor
                        //     : textColor,
                        color: textColor,
                      ),
                      onPressed: () {},
                    )
                  ],
                  // leading: Container(
                  //   height: MediaQuery.of(context).size.height * 0.05,
                  //   width: MediaQuery.of(context).size.width * 0.1,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       image: AssetImage('images/useravatar.jpg'),
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ),
        drawer: AppDrawer(),
        // backgroundColor: Provider.of<ThemeProvider>(context).getTheme()
        //     ? darkThemeBackgroundColor
        //     : backgroundColor,
        backgroundColor: backgroundColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 20.w,
              //     vertical: 30.h,
              //   ),
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       width: 0.5.w,
              //       color: Colors.grey,
              //     ),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "VERIFIED",
              //         style: TextStyle(
              //           color: textColor,
              //         ),
              //       ),
              //       SizedBox(
              //         height: (MediaQuery.of(context).size.height * 0.01).h,
              //       ),
              //       Container(
              //         width: (MediaQuery.of(context).size.width * 1).w,
              //         color: Colors.white,
              //         child: DropdownButtonHideUnderline(
              //           child: ButtonTheme(
              //             alignedDropdown: true,
              //             child: DropdownButton(
              //               isExpanded: true,
              //               value: dropdownValue,
              //               items: items,
              //               onChanged: (value) {},
              //               style: TextStyle(
              //                 fontSize: 18.sp,
              //                 color: textColor,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: (MediaQuery.of(context).size.height * 0.03).h,
              //       ),
              //       Text(
              //         "ROLE",
              //         style: TextStyle(
              //           color: textColor,
              //         ),
              //       ),
              //       SizedBox(
              //         height: (MediaQuery.of(context).size.height * 0.01).h,
              //       ),
              //       Container(
              //         width: (MediaQuery.of(context).size.width * 1).w,
              //         color: Colors.white,
              //         child: DropdownButtonHideUnderline(
              //           child: ButtonTheme(
              //             alignedDropdown: true,
              //             child: DropdownButton(
              //               isExpanded: false,
              //               value: dropdownValue,
              //               items: items,
              //               onChanged: (value) {},
              //               style: TextStyle(
              //                 fontSize: 18.sp,
              //                 color: textColor,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: (MediaQuery.of(context).size.height * 0.03),
              //       ),
              //       Text(
              //         "STATUS",
              //         style: TextStyle(
              //           color: textColor,
              //         ),
              //       ),
              //       SizedBox(
              //         height: (MediaQuery.of(context).size.height * 0.01).h,
              //       ),
              //       Container(
              //         width: (MediaQuery.of(context).size.width * 1).w,
              //         color: Colors.white,
              //         child: DropdownButtonHideUnderline(
              //           child: ButtonTheme(
              //             alignedDropdown: true,
              //             child: DropdownButton(
              //               isExpanded: true,
              //               value: dropdownValue,
              //               items: items,
              //               onChanged: (value) {},
              //               style: TextStyle(
              //                 fontSize: 18.sp,
              //                 color: textColor,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         height: (MediaQuery.of(context).size.height * 0.03).h,
              //       ),
              //       Container(
              //         height: (MediaQuery.of(context).size.height * 0.06).h,
              //         child: ElevatedButton(
              //           //5A8DEE
              //           style: ElevatedButton.styleFrom(
              //             primary: Color(0xFF5A8DEE),
              //           ),
              //           onPressed: () {},
              //           child: Row(
              //             children: [
              //               Expanded(
              //                 child: Center(
              //                   child: Text(
              //                     'Clear',
              //                     style: TextStyle(
              //                       fontSize: 16.sp,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: (MediaQuery.of(context).size.height * 0.03).h,
              // ),
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.8,
                  // width: (MediaQuery.of(context).size.width * 0.85).w,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       "SHOW",
                      //       style: TextStyle(
                      //         fontSize: 16.sp,
                      //         color: textColor,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: MediaQuery.of(context).size.width * 0.03,
                      //     ),
                      //     Container(
                      //       height: MediaQuery.of(context).size.height * 0.04,
                      //       width: MediaQuery.of(context).size.width * 0.19,
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         border: Border.all(
                      //           width: 0.5,
                      //           color: Colors.grey,
                      //         ),
                      //         borderRadius: BorderRadius.circular(5),
                      //       ),
                      //       child: DropdownButtonHideUnderline(
                      //         child: ButtonTheme(
                      //           padding: EdgeInsets.all(0),
                      //           alignedDropdown: true,
                      //           child: DropdownButton(
                      //             value: dropdownValueNumber,
                      //             items: itemsNumbers,
                      //             onChanged: (value) {},
                      //             style: TextStyle(
                      //               fontSize: 16.sp,
                      //               color: textColor,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: MediaQuery.of(context).size.width * 0.03,
                      //     ),
                      //     Text(
                      //       "ENTRIES",
                      //       style: TextStyle(
                      //         fontSize: 16.sp,
                      //         color: textColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tickets",
                              style: TextStyle(
                                fontSize: 20.sp,
                                // color: Provider.of<ThemeProvider>(context)
                                //         .getTheme()
                                //     ? darkTextHeadingColor
                                //     : textColor,
                                color: textColor,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    // color: Provider.of<ThemeProvider>(context)
                                    //         .getTheme()
                                    //     ? darkThemeContainerColor
                                    //     : Colors.white,
                                    color: Colors.white,
                                    child: DropdownButtonHideUnderline(
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton(
                                          // dropdownColor:
                                          //     Provider.of<ThemeProvider>(
                                          //                 context)
                                          //             .getTheme()
                                          //         ? darkThemeBackgroundColor
                                          //         : backgroundColor,
                                          dropdownColor: backgroundColor,
                                          isExpanded: false,
                                          hint: Row(
                                            children: [
                                              Icon(
                                                Icons.filter_list,
                                                // color:
                                                //     Provider.of<ThemeProvider>(
                                                //                 context)
                                                //             .getTheme()
                                                //         ? darkTextHeadingColor
                                                //         : textColor,
                                                color: textColor,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                "Filter",
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  // color:
                                                  //     Provider.of<ThemeProvider>(
                                                  //                 context)
                                                  //             .getTheme()
                                                  //         ? darkTextHeadingColor
                                                  //         : textColor,
                                                  color: textColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            // color: Provider.of<ThemeProvider>(
                                            //             context)
                                            //         .getTheme()
                                            //     ? darkTextColor
                                            //     : textColor,
                                            color: textColor,
                                          ),
                                          items: filterItems,
                                          onChanged: (value) {},
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            // color: Provider.of<ThemeProvider>(
                                            //             context)
                                            //         .getTheme()
                                            //     ? darkTextColor
                                            //     : textColor,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        // height: (MediaQuery.of(context).size.height * 0.02).h,
                        height: 8.h,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Expanded(
                        child: Container(
                          // height: (MediaQuery.of(context).size.height * 0.6).h,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ExpandableContainer(
                                controller: expandableListController[index],
                                headerTitle: "Ticket 00$index",
                                // headerTitleColor:
                                //     Provider.of<ThemeProvider>(context)
                                //             .getTheme()
                                //         ? darkTextHeadingColor
                                //         : textColor,
                                headerTitleColor: textColor,
                                // headerContainerColor:
                                //     Provider.of<ThemeProvider>(context)
                                //             .getTheme()
                                //         ? darkThemeContainerColor
                                //         : Colors.white,
                                headerContainerColor: Colors.white,
                                // headerIconColor:
                                //     Provider.of<ThemeProvider>(context)
                                //             .getTheme()
                                //         ? darkTextHeadingColor
                                //         : textColor,
                                headerIconColor: textColor,
                                leadingIcon: Icons.home,
                                showLeadingIcon: false,
                                onPressed: () {
                                  setState(() {
                                    expandableListController[index].toggle();
                                  });
                                },
                                expandedBodyWidget: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    // color: Provider.of<ThemeProvider>(context)
                                    //         .getTheme()
                                    //     ? darkThemeExpandedContainerColor
                                    //     : Colors.white,
                                    color: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 10.h,
                                    ),
                                    width:
                                        (MediaQuery.of(context).size.width * 1)
                                            .w,
                                    child: Column(
                                      children: [
                                        HeadingDetailsWidget(
                                          heading: "Created by:",
                                          detail: "Engage24 SA - Super - admin",
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        HeadingDetailsWidget(
                                          heading: "Assign to:",
                                          detail: "Datalyticx - Sales",
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        HeadingDetailsWidget(
                                          heading: "Current Status:",
                                          detail: "Open",
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  Routes.ticket,
                                                );
                                              },
                                              child: Text("More"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              // return Container(
                              //   padding: EdgeInsets.symmetric(
                              //     horizontal: 15,
                              //     vertical: 10,
                              //   ),
                              //   width: double.infinity,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text(
                              //         "Ticket 00$index",
                              //         style: TextStyle(
                              //           fontSize: 18.sp,
                              //           color: textColor,
                              //         ),
                              //       ),
                              //       index % 2 == 0
                              //           ? Container(
                              //               padding: EdgeInsets.symmetric(
                              //                 horizontal: 15,
                              //                 vertical: 5,
                              //               ),
                              //               decoration: BoxDecoration(
                              //                 color: Colors.red[100],
                              //                 borderRadius:
                              //                     BorderRadius.circular(15),
                              //               ),
                              //               child: Center(
                              //                 child: Text(
                              //                   "Open",
                              //                   style: TextStyle(
                              //                     fontSize: 16.sp,
                              //                     color: Colors.red,
                              //                   ),
                              //                 ),
                              //               ),
                              //             )
                              //           : Container(
                              //               padding: EdgeInsets.symmetric(
                              //                 horizontal: 15,
                              //                 vertical: 5,
                              //               ),
                              //               decoration: BoxDecoration(
                              //                 color: Colors.yellow[100],
                              //                 borderRadius:
                              //                     BorderRadius.circular(15),
                              //               ),
                              //               child: Center(
                              //                 child: Text(
                              //                   "Processing",
                              //                   style: TextStyle(
                              //                     fontSize: 16.sp,
                              //                     color: Colors.yellowAccent[700],
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //       Icon(
                              //         Icons.more_vert,
                              //         color: textColor,
                              //       ),
                              //     ],
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ),

                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: DataTable(
                      //     sortColumnIndex: sortColumnIndex,
                      //     sortAscending: isAssending,
                      //     showCheckboxColumn: false,
                      //     dataRowHeight: 60,
                      //     columns: [
                      //       DataColumn(
                      //         onSort: onSort,
                      //         label: Text(
                      //           "ID",
                      //         ),
                      //       ),
                      //       DataColumn(
                      //         onSort: onSort,
                      //         label: Text(
                      //           "USERNAME",
                      //         ),
                      //       ),
                      //       DataColumn(
                      //         onSort: onSort,
                      //         label: Text(
                      //           "NAME",
                      //         ),
                      //       ),
                      //       DataColumn(
                      //         onSort: onSort,
                      //         label: Text(
                      //           "LAST ACTIVITY",
                      //         ),
                      //       ),
                      //       DataColumn(
                      //         onSort: onSort,
                      //         label: Text(
                      //           "VERIFIED",
                      //         ),
                      //       ),
                      //       DataColumn(
                      //         onSort: onSort,
                      //         label: Text(
                      //           "ROLE",
                      //         ),
                      //       ),
                      //       DataColumn(
                      //         onSort: onSort,
                      //         label: Text(
                      //           "STATUS",
                      //         ),
                      //       ),
                      //     ],
                      //     rows: List<DataRow>.generate(
                      //       10,
                      //       (index) => DataRow(
                      //         selected: selected[index],
                      //         onSelectChanged: (value) {
                      //           setState(() {
                      //             selected[index] = value;
                      //           });
                      //         },
                      //         cells: [
                      //           DataCell(
                      //             Text("30$index"),
                      //           ),
                      //           DataCell(
                      //             Text("dean3004"),
                      //             onTap: () {
                      //               Navigator.pushNamed(
                      //                 context,
                      //                 TicketInfoScreen.routeName,
                      //               );
                      //             },
                      //           ),
                      //           DataCell(
                      //             Text("Dean Stanley"),
                      //           ),
                      //           DataCell(
                      //             Text("30/04/2019"),
                      //           ),
                      //           DataCell(
                      //             Text("No"),
                      //           ),
                      //           DataCell(
                      //             Text("Staff"),
                      //           ),
                      //           DataCell(
                      //             Container(
                      //               height: 25,
                      //               width: 70,
                      //               decoration: BoxDecoration(
                      //                 color: Color(0xFFDEF9EB),
                      //                 borderRadius: BorderRadius.circular(3),
                      //               ),
                      //               child: Center(
                      //                 child: Text(
                      //                   "ACTIVE",
                      //                   style: TextStyle(
                      //                     color: Color(0xFF4FDE97),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
