import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final cities = ['HCM', 'Da Nang', 'Quy Nhon', 'Can Tho'];
  final recentCities = ["HCM", "Da Nang"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {})];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : cities;
    return ListView.builder(
      itemBuilder: (context, index) =>
        ListTile(
          leading: Icon(Icons.location_city),
          title: Text(suggestionList[index]),
        ),
      itemCount: suggestionList.length,
    );
  }
}