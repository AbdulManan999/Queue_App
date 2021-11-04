
import 'package:equatable/equatable.dart';
import 'package:task_queues_app/common/model/data_model.dart';

class HomePageState extends Equatable {
  const HomePageState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class DataAdded extends HomePageState {
  final DataModel dataModel;

  DataAdded({ this.dataModel});

}