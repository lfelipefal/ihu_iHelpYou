import 'package:flutter/material.dart';
import 'package:mktp_service/screens/favorite_screen.dart';

class FavoriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          child: Icon(Icons.favorite_border, color: Colors.white,
            size: 23.0,),
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>FavoriteScreen("button"))
            );
          },

          backgroundColor: Color.fromARGB(255, 211, 118, 130)
      //Theme.of(context).primaryColor// ,
      );

  }
}
