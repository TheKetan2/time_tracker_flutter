import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/foundation.dart";

abstract class Database {
  Future<void> createJob(Map<String, dynamic> jobData);
}

class FirestoreDatabase implements Database {
  final String uid;

  FirestoreDatabase({@required this.uid})
      : assert(
          uid != null,
        );

  Future<void> createJob(Map<String, dynamic> jobData) async {
    final path = "/users/$uid/jobs/jobs_abc";

    final docRef = Firestore.instance.document(path);
    await docRef.setData(jobData);
  }
}
