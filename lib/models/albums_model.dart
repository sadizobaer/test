// To parse this JSON data, do
//
//     final albumsModel = albumsModelFromJson(jsonString);

import 'dart:convert';

List<AlbumsModel> albumsModelFromJson(String str) => List<AlbumsModel>.from(
    json.decode(str).map((x) => AlbumsModel.fromJson(x)));

String albumsModelToJson(List<AlbumsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumsModel {
  AlbumsModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  int userId;
  int id;
  String title;

  factory AlbumsModel.fromJson(Map<String, dynamic> json) => AlbumsModel(
        userId: json["userId"] == null ? null : json["userId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
