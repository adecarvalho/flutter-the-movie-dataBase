import 'package:flutter/material.dart';
import 'package:the_movie_data_base/widgets/casting_card.dart';

//
class CastingList extends StatelessWidget {
  final List _casting;

  CastingList(this._casting);

  //
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _casting.length,
        itemBuilder: (context, index) {
          final item = _casting[index];
          return CastingCard(item);
        });
  }
}
