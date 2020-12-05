import 'package:flutter/material.dart';
import 'package:mktp_service/models/favourite_model.dart';
import 'package:mktp_service/models/user_models.dart';
import 'package:mktp_service/screens/login_screen.dart';
import 'package:mktp_service/tiles/favorite_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoriteScreen extends StatelessWidget {

  final String from;

  const FavoriteScreen(this.from);

  @override
  Widget build(BuildContext context) {
    if(this.from == "button" ) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favoritos"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<FavoriteModel>(
          builder: (context, child, model) {
            if (model.isLoading && UserModel.of(context).isLoggedIn()) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (!UserModel.of(context).isLoggedIn()) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border_outlined,
                      size: 80.0, color: Theme
                          .of(context)
                          .primaryColor,),
                    SizedBox(height: 16.0,),
                    Text("Faça Login para adicionar Favoritos",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),
                    SizedBox(height: 16.0,),
                    RaisedButton(
                      child: Text("Entrar", style: TextStyle(fontSize: 18.0),),
                      textColor: Colors.white,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>
                                LoginScreen())
                        );
                      },
                    )
                  ],
                ),
              );
            } else if (model.favorite == null || model.favorite.length == 0) {
              return Center(
                child: Text(
                  "Nenhum favorito adicionado!",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return ListView(
                children: [
                  Column(
                    children: model.favorite.map((favorite) {
                      return FavoriteTile(favorite);
                    }).toList(),
                  )
                ],
              );
            }
          },
        ),
      );
    } else {
     return ScopedModelDescendant<FavoriteModel>(
        builder: (context, child, model) {
          if (model.isLoading && UserModel.of(context).isLoggedIn()) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!UserModel.of(context).isLoggedIn()) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border,
                    size: 80.0, color: Theme
                        .of(context)
                        .primaryColor,),
                  SizedBox(height: 16.0,),
                  Text("Faça Login para adicionar Favoritos",
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 16.0,),
                  RaisedButton(
                    child: Text("Entrar", style: TextStyle(fontSize: 18.0),),
                    textColor: Colors.white,
                    color: Theme
                        .of(context)
                        .primaryColor,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginScreen())
                      );
                    },
                  )
                ],
              ),
            );
          } else if (model.favorite == null || model.favorite.length == 0) {
            return Center(
              child: Text(
                "Nenhum favorito adicionado!",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView(
              children: [
                Column(
                  children: model.favorite.map((favorite) {
                    return FavoriteTile(favorite);
                  }).toList(),
                )
              ],
            );
          }
        },
      );
    }
  }
}
