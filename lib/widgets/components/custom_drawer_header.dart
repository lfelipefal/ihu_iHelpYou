import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mktp_service/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mktp_service/models/user_models.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              if(!model.isLoggedIn())
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>LoginScreen())
                );
              else
                model.signOut();
            },
            child: Container(
              color: Color.fromARGB(255, 211, 118, 130),
              height: 95,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 35,),
                  const SizedBox(width: 20,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(!model.isLoggedIn() ?
                          'Acesse sua conta agora!' :
                          model.userData["name"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(!model.isLoggedIn() ?
                            'Clique aqui' :
                            'Sair',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
