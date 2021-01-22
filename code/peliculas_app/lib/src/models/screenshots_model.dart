// To parse this JSON data, do
//
//     final screenShootsModel = screenShootsModelFromJson(jsonString);

import 'dart:convert';

ScreenShootsModel screenShootsModelFromJson(String str) => ScreenShootsModel.fromJson(json.decode(str));

String screenShootsModelToJson(ScreenShootsModel data) => json.encode(data.toJson());

class ScreenShootsModel {
    ScreenShootsModel({
        this.backdrops,
    });

    List<Backdrop> backdrops;

    factory ScreenShootsModel.fromJson(Map<String, dynamic> json) => ScreenShootsModel(
        backdrops: List<Backdrop>.from(json["backdrops"].map((x) => Backdrop.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toJson())),
    };
}

class Backdrop {
    Backdrop({
        this.aspectRatio,
        this.filePath,
        this.height,
        this.width,
    });

    double aspectRatio;
    String filePath;
    int height;
    int width;

    factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        aspectRatio: json["aspect_ratio"].toDouble(),
        filePath: json["file_path"],
        height: json["height"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "aspect_ratio": aspectRatio,
        "file_path": filePath,
        "height": height,
        "width": width,
    };
}
