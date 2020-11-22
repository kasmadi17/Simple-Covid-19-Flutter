import 'dart:convert';

CaseModel accountModelFromJson(String str) =>
    CaseModel.fromJson(json.decode(str));

String accountModelToJson(CaseModel data) => json.encode(data.toJson());

class CaseModel {
  String name;
  String positif;
  String sembuh;
  String meninggal;
  String dirawat;

  CaseModel(
      {this.name, this.positif, this.sembuh, this.meninggal, this.dirawat});

  factory CaseModel.fromJson(Map<String, dynamic> json) => CaseModel(
        name: json['name'],
        positif: json['positif'],
        sembuh: json['sembuh'],
        meninggal: json['meninggal'],
        dirawat: json['dirawat'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "positif": positif,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "dirawat": dirawat
      };
}
