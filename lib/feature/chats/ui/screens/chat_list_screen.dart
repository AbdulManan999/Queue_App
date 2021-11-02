import 'package:engage_app/common/widget/app_drawer.dart';
import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/feature/chats/ui/widgets/chat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  static const routeName = '/ChatList';

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double appbarHeight = 132.h;
    double contHeight = MediaQuery.of(context).size.height * 0.09;
    double appbarWidth = MediaQuery.of(context).size.height * 1;
    double bodyHeight = (MediaQuery.of(context).size.height * 1) -
        appbarHeight -
        MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Provider.of<ThemeProvider>(context).getTheme()
        //     ? darkThemeBackgroundColor
        //     : backgroundColor,
        backgroundColor: backgroundColor,
        // appBar: appBar(context),
        appBar: PreferredSize(
          preferredSize: Size(appbarWidth, appbarHeight),
          child: Container(
            padding: EdgeInsets.only(
              right: 17.w,
              left: 28.w,
              top: 8.h,
              bottom: 8.h,
            ),
            // color: Provider.of<ThemeProvider>(context).getTheme()
            //     ? darkThemeBackgroundColor
            //     : backgroundColor,
            color: backgroundColor,
            height: appbarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  // backgroundColor:
                  // Provider.of<ThemeProvider>(context).getTheme()
                  //     ? darkThemeBackgroundColor
                  //     : backgroundColor,
                  backgroundColor: backgroundColor,
                  elevation: 0,
                  leading: InkWell(
                    onTap: () {
                      print("tapped");
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
                      Text(
                        "Messages",
                        style: TextStyle(
                          fontSize: 20.sp,
                          // color: Provider.of<ThemeProvider>(context).getTheme()
                          //     ? darkTextHeadingColor
                          //     : textColor,
                          color: textColor,
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
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.02,
                  height: 16.h,
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        // fillColor:
                        //     Provider.of<ThemeProvider>(context).getTheme()
                        //         ? darkThemeContainerColor
                        //         : Colors.white,
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            color: Color(0x7A5ADB5),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue[600],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Icon(
                            FontAwesomeIcons.search,
                            // color:
                            //     Provider.of<ThemeProvider>(context).getTheme()
                            //         ? darkTextColor
                            //         : textColor,
                            color: textColor,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          // color: Provider.of<ThemeProvider>(context).getTheme()
                          //     ? darkTextColor
                          //     : textColor,
                          color: textColor,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                // ChatHeaderWidget(
                //   title: 'CHANNELS',
                // ),
                // ChannelButton(
                //   title: 'Developers',
                // ),
                // ChannelButton(
                //   title: 'Designers',
                // ),
                // ChatHeaderWidget(
                //   title: 'CHATS',
                // ),
                ChatButton(
                  profileImageUrl: 'assets/images/mansoor.png',
                  fullName: 'Mansoor',
                  lastMessage:
                      'Hi there, Good to see you. How was the Party last night?',
                  source: "whatsapp",
                ),
                ChatButton(
                  profileImageUrl: 'assets/images/manan.jpg',
                  fullName: 'Abdul Manan',
                  lastMessage: 'Hi',
                  source: "twitter",
                ),
                ChatButton(
                  profileImageUrl: 'assets/images/sarfraz.png',
                  fullName: 'Sarfraz',
                  lastMessage: 'The others',
                  source: "whatsapp",
                ),
                ChatButton(
                  profileImageUrl: 'assets/images/rashid.png',
                  fullName: 'Rashid',
                  lastMessage: 'Lets go for dinner Today!',
                  source: "twitter",
                ),
                ChatButton(
                  profileImageUrl: 'assets/images/tansheet.png',
                  fullName: 'Tansheet Ali',
                  lastMessage: 'Busy right now',
                  source: "whatsapp",
                ),
                ChatButton(
                  profileImageUrl: 'assets/images/usman.png',
                  fullName: 'Usman',
                  lastMessage: 'Its my pleasure',
                  source: "twitter",
                ),
              ],
            ),
          ),
        ),

        // body: Column(
        //   children: [
        //     Container(
        //       height: 45,
        //       decoration: BoxDecoration(
        //         color: backgroundColor,
        //       ),
        //       child: TabBar(
        //         onTap: (int) {
        //           setState(() {});
        //         },
        //         indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
        //         controller: _tabController,
        //         indicator: BoxDecoration(
        //           color: _tabController.index == 0
        //               ? Color(0xFFC9EFE4)
        //               : Color(0xFFCADEF6),
        //           borderRadius: BorderRadius.circular(5),
        //         ),
        //         labelStyle: TextStyle(
        //           fontSize: 16.sp,
        //         ),
        //         labelColor: _tabController.index == 0
        //             ? Color(0xFF49DC94)
        //             : Color(0xFF6494EF),
        //         unselectedLabelColor: textColor,
        //         tabs: [
        //           Tab(
        //             text: 'Whatsapp Chats (31)',
        //           ),
        //           Tab(
        //             text: 'Twitter Chats (13)',
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: TabBarView(
        //         controller: _tabController,
        //         children: [
        //           WhatsappChatTab(),
        //           TwitterChatTab(),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
