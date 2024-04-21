// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

List<Article> articleFromJson(String str) => List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
    Thumbnail thumbnail;
    String id;
    String heading;
    String content;
    String hyperlink;
    int v;

    Article({
        required this.thumbnail,
        required this.id,
        required this.heading,
        required this.content,
        required this.hyperlink,
        required this.v,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        id: json["_id"],
        heading: json["heading"],
        content: json["content"],
        hyperlink: json["hyperlink"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "_id": id,
        "heading": heading,
        "content": content,
        "hyperlink": hyperlink,
        "__v": v,
    };
}

class Thumbnail {
    Data data;
    String contentType;

    Thumbnail({
        required this.data,
        required this.contentType,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        data: Data.fromJson(json["data"]),
        contentType: json["contentType"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "contentType": contentType,
    };
}

class Data {
    String type;
    List<int> data;

    Data({
        required this.type,
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        data: List<int>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
