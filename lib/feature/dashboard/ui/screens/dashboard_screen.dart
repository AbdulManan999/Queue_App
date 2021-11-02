import 'package:engage_app/common/constant/env.dart';
import 'package:engage_app/common/widget/app_drawer.dart';
import 'package:engage_app/common/widget/loading_widget.dart';
import 'package:engage_app/feature/dashboard/bloc/dashboard_bloc.dart';
import 'package:engage_app/feature/dashboard/bloc/index.dart';
import 'package:engage_app/feature/dashboard/model/GDPData.dart';
import 'package:engage_app/feature/dashboard/ui/widgets/heading_and_its_number_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  List<GDPData> _chartData;
  List<GDPData> _chartData2;
  TooltipBehavior _tooltipBehavior;
  TooltipBehavior _tooltipBehavior2;

  DateTime currentBackPressTime;

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(
        continents: "Pending",
        gdp: 2000,
      ),
      GDPData(
        continents: "Resolved",
        gdp: 8000,
      ),
    ];

    return chartData;
  }

  List<GDPData> getChartData2() {
    final List<GDPData> chartData2 = [
      GDPData(
        continents: "Pending",
        gdp: 10000,
      ),
      GDPData(
        continents: "Resolved",
        gdp: 9000,
      ),
      GDPData(
        continents: "America",
        gdp: 8000,
      ),
    ];

    return chartData2;
  }

  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    _chartData2 = getChartData2();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _tooltipBehavior2 = TooltipBehavior(enable: true);
    super.initState();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("youe are going to exit")));
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    double appbarHeight = 75.h;
    // double contHeight = (MediaQuery.of(context).size.height * 0.09).h;
    double appbarWidth = (MediaQuery.of(context).size.height * 1).w;
    double bodyHeight = (MediaQuery.of(context).size.height * 1).h -
        appbarHeight -
        MediaQuery.of(context).padding.top;
    print(appbarHeight);

    return BlocProvider(
      create: (context) => DashboardBloc()
        ..add(DashboardLoadingEvent(env: RepositoryProvider.of<Env>(context))),
      child: SafeArea(
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
              padding: EdgeInsets.only(right: 18.w, left: 30.w),
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
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                          height: 60.h,
                          width: (MediaQuery.of(context).size.width * 0.14).w,
                          child: Image.asset(
                            "assets/images/logo2.png",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.03).w,
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
          drawer: AppDrawer(
            scaffoldKey: _scaffoldKey,
          ),
          body: WillPopScope(
            onWillPop: () {
              exitDialog(context);
              return Future.value(false);
            },
            child: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                if (state is DashboardLoadSuccess) {
                  return _buildBodyWidget(context, state, bodyHeight);
                } else if (state is DashboardLoadFail) {
                  return Text("failed to Load");
                }
                return LoadingWidget(
                  visible: true,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBodyWidget(
      BuildContext context, DashboardLoadSuccess state, double bodyHeight) {
    return Container(
      height: bodyHeight,
      width: (MediaQuery.of(context).size.width * 1).w,
      // padding: EdgeInsets.symmetric(
      //   horizontal: 25,
      // ),
      // color: Provider.of<ThemeProvider>(context).getTheme()
      //     ? darkThemeBackgroundColor
      //     : backgroundColor,
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.43,
            //   width: MediaQuery.of(context).size.width * 0.82,
            //   // height: 354.h,
            //   // width: 310.w,
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 25.w,
            //     vertical: 20.h,
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[300],
            //         blurRadius: 12,
            //         spreadRadius: 5,
            //         offset: Offset(
            //           -15,
            //           15,
            //         ),
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Congratulations John!',
            //         style: TextStyle(
            //           fontSize: 27.sp,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 12.h,
            //       ),
            //       Text(
            //         'Best seller of the month',
            //         style: TextStyle(
            //           fontSize: 16.sp,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 38.h,
            //       ),
            //       Row(
            //         children: [
            //           Expanded(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   '\$98k',
            //                   style: TextStyle(
            //                     fontSize: 48.sp,
            //                     fontWeight: FontWeight.bold,
            //                     color: Color(0xFF5A8DEE),
            //                   ),
            //                 ),
            //                 Text(
            //                   'You have done 57.6% more sales today',
            //                   style: TextStyle(
            //                     fontSize: 16.sp,
            //                     height: 1.6.h,
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   height: 25.h,
            //                 ),
            //                 Container(
            //                   width:
            //                       MediaQuery.of(context).size.width * 0.28,
            //                   child: ElevatedButton(
            //                     style: ElevatedButton.styleFrom(
            //                       primary: Color(0xFF5A8DEE),
            //                     ),
            //                     onPressed: () {},
            //                     child: Text('View Sales'),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Expanded(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               children: [
            //                 Image.asset('images/cup.png'),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.05,
            // ),

            Container(
              // width: (MediaQuery.of(context).size.width * 0.8).w,
              width: 330.w,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 230.h,
                      decoration: BoxDecoration(
                        // color:
                        // Provider.of<ThemeProvider>(context).getTheme()
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: CircleAvatar(
                              // backgroundColor:
                              //     Provider.of<ThemeProvider>(context)
                              //             .getTheme()
                              //         ? darkShadowTwitterColor
                              //         : shadowTwitterColor,
                              backgroundColor: shadowTwitterColor,
                              foregroundColor: Colors.transparent,
                              radius: 30,
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.cyan[400],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            'Accounts Associated',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              // color: Provider.of<ThemeProvider>(context)
                              //         .getTheme()
                              //     ? darkTextColor
                              //     : textColor,
                              color: textColor,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 35.sp,
                              // color: Provider.of<ThemeProvider>(context)
                              //         .getTheme()
                              //     ? darkTextHeadingColor
                              //     : textColor,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.05).w,
                  ),
                  Expanded(
                    child: Container(
                      height: 230.h,
                      width: (MediaQuery.of(context).size.width * 0.8).w,
                      decoration: BoxDecoration(
                        // color:
                        //     Provider.of<ThemeProvider>(context).getTheme()
                        //         ? darkThemeContainerColor
                        //         : Colors.white,
                        color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey[300],
                        //     blurRadius: 12,
                        //     spreadRadius: 5,
                        //     offset: Offset(
                        //       -5,
                        //       15,
                        //     ),
                        //   ),
                        // ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: CircleAvatar(
                              // backgroundColor:
                              //     Provider.of<ThemeProvider>(context)
                              //             .getTheme()
                              //         ? darkShadowWhatsappColor
                              //         : shadowWhatsappColor,
                              backgroundColor: shadowWhatsappColor,
                              radius: 30,
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: Color(0xFF3FDB8D),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            'Accounts Associated',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.sp,
                              // color: Provider.of<ThemeProvider>(context)
                              //         .getTheme()
                              //     ? darkTextColor
                              //     : textColor,
                              color: textColor,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontSize: 35.sp,
                              // color: Provider.of<ThemeProvider>(context)
                              //         .getTheme()
                              //     ? darkTextHeadingColor
                              //     : textColor,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.03).h,
            ),
            Container(
              height: 230.h,
              // width: (MediaQuery.of(context).size.width * 0.8).w,
              width: 330.w,
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
                //       -5,
                //       15,
                //     ),
                //   ),
                // ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CircleAvatar(
                      // backgroundColor:
                      //     Provider.of<ThemeProvider>(context).getTheme()
                      //         ? darkShadowClosedColor
                      //         : shadowClosedColor,
                      backgroundColor: shadowClosedColor,
                      radius: 30,
                      child: Center(
                        child: Icon(
                          CupertinoIcons.doc_plaintext,
                          color: Color(0xFF475F7B),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Total Tickets',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      // color:
                      //     Provider.of<ThemeProvider>(context).getTheme()
                      //         ? darkTextColor
                      //         : textColor,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    '0',
                    style: TextStyle(
                      fontSize: 35.sp,
                      // color:
                      //     Provider.of<ThemeProvider>(context).getTheme()
                      //         ? darkTextHeadingColor
                      //         : textColor,
                      color: textColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.03).h,
            ),
            Container(
              // height: (MediaQuery.of(context).size.height * 0.4).h,
              height: 325.h,
              // width: (MediaQuery.of(context).size.width * 0.8).w,
              width: 330.w,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadingAndItsNumber(
                    title: "Total Tickets Issued",
                    value: "50",
                  ),
                  SizedBox(
                    // height: (MediaQuery.of(context).size.height * 0.03).h,
                    height: 25.h,
                  ),
                  HeadingAndItsNumber(
                    title: "Total Tickets Pending",
                    value: "21",
                  ),
                  SizedBox(
                    // height: (MediaQuery.of(context).size.height * 0.03).h,
                    height: 25.h,
                  ),
                  HeadingAndItsNumber(
                    title: "Total Tickets Resolved",
                    value: "39",
                  ),
                ],
              ),
            ),
            SizedBox(
              // height: (MediaQuery.of(context).size.height * 0.03).h,
              height: 25.h,
            ),
            Container(
                // height: (MediaQuery.of(context).size.height * 0.25).h,
                height: 205.h,
                // width: (MediaQuery.of(context).size.width * 0.8).w,
                width: 330.w,
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
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadingAndItsNumber(
                              title: "Total Twitter \nChats", value: "34"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeadingAndItsNumber(
                              title: "Total Whatsapp \nChats", value: "34"),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(
              // height: (MediaQuery.of(context).size.height * 0.03).h,
              height: 25.h,
            ),
            Container(
              // height: (MediaQuery.of(context).size.height * 0.5).h,
              height: 410.h,
              // width: (MediaQuery.of(context).size.width * 0.8).w,
              width: 330.w,
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
              child: Center(
                child: SfCircularChart(
                  palette: [
                    // Colors.blue[300],
                    Colors.blue[200],
                    Colors.blue[800],
                  ],
                  title: ChartTitle(
                    text: "Requests Information",
                    textStyle: TextStyle(
                      fontSize: 18.sp,
                      // color:
                      //     Provider.of<ThemeProvider>(context).getTheme()
                      //         ? darkTextHeadingColor
                      //         : textColor,
                      color: textColor,
                    ),
                  ),
                  legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.scroll,
                    isResponsive: true,
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      // color:
                      //     Provider.of<ThemeProvider>(context).getTheme()
                      //         ? darkTextColor
                      //         : textColor,
                      color: textColor,
                    ),
                  ),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    DoughnutSeries<GDPData, String>(
                      // innerRadius: "75",
                      // gap: "3",
                      // trackBorderWidth: 1,
                      radius: "80",
                      // selectionBehavior: SelectionBehavior(
                      //   enable: true,
                      //   toggleSelection: true,
                      // ),
                      // maximumValue: 120000,
                      dataSource: _chartData,
                      xValueMapper: (GDPData data, _) => data.continents,
                      yValueMapper: (GDPData data, _) => data.gdp,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: false,
                        borderRadius: 3,
                      ),
                      enableTooltip: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              // height: (MediaQuery.of(context).size.height * 0.03).h,
              height: 25.h,
            ),
            Container(
              // height: (MediaQuery.of(context).size.height * 0.5).h,
              height: 410.h,
              // width: (MediaQuery.of(context).size.width * 0.8).w,
              width: 330.w,
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
              child: Center(
                child: SfCircularChart(
                  palette: [
                    // Colors.blue[300],
                    Colors.yellowAccent,
                    Colors.redAccent,
                    Colors.blueAccent,
                  ],
                  title: ChartTitle(
                    text: "Requests Information",
                    textStyle: TextStyle(
                      fontSize: 18.sp,
                      // color:
                      //     Provider.of<ThemeProvider>(context).getTheme()
                      //         ? darkTextHeadingColor
                      //         : textColor,
                      color: textColor,
                    ),
                  ),
                  legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.scroll,
                    isResponsive: true,
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      // color:
                      //     Provider.of<ThemeProvider>(context).getTheme()
                      //         ? darkTextColor
                      //         : textColor,
                      color: textColor,
                    ),
                  ),
                  tooltipBehavior: _tooltipBehavior2,
                  series: <CircularSeries>[
                    RadialBarSeries<GDPData, String>(
                      innerRadius: "40",
                      gap: "10",
                      trackBorderWidth: 1,
                      trackColor: Colors.transparent,
                      radius: "80",
                      selectionBehavior: SelectionBehavior(
                        enable: true,
                        toggleSelection: true,
                      ),
                      maximumValue: 12000,
                      dataSource: _chartData2,
                      xValueMapper: (GDPData data, _) => data.continents,
                      yValueMapper: (GDPData data, _) => data.gdp,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: false,
                        borderRadius: 3,
                      ),
                      enableTooltip: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              // height: (MediaQuery.of(context).size.height * 0.05).h,
              height: 50.h,
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   width: MediaQuery.of(context).size.width * 0.85,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[300],
            //         blurRadius: 12,
            //         spreadRadius: 5,
            //         offset: Offset(
            //           -15,
            //           15,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.05,
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   width: MediaQuery.of(context).size.width * 0.85,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey[300],
            //         blurRadius: 12,
            //         spreadRadius: 5,
            //         offset: Offset(
            //           -15,
            //           15,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.05,
            // ),
          ],
        ),
      ),
    );
  }

  //Function

}
