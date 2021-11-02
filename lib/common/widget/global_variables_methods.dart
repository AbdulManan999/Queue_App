import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

Color textColor = Color(0xFF475F7B);
Color backgroundColor = Color(0xFFF2F4F4);

Color darkTextColor = Color(0xFF8A99B5);
Color darkTextHeadingColor = Color(0xFFBDD1F8);
Color darkTextFieldColor = Color(0xFF101724);

Color darkThemeBackgroundColor = Color(0xFF1A233A);
Color darkThemeContainerColor = Color(0xFF272E48);
Color darkThemeExpandedContainerColor = Color(0x80272E48);

// tags color and its shadow

//red Closed
Color darkShadowOpenColor = Color(0xFF412C40);
Color shadowOpenColor = Color(0xFFF5D5D5);

//cyan twitter shadow
Color darkShadowTwitterColor = Color(0xFF265E71);
Color shadowTwitterColor = Color(0xFFC2ECEF);

// green whatsapp shadow
Color darkShadowWhatsappColor = Color(0xFF316161);
Color shadowWhatsappColor = Color(0xFFCDEFDF);

// yellow processing shadow
Color darkShadowProcessingColor = Color(0xFF4B4347);
Color shadowProcessingColor = Color(0xFFFFF1DF);

// blue any shadow
Color darkShadowAnyColor = Color(0xFF2F3E64);
Color shadowAnyColor = Color(0xFFE3ECFC);

// blue any shadow
Color darkShadowClosedColor = Color(0xFF2C3651);
Color shadowClosedColor = Color(0xFFE0E4E9);

StreamController<List<Widget>> comments = StreamController();
List<Widget> commentList = [];

Future<dynamic> getRequest(
  String url,
  Map<String, String> headers,
) async {
  http.Response response = await http.get(Uri.parse(url), headers: headers);

  try {
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      return 'failed'; //return jsonDecode(response.body);
    }
  } catch (e) {
    return 'failed';
  }
}

Future<dynamic> getImagesRequest(
  String url,
) async {
  http.Response response = await http.get(Uri.parse(url));

  try {
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      return 'failed'; //return jsonDecode(response.body);
    }
  } catch (e) {
    return 'failed';
  }
}

Future<bool> exitDialog(context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Are you sure?"),
      content: Text("Do you want to exit form the app?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            SystemNavigator.pop(animated: true);
          },
          child: Text("Exit"),
        ),
      ],
    ),
  );
}

PreferredSizeWidget appBar(context) {
  double appbarHeight = MediaQuery.of(context).size.height * 0.09;
  double contHeight = MediaQuery.of(context).size.height * 0.09;

  double appbarWidth = MediaQuery.of(context).size.height * 1;
  double bodyHeight = (MediaQuery.of(context).size.height * 1) -
      appbarHeight -
      MediaQuery.of(context).padding.top;
  return PreferredSize(
    preferredSize: Size(appbarWidth, appbarHeight),
    child: Column(
      children: [
        // Container(
        //   width: MediaQuery.of(context).size.width * 0.7,
        //   height: MediaQuery.of(context).size.height * 0.1,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('images/logo.png'),
        //       fit: BoxFit.fitWidth,
        //     ),
        //   ),
        // ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: MediaQuery.of(context).size.width * 0.001,
              ),
            ),
          ),
          height: contHeight,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/useravatar.jpg'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
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
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(FontAwesomeIcons.search),
                          ),
                          hintText: 'Search'),
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
      ],
    ),
  );
}
