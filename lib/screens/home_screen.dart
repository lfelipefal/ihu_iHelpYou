/*
import 'package:flutter/material.dart';
import 'package:mktp_service/widgets/components/new_custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        drawer: NewCustomDrawer(),
        appBar: AppBar(),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:mktp_service/screens/favorite_screen.dart';
import 'package:mktp_service/screens/user_screen.dart';
import 'package:mktp_service/tabs/career_tab.dart';
import 'package:mktp_service/tabs/home_tab.dart';
import 'package:mktp_service/widgets/components/new_custom_drawer.dart';

class  HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            body: HomeTab(),
            drawer: NewCustomDrawer(_pageController),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Carreiras"),
              centerTitle: true,
            ),
            drawer: NewCustomDrawer(_pageController),
            body: CareerTab(),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Favoritos"),
              centerTitle: true,
            ),
            body: FavoriteScreen("home"),
            drawer: NewCustomDrawer(_pageController),
          ),
          Scaffold(
            appBar: AppBar(
              title: Text("Perfil"),
              centerTitle: true,
            ),
            drawer: NewCustomDrawer(_pageController),
            body: UserScreen(),
          ),
        ],
      ),
    );
  }
}
