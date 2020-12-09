import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:mktp_service/datas/favourite_person.dart';
import 'package:mktp_service/datas/profissionais.dart';
import 'package:mktp_service/models/favourite_model.dart';
import 'package:mktp_service/widgets/favorite_button.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

class PersonScreen extends StatefulWidget {
  final ProfessionalData person;
  final String from;
  final String itemFrom;

  const PersonScreen(this.person, this.from, this.itemFrom);

  @override
  _PersonScreenState createState() =>
      _PersonScreenState(person, from, itemFrom);
}

class _PersonScreenState extends State<PersonScreen> {
  final ProfessionalData person;
  final String from;
  final String itemFrom;

  _PersonScreenState(this.person, this.from, this.itemFrom);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          person.name,
        ),
        centerTitle: true,
        actions: [
          ScopedModelDescendant<FavoriteModel>(
              builder: (context, child, model) {
            FavoritePerson favoritePerson = FavoritePerson();
            favoritePerson.name = person.name;
            favoritePerson.person_id = person.id;

            model.searchPerson = favoritePerson.person_id;

            model.searchFavoritePerson.isEmpty ?
            person.isFavorite = false
            :person.isFavorite = true;

            from == "pode"
                ? favoritePerson.category = person.category
                : favoritePerson.category = itemFrom;
            /*
            from == "favorite" ?
                person.isFavorite = true
                : person.isFavorite = person.isFavorite;

             */
            return IconButton(
              icon: !person.isFavorite && from != "_"
                  ? Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 211, 118, 130),
                    ),
              onPressed: () {
                if(!person.isFavorite && from != "favorite"){
                  person.isFavorite=FavoriteModel.of(context).addFavorite(favoritePerson);
                  _isFavorited();
                }else if(person.isFavorite && from != "favorite"){
                  person.isFavorite = FavoriteModel.of(context).removeFavorite(model.searchFavoritePerson[0]);
                  _notFavorited();
                }else{
                  FavoriteModel.of(context).removeFavorite(model.searchFavoritePerson[0]);
                  Navigator.of(context).pop();
                  person.isFavorite=false;
                  _notFavorited();
                }

              },
            );
          })
        ],
      ),
      floatingActionButton: FavoriteButton(),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 0.8,
            child: Carousel(
              images: person.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  person.name,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  person.description,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapMarkerAlt,
                        color: Colors.black45,
                      ),
                      SizedBox(width: 5.0,),
                      Expanded(
                        child: Text(
                          person.location,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchAddress();
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        person.cellphone,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchWpp();
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.pinkAccent,
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        person.insta,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  onTap: () {
                    _launchInstagram();
                  },
                ),
                SizedBox(height: 15.0),

              ],
            ),
          )
        ],
      ),
    );
  }
/*
  void _launchWpp() async {
    var wppUrl = person.wpp;
    await canLaunch(wppUrl) ? launch(wppUrl) : print("doesn't have a whatsapp");
  }

 */

  void _launchWpp() async {
    String url() {
      if (Platform.isIOS) {
        return person.wpp_ios;
      } else {
        return person.wpp;
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  void _launchAddress() async {
    var mapaUrl = person.map_address;
    await canLaunch(mapaUrl)
        ? launch(mapaUrl)
        : print("open map_address profile");
  }

  void _launchInstagram() async {
    var instaUrl = person.insta_link;
    await canLaunch(instaUrl)
        ? launch(instaUrl)
        : print("doesn't have a instagram");
  }

  void _isFavorited() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Adicionado aos Favoritos!"),
          backgroundColor: Color.fromARGB(255, 211, 118, 130),
          duration: Duration(seconds: 2),
        )
    );
  }

  void _notFavorited() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Removido dos Favoritos!"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 2),
        )
    );
  }

}
