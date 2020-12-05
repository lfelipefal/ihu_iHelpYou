import 'package:flutter/material.dart';
import 'package:mktp_service/tiles/drawer_tile.dart';
import 'custom_drawer_header.dart';

class NewCustomDrawer extends StatelessWidget {

  final PageController pageController;

  NewCustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
      child: SizedBox(
          width: MediaQuery.of(context).size.width *0.6,
          child:
          Drawer(
            child: ListView(
              children: [
                CustomDrawerHeader(),
                DrawerTile(Icons.home, "Destaques", pageController,0),
                DrawerTile(Icons.list, "Carreiras", pageController,1),
                DrawerTile(Icons.favorite, "Favoritos", pageController,2),
                DrawerTile(Icons.person, "Perfil", pageController,3),
              ],
            ),
          )
      ),
    );
  }
}
