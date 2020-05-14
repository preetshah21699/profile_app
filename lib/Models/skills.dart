// To parse this JSON data, do
//
//     final skills = skillsFromJson(jsonString);

import 'dart:convert';

Skills skillsFromJson(String str) => Skills.fromJson(json.decode(str));

String skillsToJson(Skills data) => json.encode(data.toJson());

class Skills {
    SkillsClass skills;

    Skills({
        this.skills,
    });

    factory Skills.fromJson(Map<String, dynamic> json) => Skills(
        skills: SkillsClass.fromJson(json["Skills"]),
    );

    Map<String, dynamic> toJson() => {
        "Skills": skills.toJson(),
    };
}

class SkillsClass {
    List<String> soft;
    List<Technical> technical;

    SkillsClass({
        this.soft,
        this.technical,
    });

    factory SkillsClass.fromJson(Map<String, dynamic> json) => SkillsClass(
        soft: List<String>.from(json["Soft"].map((x) => x)),
        technical: List<Technical>.from(json["Technical"].map((x) => Technical.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Soft": List<dynamic>.from(soft.map((x) => x)),
        "Technical": List<dynamic>.from(technical.map((x) => x.toJson())),
    };
}

class Technical {
    String name;
    String type;
    String image;
    Rating rating;

    Technical({
        this.name,
        this.type,
        this.image,
        this.rating,
    });

    factory Technical.fromJson(Map<String, dynamic> json) => Technical(
        name: json["Name"],
        type: json["Type"],
        image: json["Image"],
        rating: ratingValues.map[json["Rating"]],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Type": type,
        "Image": image,
        "Rating": ratingValues.reverse[rating],
    };
}

enum Rating { THE_45, THE_35, THE_25 }

final ratingValues = EnumValues({
    "2/5": Rating.THE_25,
    "3/5": Rating.THE_35,
    "4/5": Rating.THE_45
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
