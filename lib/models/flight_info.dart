// To parse this JSON data, do
//
//     final flightsModel = flightsModelFromJson(jsonString);

import 'dart:convert';

FlightsModel flightsModelFromJson(String str) =>
    FlightsModel.fromJson(json.decode(str));

String flightsModelToJson(FlightsModel data) => json.encode(data.toJson());

class FlightsModel {
  String fightAirwayName;
  String flightAirwayLogo;
  String fromStop;
  String toStop;
  String fromTime;
  String toTime;
  String totalhours;
  String stops;
  String price;

  FlightsModel({
    required this.fightAirwayName,
    required this.flightAirwayLogo,
    required this.fromStop,
    required this.toStop,
    required this.fromTime,
    required this.toTime,
    required this.totalhours,
    required this.stops,
    required this.price,
  });

  factory FlightsModel.fromJson(Map<String, dynamic> json) => FlightsModel(
        fightAirwayName: json["fightAirwayName"],
        flightAirwayLogo: json["flightAirwayLogo"],
        fromStop: json["fromStop"],
        toStop: json["toStop"],
        fromTime: json["fromTime"],
        toTime: json["toTime"],
        totalhours: json["totalhours"],
        stops: json["stops"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "fightAirwayName": fightAirwayName,
        "flightAirwayLogo": flightAirwayLogo,
        "fromStop": fromStop,
        "toStop": toStop,
        "fromTime": fromTime,
        "toTime": toTime,
        "totalhours": totalhours,
        "stops": stops,
        "price": price,
      };
}
