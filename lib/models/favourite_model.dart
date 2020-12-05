import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mktp_service/datas/favourite_person.dart';
import 'package:mktp_service/models/user_models.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoriteModel extends Model{

  UserModel user;

  List<FavoritePerson> favorite = [];

  bool isLoading = false;

  FavoriteModel(this.user){
    if(user.isLoggedIn())
      _loadFavorite();
  }

  String _searchPerson = '';

  String get searchPerson => _searchPerson;

  set searchPerson(String value){
    _searchPerson = value;
    notifyListeners();
  }

  static FavoriteModel of(BuildContext context) =>
      ScopedModel.of<FavoriteModel>(context);

  bool addFavorite(FavoritePerson favoritePerson){
      favorite.add(favoritePerson);

      Firestore.instance.collection("users").document(user.firebaseUser.uid)
          .collection("favorite").add(favoritePerson.toMap()).then((doc) {
        favoritePerson.favorite_id = doc.documentID;
      });
      //favoritePerson.isFavorite = true;
      notifyListeners();
      return true;
  }

  bool removeFavorite(FavoritePerson favoritePerson){
    favoritePerson.isFavorite = false;
    favorite.remove(favoritePerson);

    Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("favorite").document(favoritePerson.favorite_id).delete();

    notifyListeners();
    return false;
  }

  void _loadFavorite()async{

    QuerySnapshot query = await Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("favorite").getDocuments();

    favorite = query.documents.map((doc) => FavoritePerson.fromDocument(doc)).toList();

    notifyListeners();

  }

  List<FavoritePerson> get searchFavoritePerson{
    final List<FavoritePerson> searchFavoritePerson = [];

      searchFavoritePerson.addAll(favorite.where((p)
      => p.person_id.contains(searchPerson)
      ));

    return searchFavoritePerson;
  }

}