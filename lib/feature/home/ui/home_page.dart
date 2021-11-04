import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_queues_app/app/theme.dart';
import 'package:task_queues_app/common/model/data_model.dart';
import 'package:task_queues_app/common/util/form_validator.dart';
import 'package:task_queues_app/common/widget/global_variables_methods.dart';
import 'package:task_queues_app/feature/home/bloc/index.dart';
import 'package:task_queues_app/common/data/data.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _taskTitleController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List<String> itemList = [];
  // List<DragAndDropList> _contents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _contents = allLists.map(buildList).toList();
    //seperate
    //     List.generate(itemList.length, (index) {
    //   return DragAndDropList(
    //     header: Text('Header $index'),
    //     children: <DragAndDropItem>[
    //       DragAndDropItem(
    //         child: Text('${itemList[index]}'),
    //       ),
    //       DragAndDropItem(
    //         child: Text('$index.2'),
    //       ),
    //       DragAndDropItem(
    //         child: Text('$index.3'),
    //       ),
    //     ],
    //   );
    // }
    // );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF3F3F3),
        child: Container(
          height: MediaQuery.of(context).size.height *0.1,
          width: MediaQuery.of(context).size.width *1,
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

                margin: EdgeInsets.only(left: 76 , right: 20),
                child: Icon(
                  Icons.insert_drive_file_outlined ,
                  color: colorSecondory,
                  size: 40,
                ),
              )

            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height *1,
        width: MediaQuery.of(context).size.width *1,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 90 , bottom: 40),
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
              ),
              Form(
                key: _formkey,
                child: TextFormField(

                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(
                    // fillColor: Provider.of<ThemeProvider>(context).getTheme()
                    //     ? darkTextFieldColor
                    //     : backgroundColor,
                    // prefixIcon: widget.icon,
                    fillColor: Colors.white,
                    filled: true,
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(
                    //     style: BorderStyle.solid,
                    //     width: 1,
                    //     color: Colors.transparent, //Color(0x7A5ADB5),
                    //   ),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
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
                    hintText: "Enter your task",
                    hintStyle: TextStyle(
                      // color: Provider.of<ThemeProvider>(context).getTheme()
                      //     ? Colors.grey
                      //     : textColor,
                      color: Color(0xFF475F7B),
                      fontSize: 14,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  obscureText: false,
                  controller: _taskTitleController,
                  validator: (value) {
                    if (FormValidator.validateName(
                        value)) {
                      return null;
                    } else {
                      return 'Please Enter the text';
                    }
                  },
                ),
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
      width: 140,
      height: 54,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(
              width: 2,
              color: colorSecondory
          ),
        ),
        onPressed: () {
          if(_formkey.currentState.validate()){
            // BlocProvider.of<HomePageBloc>(context).add(
            //     AddButtonPressed(item: _taskTitleController.text)) ;
            setState(() {
              itemList.add(_taskTitleController.text);
            });

          }
        },
        child: Icon(
          Icons.add ,
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
