import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/foundation.dart";
import 'package:time_tracker_flutter/app/home/models/job.dart';
import 'package:time_tracker_flutter/services/api_path.dart';

abstract class Database {
  Future<void> createJob(Job job);
}

class FirestoreDatabase implements Database {
  final String uid;

  FirestoreDatabase({@required this.uid})
      : assert(
          uid != null,
        );

  Future<void> createJob(Job job) async => await _setData(
        path: APIPath.job(
          uid,
          "job_abc",
        ),
        data: job.toMap(),
      );

  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final ref = Firestore.instance.document(path);
    print("$path: $data");
    await ref.setData(data);
  }
}
