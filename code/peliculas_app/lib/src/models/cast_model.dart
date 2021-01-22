// To parse this JSON data, do
//
//     final castModel = castModelFromJson(jsonString);

import 'dart:convert';

CastModel castModelFromJson(String str) => CastModel.fromJson(json.decode(str));

String castModelToJson(CastModel data) => json.encode(data.toJson());

class CastModel {
    CastModel({
        this.cast,
    });

    List<Cast> cast;

    factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    };
}

class Cast {
    Cast({
        this.name,
        this.originalName,
        this.profilePath,
    });

    String name;
    String originalName;
    String profilePath;

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        name: json["name"],
        originalName: json["original_name"],
        profilePath: json["profile_path"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "original_name": originalName,
        "profile_path": profilePath,
    };
}
