import 'package:flutter/material.dart';
import 'package:time_tracker_flutter/app/home/jobs/empty_contents.dart';

typedef ItemWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T item,
);

class ListItemBuilder<T> extends StatelessWidget {
  final AsyncSnapshot<List<T>> snapshot;
  final ItemWidgetBuilder<T> itemBuilder;

  const ListItemBuilder({
    Key key,
    this.snapshot,
    this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.hasData) {
      final List<T> items = snapshot.data;
      if (items.isNotEmpty) {
        return _buildList(items);
      } else {
        return EmptyContent();
      }
    } else if (snapshot.hasError) {
      return EmptyContent(
        title: "Something went wrong",
        message: "Can\'t load items right now ",
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildList(List<T> items) {}
}
