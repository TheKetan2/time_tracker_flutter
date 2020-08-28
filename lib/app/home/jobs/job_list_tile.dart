import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/home/models/job.dart';

class JobListTile extends StatelessWidget {
  final Job job;
  final VoidCallback onTap;

  const JobListTile({
    Key key,
    @required this.job,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(job.name),
      onTap: onTap,
      trailing: Icon(
        Icons.chevron_right,
      ),
      leading: Icon(Icons.open_in_new),
    );
  }
}
