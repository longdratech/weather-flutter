import 'package:flutter/material.dart';
import 'package:flutter_app_wh/blocs/blocs.dart';
import 'package:flutter_app_wh/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> implements SearchDelegate<String>{
  final cities = ['HCM', 'Da Nang', 'Quy Nhon', 'Can Tho'];
  final recentCities = ["HCM", "Da Nang"];

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  String query;

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return null;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () async {
            final city = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CitySelection()
              ),
            );
            if(city!=null){
              BlocProvider.of<WeatherBloc>(context)
                  .add(FetchWeather(city: city));
            }
          })
    ];
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
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCities : cities;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  void close(BuildContext context, String result) {
    // TODO: implement close
  }

  @override
  // TODO: implement keyboardType
  TextInputType get keyboardType => null;

  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => null;

  @override
  void showResults(BuildContext context) {
    // TODO: implement showResults
  }

  @override
  void showSuggestions(BuildContext context) {
    // TODO: implement showSuggestions
  }

  @override
  // TODO: implement textInputAction
  TextInputAction get textInputAction => null;

  @override
  // TODO: implement transitionAnimation
  Animation<double> get transitionAnimation => null;
}
