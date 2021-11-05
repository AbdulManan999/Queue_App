import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:task_queues_app/app/theme.dart';
import 'package:task_queues_app/common/util/form_validator.dart';
import 'package:task_queues_app/feature/home/ui/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _taskTitleController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List<String> itemList = [];
  List<DragAndDropList> _contents = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dragDropWidget();

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
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF3F3F3),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  "${itemList.length} task queues",
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 76, right: 20),
                child: Icon(
                  Icons.insert_drive_file_outlined,
                  color: colorSecondory,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 90, bottom: 40),
                child: Text(
                  "Task Queues",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 36,
                      ),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height *0.2,
                color: Colors.orange,
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
              SizedBox(
                height: 20,
              ),
              _addButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 20),
      width: 140,
      height: 54,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(width: 2, color: colorSecondory),
        ),
        onPressed: () {
          setState(() {
            _dragDropWidget();
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


  void _dragDropWidget() {
    _contents.add(DragAndDropList(
      // header: Container(),
      footer: Text("Oct,31 2021"),
      // contentsWhenEmpty: Container(),
      children: <DragAndDropItem>[
        DragAndDropItem(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(top: 20.h , left: 20.w, right: 20.w),
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
                    //     suffixIcon: ,
                    suffix: GestureDetector(
                      // onLongPress: Dra,
                      child: Icon(Icons.menu),),
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
                      controller: TextEditingController(),
                      validator: (value) {
                    if (FormValidator.validateName(value)) {
                      return null;
                    } else {
                      return 'Please Enter the text';
                    }
                      },
                  ),
                  // IconButton(
                  //     onPressed: (){
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => SecondPage(),
                  //         ),
                  //       );
                  //     }, icon: Icon(Icons.menu)),
                  ]
                ),
              ),
            ),
          ),
        ),
      ],
    )
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
