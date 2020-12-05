import 'package:cloud_firestore/cloud_firestore.dart';

class ProfessionalData{

  String category;
  String id;
  String name;
  String description;
  String location;
  String cellphone;
  String specialty;
  String wpp;
  String insta;
  String insta_link;
  String map_address;
  String career;

  bool isFavorite;

  List<String> images;

  ProfessionalData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    name = snapshot.data["name"];
    description = snapshot.data["description"];
    location = snapshot.data["location"];
    cellphone = snapshot.data["cellphone"];
    images = List<String>.from(snapshot.data["images"] as List<dynamic>);
    specialty = snapshot.data["specialty"];
    wpp = snapshot.data["wpp"];
    insta = snapshot.data["insta"];
    insta_link = snapshot.data["insta_link"];
    map_address = snapshot.data["map_address"];
    isFavorite = snapshot.data["favorite"];
    career = snapshot.data["career"];
  }

  Map<String, dynamic> toResumedMap(){
    return{
      "name":name,
      "images": images,
      "specialty": specialty,
      "favorite": isFavorite
    };
  }

}

/*
Map<String, dynamic> toResumedMap(){
    return{
      "name":name,
      "images": images,
      "specialty": specialty,
      "career": career,
      "favorite": isFavorite
    };
  }
 */
