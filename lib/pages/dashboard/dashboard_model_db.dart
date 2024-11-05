// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  String uid;
  int networth;
  int income;
  int expsense;

  DashboardModel({
    required this.uid,
    required this.networth,
    required this.income,
    required this.expsense,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        uid: json["uid"],
        networth: json["networth"],
        income: json["income"],
        expsense: json["expsense"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "networth": networth,
        "income": income,
        "expsense": expsense,
      };
}
