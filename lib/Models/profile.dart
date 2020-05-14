// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    ProfileClass profile;

    Profile({
        this.profile,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        profile: ProfileClass.fromJson(json["Profile"]),
    );

    Map<String, dynamic> toJson() => {
        "Profile": profile.toJson(),
    };
}

class ProfileClass {
    String name;
    String image;
    String contact;
    String email;
    String github;

    ProfileClass({
        this.name,
        this.image,
        this.contact,
        this.email,
        this.github,
    });

    factory ProfileClass.fromJson(Map<String, dynamic> json) => ProfileClass(
        name: json["Name"],
        image: json["Image"],
        contact: json["Contact"],
        email: json["Email"],
        github: json["Github"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Image": image,
        "Contact": contact,
        "Email": email,
        "Github": github,
    };
}
