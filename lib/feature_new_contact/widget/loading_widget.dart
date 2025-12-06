import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPouringHourGlass(
        duration: Duration(seconds: 1),
        color: Colors.deepPurple,
      ),
    );
  }
}
