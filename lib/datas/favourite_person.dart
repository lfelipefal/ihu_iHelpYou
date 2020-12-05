import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mktp_service/datas/profissionais.dart';


class FavoritePerson {

  String favorite_id;

  String category;
  String person_id;

  String name;
  bool isFavorite;

  ProfessionalData professionalData;

  FavoritePerson();

  FavoritePerson.fromDocument(DocumentSnapshot document){
    favorite_id = document.documentID;
    category = document.data["category"];
    person_id = document.data["person_id"];
    name = document.data["name"];
    //isFavorite = document.data["isFavorite"];
  }

  Map<String, dynamic> toMap(){
    return{
      "category": category,
      "name": name,
      "person_id": person_id,
      //"isFavorite": isFavorite,
      //"favorite": professionalData.toResumedMap()
    };
  }


}


/*
  FavoritePerson.fromDocument(DocumentSnapshot document){
    favorite_id = document.documentID;
    name = document.data["name"];
    person_id = document.data["person_id"];
    isFavorite = document.data["favorite"];
  }

  Map<String, dynamic> toMap(){
    return{
      "name": name,
      "person_id": person_id,
      "isFavorite": isFavorite
      //"favorite": professionalData.toResumedMap()
    };
  }
*/