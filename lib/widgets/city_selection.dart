import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_wh/models/players.dart';
import 'package:rxdart/rxdart.dart';

typedef void OnTapCallback(String value);

class CitySelection extends StatefulWidget {
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController textController = TextEditingController();
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<Players>> key = new GlobalKey();

  void _loadData() async {
    await PlayersViewModel.loadPlayers();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
      ),
      body: Form(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  searchTextField = AutoCompleteTextField<Players>(
                    style: new TextStyle(color: Colors.black, fontSize: 16.0),
                    decoration: new InputDecoration(
                        suffixIcon: Container(
                          width: 85.0,
                          height: 60.0,
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                        filled: true,
                        hintText: 'Nhập tên thành phố',
                        hintStyle: TextStyle(color: Colors.black)),
                    itemSubmitted: (item) {
                      setState(() => searchTextField.textField.controller.text =
                          item.autocompleteterm);
                    },
                    clearOnSubmit: false,
                    key: key,
                    suggestions: PlayersViewModel.players,
                    itemBuilder: (context, item) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            item.autocompleteterm,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                          ),
                          Text(
                            item.country,
                          ),
                        ],
                      );
                    },

                    itemSorter: (a, b) {
                      return a.autocompleteterm.compareTo(b.autocompleteterm);
                    },
                    itemFilter: (item, query) {
                      return item.autocompleteterm
                          .toLowerCase()
                          .startsWith(query.toLowerCase());
                    },
                    controller: textController,
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      Navigator.pop(context, textController.text);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
