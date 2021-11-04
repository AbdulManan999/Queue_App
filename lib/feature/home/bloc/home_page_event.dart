import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class AddButtonPressed extends HomePageEvent {
  final String item ;

  AddButtonPressed({@required this.item});
}
