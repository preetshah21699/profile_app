// To parse this JSON data, do
//
//     final projects = projectsFromJson(jsonString);

import 'dart:convert';

Projects projectsFromJson(String str) => Projects.fromJson(json.decode(str));

String projectsToJson(Projects data) => json.encode(data.toJson());

class Projects {
    List<Project> projects;

    Projects({
        this.projects,
    });

    factory Projects.fromJson(Map<String, dynamic> json) => Projects(
        projects: List<Project>.from(json["Projects"].map((x) => Project.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Projects": List<dynamic>.from(projects.map((x) => x.toJson())),
    };
}

class Project {
    String title;
    String description;
    String techstack;
    String link;
    List<String> images;

    Project({
        this.title,
        this.description,
        this.techstack,
        this.link,
        this.images,
    });

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        title: json["Title"],
        description: json["Description"],
        techstack: json["Techstack"],
        link: json["Link"],
        images: List<String>.from(json["Images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Description": description,
        "Techstack": techstack,
        "Link": link,
        "Images": List<dynamic>.from(images.map((x) => x)),
    };
}