import 'package:flutter/cupertino.dart';
import 'package:testapp/models/albums_model.dart';
import 'package:testapp/models/photos_model.dart';

@immutable
abstract class BlocState {
  const BlocState();

  @override
  List<Object> get props => [];
}

class BlocInitial extends BlocState {}

class BlocLoading extends BlocState {
  @override
  List<Object> get props => [];
}

//------------------sucess state-----------------

class BlocSuccess extends BlocState {
  List<AlbumsModel> albumsModel;
  List<PhotosModel> photosModel;

  BlocSuccess({required this.albumsModel, required this.photosModel});
  @override
  List<Object> get props => [albumsModel, photosModel];
}

//------------------failure state-----------------

class BlocFailure extends BlocState {
  final String errorMessage;
  const BlocFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
