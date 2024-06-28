import 'package:adv_flutter_mid_exam/controller/data_provider.dart';
import 'package:adv_flutter_mid_exam/models/jokes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JokesTab extends StatelessWidget {
  const JokesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<DataProvider>(context);
    final providerFalse = Provider.of<DataProvider>(context, listen: false);
    return Container(
      // height: 600,
      width: double.infinity,

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 130, top: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade800,
      ),
      child: providerTrue.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.white,
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.yellow,
                      // height: 490,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                    "assets/svg/iconmonstr-quote-3.svg"),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                textAlign: TextAlign.center,
                                Provider.of<DataProvider>(context)
                                    .jokesModel
                                    .jokes
                                    .toString(),
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                  ),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/iconmonstr-quote-3.svg",
                                  // color: Colors.grey.shade900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            providerFalse.saveFavourites();
                          },
                          icon: Icon(
                            providerTrue.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: providerTrue.isFavourite
                                ? Colors.red
                                : Colors.white,
                          ))
                    ],
                  )
                ]),
    );
  }
}
