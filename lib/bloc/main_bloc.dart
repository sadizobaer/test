import 'package:flutter/material.dart';
import 'package:testapp/api_manager/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc/bloc_event.dart';
import 'package:testapp/bloc/bloc_state.dart';
import 'package:testapp/models/albums_model.dart';
import 'package:testapp/models/photos_model.dart';

class MainBloc extends Bloc<BlocEvent, BlocState> with ChangeNotifier {
  //--------------local variables---------------

  ApiRepository repository;

  MainBloc({required this.repository}) : super(BlocInitial());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    final currentState = state;

    //------------------SuccessEvent is called----------------------

    if (event is BlocSuccessEvent) {
      if (currentState is BlocInitial) {
        yield BlocLoading();
        repository = ApiRepository();

        //-----------api is called-------------

        final albumResponse = await repository.getAlbums();
        final photosResponse = await repository.getPhotos();

        if (albumResponse.statusCode == 200 ||
            photosResponse.statusCode == 200) {
          List<AlbumsModel> albumsModel = albumsModelFromJson(albumResponse.body);
          List<PhotosModel> photosModel = photosModelFromJson(photosResponse.body);

          yield BlocSuccess(albumsModel: albumsModel, photosModel: photosModel);
        } else {
          yield const BlocFailure(errorMessage: 'Failed to fetch data');
        }
      }
    }
  }
}
