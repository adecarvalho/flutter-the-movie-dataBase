import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//
class SpinLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.teal,
          size: 100,
        ),
      ),
    );
  }
}
