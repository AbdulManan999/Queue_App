import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:task_queues_app/app/theme.dart';
import 'package:task_queues_app/common/util/form_validator.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _taskTitleController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List<String> itemList = [];
  List<DragAndDropList> _contents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contents.add(DragAndDropList(
      header: Container(),
      footer: Container(),
      contentsWhenEmpty: Container(),
      children: <DragAndDropItem>[
        DragAndDropItem(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      // fillColor: Provider.of<ThemeProvider>(context).getTheme()
                      //     ? darkTextFieldColor
                      //     : backgroundColor,
                      // prefixIcon: widget.icon,
                      fillColor: Colors.white,
                      filled: true,

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     style: BorderStyle.solid,
                      //     width: 1,
                      //     color: Colors.transparent, //Color(0x7A5ADB5),
                      //   ),
                      //   borderRadius: BorderRadius.circular(6),
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[600],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 16.0,
                      ),
                      hintText: "Tap to enter task name",
                      hintStyle: TextStyle(
                        // color: Provider.of<ThemeProvider>(context).getTheme()
                        //     ? Colors.grey
                        //     : textColor,
                        color: Color(0xFF475F7B),
                        fontSize: 18.sp,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                    obscureText: false,
                    controller: _taskTitleController,
                    validator: (value) {
                      if (FormValidator.validateName(value)) {
                        return null;
                      } else {
                        return 'Please Enter the text';
                      }
                    },
                  ),
                  // SliderTheme(
                  //   data: SliderThemeData(
                  //     inactiveTrackColor: Color(0xFF8D8E98),
                  //     trackHeight: 1,
                  //     activeTrackColor: Colors.indigo,
                  //     thumbColor: Colors.grey,
                  //     minThumbSeparation: 10,
                  //     thumbShape: RoundSliderThumbShape(
                  //         enabledThumbRadius: 10.0),
                  //   ),
                  //   child: Slider(
                  //     value: 100,
                  //     min: 0,
                  //     max: 100,
                  //     onChanged: (double value) {},
                  //   ),
                  // ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              // fillColor: Provider.of<ThemeProvider>(context).getTheme()
                              //     ? darkTextFieldColor
                              //     : backgroundColor,
                              // prefixIcon: widget.icon,
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     style: BorderStyle.solid,
                              //     width: 1,
                              //     color: Colors.transparent, //Color(0x7A5ADB5),
                              //   ),
                              //   borderRadius: BorderRadius.circular(6),
                              // ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue[600],
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 16.0,
                              ),
                              hintText: "00:00",
                              hintStyle: TextStyle(
                                // color: Provider.of<ThemeProvider>(context).getTheme()
                                //     ? Colors.grey
                                //     : textColor,
                                color: Color(0xFF475F7B),
                                fontSize: 25.sp,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 25.sp,
                            ),
                            obscureText: false,
                            controller: TextEditingController(),
                            validator: (value) {
                              if (FormValidator.validateName(value)) {
                                return null;
                              } else {
                                return 'Please Enter the text';
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "to",
                        style: TextStyle(fontSize: 25.sp),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              // fillColor: Provider.of<ThemeProvider>(context).getTheme()
                              //     ? darkTextFieldColor
                              //     : backgroundColor,
                              // prefixIcon: widget.icon,
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide(
                              //     style: BorderStyle.solid,
                              //     width: 1,
                              //     color: Colors.transparent, //Color(0x7A5ADB5),
                              //   ),
                              //   borderRadius: BorderRadius.circular(6),
                              // ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue[600],
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.red),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 16.0,
                              ),
                              hintText: "00:00",
                              hintStyle: TextStyle(
                                // color: Provider.of<ThemeProvider>(context).getTheme()
                                //     ? Colors.grey
                                //     : textColor,
                                color: Color(0xFF475F7B),
                                fontSize: 25.sp,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 25.sp,
                            ),
                            obscureText: false,
                            controller: TextEditingController(),
                            validator: (value) {
                              if (FormValidator.validateName(value)) {
                                return null;
                              } else {
                                return 'Please Enter the text';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
      _contents[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _contents.removeAt(oldListIndex);
      _contents.insert(newListIndex, movedList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_rounded),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "All Task Queues",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 90, bottom: 40),
                  child: Column(
                    children: [
                      Text(
                        "Task Queues",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 36,
                            ),
                      ),
                      Text(
                        "29, Oct 2021",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: DragAndDropLists(
                    disableScrolling: true,
                    children: _contents,
                    onItemReorder: _onItemReorder,
                    onListReorder: _onListReorder,
                  ),
                ),
                // Container(
                // child: DragAndDropLists(
                //   // lastItemTargetHeight: 50,
                //   // addLastItemTargetHeightToTop: true,
                //   // lastListTargetSize: 30,
                //   listPadding: EdgeInsets.all(16),
                //   listInnerDecoration: BoxDecoration(
                //     color: Theme.of(context).canvasColor,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   children: _contents,
                //   itemDivider: Divider(thickness: 2, height: 2, color: backgroundColor),
                //   itemDecorationWhileDragging: BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                //   ),
                //   // itemDragHandle: buildDragHandle(),
                //   onItemReorder: onReorderListItem,
                //   // onListReorder: onReorderList,
                // ),
                // ),
                _addButton(context),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return Container(
      width: 140,
      height: 54,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(width: 2, color: colorSecondory),
        ),
        onPressed: () {
          setState(() {
            _contents.add(
              DragAndDropList(
                header: Container(),
                footer: Container(),
                contentsWhenEmpty: Container(),
                children: <DragAndDropItem>[
                  DragAndDropItem(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                // fillColor: Provider.of<ThemeProvider>(context).getTheme()
                                //     ? darkTextFieldColor
                                //     : backgroundColor,
                                // prefixIcon: widget.icon,
                                fillColor: Colors.white,
                                filled: true,

                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                // enabledBorder: OutlineInputBorder(
                                //   borderSide: BorderSide(
                                //     style: BorderStyle.solid,
                                //     width: 1,
                                //     color: Colors.transparent, //Color(0x7A5ADB5),
                                //   ),
                                //   borderRadius: BorderRadius.circular(6),
                                // ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.blue[600],
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 16.0,
                                ),
                                hintText: "Tap to enter task name",
                                hintStyle: TextStyle(
                                  // color: Provider.of<ThemeProvider>(context).getTheme()
                                  //     ? Colors.grey
                                  //     : textColor,
                                  color: Color(0xFF475F7B),
                                  fontSize: 18.sp,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                              obscureText: false,
                              controller: _taskTitleController,
                              validator: (value) {
                                if (FormValidator.validateName(value)) {
                                  return null;
                                } else {
                                  return 'Please Enter the text';
                                }
                              },
                            ),
                            // SliderTheme(
                            //   data: SliderThemeData(
                            //     inactiveTrackColor: Color(0xFF8D8E98),
                            //     trackHeight: 1,
                            //     activeTrackColor: Colors.indigo,
                            //     thumbColor: Colors.grey,
                            //     minThumbSeparation: 10,
                            //     thumbShape: RoundSliderThumbShape(
                            //         enabledThumbRadius: 10.0),
                            //   ),
                            //   child: Slider(
                            //     value: 100,
                            //     min: 0,
                            //     max: 100,
                            //     onChanged: (double value) {},
                            //   ),
                            // ),
                            Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        // fillColor: Provider.of<ThemeProvider>(context).getTheme()
                                        //     ? darkTextFieldColor
                                        //     : backgroundColor,
                                        // prefixIcon: widget.icon,
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        // enabledBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     style: BorderStyle.solid,
                                        //     width: 1,
                                        //     color: Colors.transparent, //Color(0x7A5ADB5),
                                        //   ),
                                        //   borderRadius: BorderRadius.circular(6),
                                        // ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue[600],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 16.0,
                                        ),
                                        hintText: "00:00",
                                        hintStyle: TextStyle(
                                          // color: Provider.of<ThemeProvider>(context).getTheme()
                                          //     ? Colors.grey
                                          //     : textColor,
                                          color: Color(0xFF475F7B),
                                          fontSize: 25.sp,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: 25.sp,
                                      ),
                                      obscureText: false,
                                      controller: TextEditingController(),
                                      validator: (value) {
                                        if (FormValidator.validateName(value)) {
                                          return null;
                                        } else {
                                          return 'Please Enter the text';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "to",
                                  style: TextStyle(fontSize: 25.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        // fillColor: Provider.of<ThemeProvider>(context).getTheme()
                                        //     ? darkTextFieldColor
                                        //     : backgroundColor,
                                        // prefixIcon: widget.icon,
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        // enabledBorder: OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //     style: BorderStyle.solid,
                                        //     width: 1,
                                        //     color: Colors.transparent, //Color(0x7A5ADB5),
                                        //   ),
                                        //   borderRadius: BorderRadius.circular(6),
                                        // ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.blue[600],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 16.0,
                                        ),
                                        hintText: "00:00",
                                        hintStyle: TextStyle(
                                          // color: Provider.of<ThemeProvider>(context).getTheme()
                                          //     ? Colors.grey
                                          //     : textColor,
                                          color: Color(0xFF475F7B),
                                          fontSize: 25.sp,
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontSize: 25.sp,
                                      ),
                                      obscureText: false,
                                      controller: TextEditingController(),
                                      validator: (value) {
                                        if (FormValidator.validateName(value)) {
                                          return null;
                                        } else {
                                          return 'Please Enter the text';
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });

          // if (_formkey.currentState.validate()) {
          //   // BlocProvider.of<HomePageBloc>(context).add(
          //   //     AddButtonPressed(item: _taskTitleController.text)) ;
          //   setState(() {
          //     itemList.add(_taskTitleController.text);
          //   });
          // }
        },
        child: Icon(
          Icons.add,
          size: 42,
          color: colorSecondory,
        ),
      ),
    );
  }

// void onReorderListItem(
//     int oldItemIndex,
//     int oldListIndex,
//     int newItemIndex,
//     int newListIndex,
//     ) {
//   setState(() {
//     final oldListItems = _contents[oldListIndex].children;
//     final newListItems = _contents[newListIndex].children;
//
//     final movedItem = oldListItems.removeAt(oldItemIndex);
//     newListItems.insert(newItemIndex, movedItem);
//   });
// }

// DragAndDropList buildList(DraggableList list) => DragAndDropList(
//   header: Container(
//     padding: EdgeInsets.all(8),
//     child: Text(
//       "constant Text",
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//     ),
//   ),
//   children: list.items
//       .map((item) => DragAndDropItem(
//     child: ListTile(
//
//       title: Text(item.title),
//     ),
//   )
//   ).toList(),
// );

// Widget _buildListitem(BuildContext context) {
//    return Draan
// }
}
