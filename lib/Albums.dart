
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc/bloc_event.dart';
import 'package:testapp/bloc/bloc_state.dart';
import 'package:testapp/bloc/main_bloc.dart';
import 'package:testapp/models/photos_model.dart';
import 'package:testapp/photos.dart';


class Albums extends StatefulWidget {

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {

  late MainBloc mainBloc;

  @override
  void initState() {
    mainBloc = context.read<MainBloc>();
    mainBloc.add(BlocSuccessEvent());
    super.initState();
  // ignore: file_names
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, BlocState>(builder: (context, state) {
      if (state is BlocLoading) {
        // ignore: sized_box_for_whitespace
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: const Center(
            child: CupertinoActivityIndicator(),
          // ignore: file_names
          ),
        );
      } else if (state is BlocFailure) {
        // ignore: sized_box_for_whitespace
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(child: Text(state.errorMessage)),
        );
      } else if (state is BlocSuccess) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              padding: const EdgeInsets.only(top: 36, left: 16, bottom: 6),
              child: Text(
                'Sadi zobaer',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[500],
                ),
              ),
            ),
          ),
          body: ListView.builder(
              itemCount: state.albumsModel.length,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {

                List<PhotosModel> tempPtotos = [];
                state.photosModel.forEach((element) {
                  if(element.albumId == state.albumsModel[index].id){
                    tempPtotos.add(element);
                  }
                });

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Photos(photos: tempPtotos, albumName: state.albumsModel[index].title,)));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_album,
                          size: 34,
                          color: Colors.blueGrey[200],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/1.4,
                          child: Text(
                            state.albumsModel[index].title,
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      }
      return Container();
    });
  }
}
