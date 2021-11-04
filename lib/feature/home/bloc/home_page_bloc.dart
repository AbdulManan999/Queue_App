import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:task_queues_app/common/model/data_model.dart';
import 'index.dart';


class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial());

  List<String> itemList = [];

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if( event is AddButtonPressed){
      yield* _mapAddButtonPressedToState(event);
    }
  }

 Stream<HomePageState> _mapAddButtonPressedToState(AddButtonPressed event) async* {


    itemList.add(event.item);
    DataModel.withFields(itemList);
    yield DataAdded();
    log("bloc check $itemList");
 }
}
