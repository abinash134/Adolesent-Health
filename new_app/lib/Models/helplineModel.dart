// To parse this JSON data, do
//
//     final helplinedata = helplinedataFromJson(jsonString);

import 'dart:convert';

Helplinedata helplinedataFromJson(String str) => Helplinedata.fromJson(json.decode(str));

String helplinedataToJson(Helplinedata data) => json.encode(data.toJson());

class Helplinedata {
  Helplinedata({
    this.helpline,
  });

  List<Helpline>? helpline;

  factory Helplinedata.fromJson(Map<String, dynamic> json) => Helplinedata(
    helpline: json["helpline"] == null ? null : List<Helpline>.from(json["helpline"].map((x) => Helpline.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "helpline": helpline == null ? null : List<dynamic>.from(helpline!.map((x) => x.toJson())),
  };
}

class Helpline {
  Helpline({
    this.name,
    this.location,
    this.number,
    this.website,
    this.imgurl,
    this.description,
  });

  String? name;
  List<String>? location;
  String? number;
  String? website;
  String? imgurl;
  String? description;

  factory Helpline.fromJson(Map<String, dynamic> json) => Helpline(
    name: json["Name"] == null ? null : json["Name"],
    location: json["Location"] == null ? null : List<String>.from(json["Location"].map((x) => x)),
    number: json["Number"] == null ? null : json["Number"],
    website: json["Website"] == null ? null : json["Website"],
    imgurl: json["Imgurl"] == null ? null : json["Imgurl"],
    description: json["Description"] == null ? null : json["Description"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name == null ? null : name,
    "Location": location == null ? null : List<dynamic>.from(location!.map((x) => x)),
    "Number": number == null ? null : number,
    "Website": website == null ? null : website,
    "Imgurl": imgurl == null ? null : imgurl,
    "Description": description == null ? null : description,
  };
}
