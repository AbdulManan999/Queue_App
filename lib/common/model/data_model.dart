import 'package:meta/meta.dart';

class DataModel {
  List<String> itemList = [];

  // String item;




  DataModel.withFields(
      this.itemList
      );

  // static DataModel dataModelWithData (String data){
  //
  //   list
  //
  //
  //   return DataModel.withFields(itemList);
  // }
}
class DraggableList {
  final String header;
  final List<DraggableListItem> items;

  const DraggableList({
    @required this.header,
    @required this.items,
  });
}

class DraggableListItem {
  final String title;
  final String urlImage;

  const DraggableListItem({
    @required this.title,
    @required this.urlImage,
  });
}

