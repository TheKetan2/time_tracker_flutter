import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/foundation.dart";
import 'package:time_tracker_flutter/app/home/models/job.dart';

abstract class Database {
  Future<void> createJob(Job job);
}

class FirestoreDatabase implements Database {
  final String uid;

  FirestoreDatabase({@required this.uid})
      : assert(
          uid != null,
        );

  Future<void> createJob(Job job) async {
    final path = "/users/$uid/jobs/jobs_abc";

    final docRef = Firestore.instance.document(path);
    await docRef.setData(job.toMap());
  }
}
