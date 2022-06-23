import 'dart:convert';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
  int status;
  Data data;
  Story({
    required this.status,
    required this.data,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String description;
  Data({
    required this.description,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}
