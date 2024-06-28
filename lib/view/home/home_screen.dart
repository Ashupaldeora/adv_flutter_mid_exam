import 'package:adv_flutter_mid_exam/controller/data_provider.dart';
import 'package:adv_flutter_mid_exam/view/home/components/favourite_tab.dart';
import 'package:adv_flutter_mid_exam/view/home/components/jokes_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<DataProvider>(context);
    final providerFalse = Provider.of<DataProvider>(context, listen: false);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          title: Text(
            "Jokes App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: Colors.deepOrange,
                tabs: [
                  Text(
                    "Joke",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Favourite Joke",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ),
        body: TabBarView(children: [
          JokesTab(),
          FavouriteTab(),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          backgroundColor: Colors.grey.shade800,
          onPressed: () {
            providerFalse.getDataFromApi();
            providerFalse.updateIsFavourite();
          },
        ),
      ),
    );
  }
}
