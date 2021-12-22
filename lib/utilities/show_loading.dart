import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: always_specify_types
Future showLoadingDislog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widget = (Platform.isAndroid)
        ? const CircularProgressIndicator(
            backgroundColor: Colors.black,
          )
        : const CupertinoActivityIndicator();
    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}
