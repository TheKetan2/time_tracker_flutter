import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Job {
  final String name;
  final int ratePerHour;
  final String id;

  Job({
    @required this.name,
    @required this.ratePerHour,
    @required id,
  });

  factory Job.forMap(Map<String, dynamic> data, String documentID) {
    if (data == null) {
      return null;
    }
    final String name = data["name"];
    final int ratePerHour = data["ratePerHour"];

    return Job(
      name: name,
      ratePerHour: ratePerHour,
      id: documentID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "ratePerHour": ratePerHour,
    };
  }
}
