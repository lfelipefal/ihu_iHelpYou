import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mktp_service/models/professional_model.dart';
import 'package:mktp_service/screens/professionals_screen.dart';
import 'package:provider/provider.dart';

class CareerTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CareerTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfessionalModel>(
      builder: (_, professionalModel, __) {
        return
        ListTile(
          leading: CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.transparent,
            //backgroundImage: NetworkImage(snapshot.data["icon"]),
          ),
          title: Text(snapshot.data["title"]),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            professionalModel.search = '';
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ProfessionalScreen(snapshot))
            );
          },
        );
      }
    );
  }
}
