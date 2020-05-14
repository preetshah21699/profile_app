// To parse this JSON data, do
//
//     final education = educationFromJson(jsonString);

import 'dart:convert';

Education educationFromJson(String str) => Education.fromJson(json.decode(str));

String educationToJson(Education data) => json.encode(data.toJson());

class Education {
    List<EducationElement> education;

    Education({
        this.education,
    });

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        education: List<EducationElement>.from(json["Education"].map((x) => EducationElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Education": List<dynamic>.from(education.map((x) => x.toJson())),
    };
}

class EducationElement {
    String educationClass;
    String institution;
    String score;

    EducationElement({
        this.educationClass,
        this.institution,
        this.score,
    });

    factory EducationElement.fromJson(Map<String, dynamic> json) => EducationElement(
        educationClass: json["Class"],
        institution: json["Institution"],
        score: json["Score"],
    );

    Map<String, dynamic> toJson() => {
        "Class": educationClass,
        "Institution": institution,
        "Score": score,
    };
}