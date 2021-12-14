import 'package:flutter/material.dart';
import 'package:shifftie/Components/entry_field.dart';
import 'package:shifftie/DashBoard/ActivityStats/Widgets/line_chart.dart';

class ActivityStatPage extends StatefulWidget {
  const ActivityStatPage({Key? key}) : super(key: key);

  @override
  _ActivityStatPageState createState() => _ActivityStatPageState();
}

class _ActivityStatPageState extends State<ActivityStatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: const [
              SizedBox(width: 150, child: Text('activity')),
              SizedBox(width: 150, child: EntryField())
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(height: 250, child: LineChartWidget()),
          ),
        ],
      ),
    );
  }
}
