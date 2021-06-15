import 'package:flutter/cupertino.dart';

@immutable
abstract class BlocEvent  {
  BlocEvent();

  @override
  List<Object> get props => [];
}

//--------------data event--------------

class BlocSuccessEvent extends BlocEvent {

  @override
  List<Object> get props => [];

}

