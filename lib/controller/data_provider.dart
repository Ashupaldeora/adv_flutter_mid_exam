import 'package:adv_flutter_mid_exam/api/api_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/jokes.dart';

class DataProvider extends ChangeNotifier {
  JokesModel jokesModel = JokesModel.temp();
  bool isLoading = false;
  bool isFavourite = false;
  List<String> favouriteJokes = [];

  Future<void> getDataFromApi() async {
    isLoading = true;
    Map data = await ApiServices.apiServices.fetchData();
    isLoading = false;

    print("Fetched data");
    jokesModel = JokesModel.fromJson(data);
    notifyListeners();
  }

  Future<void> saveFavourites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    favouriteJokes = prefs.getStringList('jokes') ?? [];
    if (!favouriteJokes.contains(jokesModel.jokes) &&
        jokesModel.jokes != null) {
      favouriteJokes.add(jokesModel.jokes.toString());
    }
    await prefs.setStringList('jokes', favouriteJokes);
    updateIsFavourite();
    notifyListeners();
  }

  Future<void> removeFavourite(int index) async {
    favouriteJokes.removeAt(index);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('jokes', favouriteJokes);
    notifyListeners();
  }

  void updateIsFavourite() {
    for (var e in favouriteJokes) {
      if (e == jokesModel.jokes) {
        isFavourite = true;
        notifyListeners();
      } else {
        isFavourite = false;
        notifyListeners();
      }
    }
  }

  DataProvider() {
    getDataFromApi();
    saveFavourites();
  }
}
