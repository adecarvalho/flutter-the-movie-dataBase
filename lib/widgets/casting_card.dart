import 'package:flutter/material.dart';
import 'package:the_movie_data_base/store/app_state.dart';

//
class CastingCard extends StatelessWidget {
  final Map<String, dynamic> _acteur;

  CastingCard(this._acteur);

  //
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 100,
                maxWidth: 100,
              ),
              child: Image.network(
                _acteur['profile_url'] ?? AppState.FAKE_IMAGE,
                fit: BoxFit.cover,
              ),
            ),
            //
            //acteur name
            Text(
              _acteur['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //
            //acteur character
            Text("(${_acteur['character']})"),
          ],
        ),
      ),
    );
    // return Container(
    //   width: 150,
    //   //height: 150,
    //   child: Card(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: <Widget>[
    //           ConstrainedBox(
    //             constraints: BoxConstraints(
    //               maxWidth: 100,
    //               maxHeight: 100,
    //             ),
    //             child: Image.network(
    //               _acteur['profile_url'] ?? AppState.FAKE_IMAGE,
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //           //
    //           Text(
    //             _acteur['name'],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
