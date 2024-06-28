import 'package:adv_flutter_mid_exam/controller/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<DataProvider>(context).favouriteJokes!.isEmpty
        ? Center(
            child: Text(
              "No Favourites Added",
              style: TextStyle(color: Colors.white),
            ),
          )
        : ListView.builder(
            itemCount: Provider.of<DataProvider>(context).favouriteJokes.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(
                  left: 10, right: 10, top: index == 0 ? 15 : 0, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  Provider.of<DataProvider>(context).favouriteJokes[index],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Provider.of<DataProvider>(context, listen: false)
                        .removeFavourite(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
  }
}
