// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

List<Article> articleFromJson(String str) => List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
    String id;
    String heading;
    String content;
    String hyperlink;
    int v;

    Article({
        required this.id,
        required this.heading,
        required this.content,
        required this.hyperlink,
        required this.v,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        heading: json["heading"],
        content: json["content"],
        hyperlink: json["hyperlink"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "heading": heading,
        "content": content,
        "hyperlink": hyperlink,
        "__v": v,
    };
}
