import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mktp_service/models/professional_model.dart';
import 'package:mktp_service/models/section_item.dart';
import 'package:mktp_service/screens/person_screen.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final SectionItem item;

  const ItemTile(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        child: Card(
            elevation: 10,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          item.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),

                            Text(
                              item.career,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        onTap: () {
          final person = context
              .read<ProfessionalModel>()
              .findPersonById(item.person, item.category);
          print('Pessoa: ${person}');
          if (person != null) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersonScreen(person, "home", item.category)));
          }
        },
      ),
    );
  }
}

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mktp_service/models/professional_model.dart';
import 'package:mktp_service/models/section_item.dart';
import 'package:mktp_service/screens/person_screen.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final SectionItem item;

  const ItemTile(this.item);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        child: Card(
            elevation: 10,
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          item.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      item.career,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            )),
        onTap: () {
          final person = context
              .read<ProfessionalModel>()
              .findPersonById(item.person, item.category);
          print('Pessoa: ${person}');
          if (person != null) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersonScreen(person, "home", item.category)));
          }
        },
      ),
    );
  }
}


 */