
import 'dart:convert';

List<ImgSliderpp> imgSliderppFromJson(String str) => List<ImgSliderpp>.from(json.decode(str).map((x) => ImgSliderpp.fromJson(x)));

String imgSliderppToJson(List<ImgSliderpp> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImgSliderpp {
  String id;
  String name;
  String img;

  ImgSliderpp({
    this.id,
    this.name,
    this.img,
  });

  factory ImgSliderpp.fromJson(Map<String, dynamic> json) => ImgSliderpp(
    id: json["id"],
    name: json["name"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
  };
}
