import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mktp_service/datas/profissionais.dart';
import 'package:mktp_service/screens/person_screen.dart';

class ProfessionalTile extends StatelessWidget {
  final String type;
  final ProfessionalData professional;

  ProfessionalTile(this.type, this.professional);

  @override
  Widget build(BuildContext context) {
       return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersonScreen(professional, "pode","_")));
          },
          child: Card(
              child: type == "grid"
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 0.85,
                    child: Image.network(
                      professional.images[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              professional.name,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              professional.specialty,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                      )
                  )
                ],
              )
                  : Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.network(
                      professional.images[0],
                      fit: BoxFit.fill,
                      height: 250,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              professional.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  ),
                            ),
                            Divider(),
                            Text(
                              professional.description,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0,
                              ),
                              maxLines: 5,
                            ),
                            Divider(),
                            Text(
                              professional.location,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  ),
                            ),
                            Divider(),
                            Text(
                              professional.cellphone,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor),
                            )
                          ],
                        ),
                    ),
                  )
                ],
              )
          ),
        );
  }

}

/*
Card(
              child: type == "grid"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 0.8,
                          child: Image.network(
                            professional.images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                professional.name,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                professional.specialty,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor),
                              )
                            ],
                          ),
                        ))
                      ],
                    )
                  : Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Image.network(
                            professional.images[0],
                            fit: BoxFit.cover,
                            height: 250,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  professional.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                      height: 3),
                                ),
                                Text(
                                  professional.description,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text(
                                  professional.location,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300, height: 2.0),
                                ),
                                Text(
                                  professional.cellphone,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      height: 2.0,
                                      color: Theme.of(context).primaryColor),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ))
 */
