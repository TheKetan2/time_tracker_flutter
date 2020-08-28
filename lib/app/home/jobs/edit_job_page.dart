import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter/app/home/models/job.dart';
import 'package:time_tracker_flutter/common_widgets/platform_alert_dialog.dart';
import 'package:time_tracker_flutter/common_widgets/platform_exception_alert_dialog.dart';
import 'package:time_tracker_flutter/services/database.dart';

class EditJobPage extends StatefulWidget {
  final Database database;
  final Job job;

  const EditJobPage({
    Key key,
    this.job = null,
    @required this.database,
  }) : super(key: key);

  static Future<void> show(BuildContext context, {Job job}) async {
    final database = Provider.of<Database>(context);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditJobPage(
          database: database,
          job: job,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<EditJobPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _ratePerHour = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(
          widget.job != null ? "Edit Job" : "New Job",
        ),
        actions: [
          FlatButton(
            child: Text(
              "Save",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPressed: _submit,
          ),
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        validator: (value) => value.isNotEmpty ? null : "Name can't be empty",
        decoration: InputDecoration(labelText: "Job Name"),
        initialValue: widget.job == null ? "" : widget.job.name,
        onSaved: (value) => _name = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: "Per Hour Rate"),
        validator: (value) => value.isNotEmpty ? null : "Rate can't be empty",
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        initialValue:
            widget.job == null ? "" : widget.job.ratePerHour.toString(),
        onSaved: (value) => _ratePerHour = int.tryParse(value) ?? 0,
      ),
    ];
  }

  Future<void> _submit() async {
    if (_validateSaveForm()) {
      try {
        final jobs = await widget.database.jobsStream().first;
        final allNames = jobs
            .map(
              (job) => job.name,
            )
            .toList();

        if (widget.job != null) {
          allNames.remove(widget.job.name);
        }

        if (allNames.contains(_name)) {
          PlatformAlertDialog(
            title: "Name already exists",
            content: "Please choose a different job name",
            defaultActionText: "OK",
          ).show(context);
        } else {
          final id = widget.job?.id ?? documentIdFromCurrentDate();
          final job = Job(
            name: _name,
            ratePerHour: _ratePerHour,
            id: id,
          );
          await widget.database.setJob(
            job,
          );
        }
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: "Operation Failde",
          exception: e,
        ).show(
          context,
        );
      }
    }
  }

  bool _validateSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
