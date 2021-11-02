import 'package:engage_app/common/widget/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global_variables_methods.dart';

class AddCommentDialog extends StatefulWidget {
  @override
  _AddCommentDialogState createState() => _AddCommentDialogState();
}

class _AddCommentDialogState extends State<AddCommentDialog> {
  String dropdownValue = "Select Action";
  var detailController = TextEditingController();

  List savedActions = <String>['Select Action', 'Test Saved Reply']
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
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
                top: 10,
                bottom: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Ticket Comments",
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: textColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
                top: 5,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SAVED ACTIONS",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          dropdownColor: backgroundColor,
                          isExpanded: true,
                          value: dropdownValue,
                          items: savedActions,
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    "DETAIL",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: Color(0xFF6695EF),
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
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
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                    controller: detailController,
                    validator: (value) {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5A8DEE),
                    ),
                    onPressed: () async {
                      if (detailController.text != "" ||
                          detailController.text != null) {
                        commentList.add(
                          MessageBubble(
                            isMe: true,
                            message: detailController.text,
                          ),
                        );
                        comments.add(commentList);
                      }
                      Navigator.pop(
                        context,
                        detailController.text,
                      );
                    },
                    child: Text("Post"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
