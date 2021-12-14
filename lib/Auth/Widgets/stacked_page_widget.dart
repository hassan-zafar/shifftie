import 'package:flutter/material.dart';
import 'package:shifftie/Theme/colors.dart';

// ignore: must_be_immutable
class StackedPageCounter extends StatefulWidget {
  StackedPageCounter({Key? key, this.pageNo, this.position}) : super(key: key);
  double? position;
  String? pageNo;

  @override
  State<StackedPageCounter> createState() => _StackedPageCounterState();
}

class _StackedPageCounterState extends State<StackedPageCounter> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [btnGradLeft, btnGradRight],
            ),
          ),
          child: const Text('1'),
        )
      ],
    );
  }

  Container circlularPageNo({
    required String pageNo,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [btnGradLeft, btnGradRight],
        ),
      ),
      child: Text(pageNo),
    );
  }
}
