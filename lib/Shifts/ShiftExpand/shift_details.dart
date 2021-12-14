import 'package:flutter/material.dart';

class ShiftDetailsPage extends StatefulWidget {
  const ShiftDetailsPage({Key? key}) : super(key: key);

  @override
  _ShiftDetailsPageState createState() => _ShiftDetailsPageState();
}

class _ShiftDetailsPageState extends State<ShiftDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Bla bla bal',
          style: Theme.of(context).textTheme.headline2,
        )
      ],
    );
  }
}
