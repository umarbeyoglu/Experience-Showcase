import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'Page1.dart';
import 'package:http/http.dart' as http;
import 'SendSMS.dart';

SendSMSTOBusinessWhenDistanceLimitExceeded(String business_phone_number,int distance_limit,double latitude,double longitude) async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  DistanceMatrix distanceMatrix;
  final jsonData = await http.get(Uri.parse("https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${position.latitude},${position.longitude}&origins=$latitude,$longitude"
      "&key=KEYHERE"), headers: <String, String>{'Content-Type': 'application/json; charset=utf-8'},);
  distanceMatrix = new DistanceMatrix.fromJson(json.decode(jsonData.body));
  double distance = double.parse(distanceMatrix.elements.first.distance.text.split(" ").first);
  if(distance > distance_limit){LimitExceededSMS(business_phone_number, 'Distance Limit is exceeded by User by $distance! Contact them to learn more!');}
  return false;
} //EVERY 10 SECONDS

Future<bool> SendSMSTOBusinessWhenSpeedLimitExceeded(String business_phone_number,int speed_limit) async {
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  if(position.speed > speed_limit){LimitExceededSMS(business_phone_number, 'Distance Limit is exceeded by User! Their speed is now ${position.speed} ! Contact them to learn more!');}
  return false;
} //EVERY 10 SECONDS


class DistanceMatrix {
  final List<String> destinations;
  final List<String> origins;
  final List<Element> elements;
  final String status;

  DistanceMatrix({required this.destinations, required this.origins, required this.elements, required this.status});

  factory DistanceMatrix.fromJson(Map<String, dynamic> json) {
    var destinationsJson = json['destination_addresses'];
    var originsJson = json['origin_addresses'];
    var rowsJson = json['rows'][0]['elements'] as List;

    return DistanceMatrix(
        destinations: destinationsJson.cast<String>(),
        origins: originsJson.cast<String>(),
        elements: rowsJson.map((i) => new Element.fromJson(i)).toList(),
        status: json['status']);
  }

}

class Element {
  final Distance distance;
  final DurationMap duration;
  final String status;

  Element({required this.distance, required this.duration, required this.status});

  factory Element.fromJson(Map<String, dynamic> json) {
    return Element(
        distance: Distance.fromJson(json['distance']),
        duration: DurationMap.fromJson(json['duration']),
        status: json['status']);
  }
}

class Distance {
  final String text;
  final int value;

  Distance({required this.text, required this.value});

  factory Distance.fromJson(Map<String, dynamic> json) {
    return Distance(text: json['text'], value: json['value']);
  }
}

class DurationMap {
  final String text;
  final int value;

  DurationMap({required this.text, required this.value});

  factory DurationMap.fromJson(Map<String, dynamic> json) {
    return DurationMap(text: json['text'], value: json['value']);
  }
}
