import 'package:flutter/material.dart';
import 'package:flutter_app_wh/utils/search.dart';

class HomePage extends StatefulWidget {
  final TextEditingController _textController = TextEditingController();
  HomePage({Key key, this.userId, this.onSignedOut})
      : super(key: key);

  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(
          child: Text('Weather'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      body: Center(),
    );
  }
}
