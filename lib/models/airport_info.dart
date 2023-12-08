import 'dart:convert';

List<AirportsNamesModel> airportsNamesModelFromJson(String str) =>
    List<AirportsNamesModel>.from(
        json.decode(str).map((x) => AirportsNamesModel.fromJson(x)));

String airportsNamesModelToJson(List<AirportsNamesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AirportsNamesModel {
  String airportCode;
  String airportShortName;
  String airportLongName;

  AirportsNamesModel({
    required this.airportCode,
    required this.airportShortName,
    required this.airportLongName,
  });

  factory AirportsNamesModel.fromJson(Map<String, dynamic> json) =>
      AirportsNamesModel(
        airportCode: json["airportCode"],
        airportShortName: json["airportShortName"],
        airportLongName: json["airportLongName"],
      );

  Map<String, dynamic> toJson() => {
        "airportCode": airportCode,
        "airportShortName": airportShortName,
        "airportLongName": airportLongName,
      };
}
