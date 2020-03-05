import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_data_base/store/app_state.dart';

//
class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _movie = '';

  @override
  void initState() {
    setState(() {
      _movie = '';
    });
    super.initState();
  }

  //
  String _validator(String txt) {
    if (txt.isEmpty || txt.trim() == '' || txt.length > 20) {
      return "Veuiller saisir un film";
    }
    return null;
  }

  //
  void _submit() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      _formkey.currentState.reset();
      //
      final store = Provider.of<AppState>(context, listen: false);
      store.findMovies(_movie);

      print('film: $_movie');
    } else {
      print('rien');
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
        color: Colors.grey[200],
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(2),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextFormField(
                    onFieldSubmitted: (txt) {
                      _submit();
                    },
                    onSaved: (val) => _movie = val,
                    validator: (val) => _validator(val),
                    decoration: InputDecoration(
                      //fillColor: Colors.teal[50],
                      //filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Saisir un film',
                    ),
                  ),
                ),
                //
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      _submit();
                    },
                    child: Text(
                      'Valider',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
