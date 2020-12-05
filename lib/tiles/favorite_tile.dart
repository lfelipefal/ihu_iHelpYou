import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mktp_service/datas/favourite_person.dart';
import 'package:mktp_service/datas/profissionais.dart';
import 'package:mktp_service/models/favourite_model.dart';
import 'package:mktp_service/screens/person_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoriteTile extends StatelessWidget {
  final FavoritePerson favoritePerson;

  FavoriteTile(this.favoritePerson);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      return Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(
              favoritePerson.professionalData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  favoritePerson.professionalData.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
                ),
                Text(
                  favoritePerson.professionalData.specialty,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                ScopedModelDescendant<FavoriteModel>(
                    builder: (context, child, model) {
                  return FlatButton(
                    child: Text("Remover"),
                    textColor: Colors.grey[500],
                    onPressed: () {
                      FavoriteModel.of(context).removeFavorite(favoritePerson);
                    },
                  );
                })
              ],
            ),
          ))
        ],
      );
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PersonScreen(favoritePerson.professionalData,
                "favorite", favoritePerson.person_id)));
      },
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: favoritePerson.professionalData == null
              ? FutureBuilder<DocumentSnapshot>(
                  future: Firestore.instance
                      .collection("careers")
                      .document(favoritePerson.category)
                      .collection("professional")
                      .document(favoritePerson.person_id)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      favoritePerson.professionalData =
                          ProfessionalData.fromDocument(snapshot.data);
                      return _buildContent();
                    } else {
                      return Container(
                        height: 70.0,
                        child: CircularProgressIndicator(),
                        alignment: Alignment.center,
                      );
                    }
                  },
                )
              : _buildContent()),
    );
  }
}

/*
return InkWell(
      onTap: () {

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PersonScreen(favoritePerson.professionalData)));
      },
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: favoritePerson.professionalData == null
              ? FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance
                .collection("careers")
                .document(favoritePerson.category)
                .collection("professional")
                .document(favoritePerson.person_id)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                favoritePerson.professionalData =
                    ProfessionalData.fromDocument(snapshot.data);
                return _buildContent();
              } else {
                return Container(
                  height: 70.0,
                  child: CircularProgressIndicator(),
                  alignment: Alignment.center,
                );
              }
            },
          )
              : _buildContent()),
    );
 */
