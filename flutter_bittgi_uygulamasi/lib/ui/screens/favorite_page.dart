import 'package:flutter/material.dart';
import 'package:flutter_bittgi_uygulamasi/constants.dart';
import 'package:flutter_bittgi_uygulamasi/models/plants.dart';
import 'package:flutter_bittgi_uygulamasi/ui/screens/widgets/plant_widgets.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlant;
  FavoritePage({Key? key, required this.favoritedPlant}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.favoritedPlant.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Favorited Plants',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                itemCount: widget.favoritedPlant.length,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PlantWidget(
                      index: index, plantList: widget.favoritedPlant);
                },
              ),
            ),
    );
  }
}
