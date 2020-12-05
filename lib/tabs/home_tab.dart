import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mktp_service/models/home_manager.dart';
import 'package:mktp_service/screens/components/section_grid.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );

    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 10.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Destaques"),
                centerTitle: true,
              ),
            ),
            Consumer<HomeManager>(builder: (_, homeManager, __) {
              final List<Widget> children = homeManager.sections.map<Widget>(
                      (section){
                    //return SectionList(section);
                    return SectionGrid(section);
                  }
              ).toList();
              return SliverList(
                delegate: SliverChildListDelegate(children),
              );
            },
            )
          ],
        )
      ],
    );
  }
}

/*
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    );

    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 10.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Destaques"),
                centerTitle: true,
              ),
            ),
            Consumer<HomeManager>(builder: (_, homeManager, __) {
              final List<Widget> children = homeManager.sections.map<Widget>(
                      (section){
                        //return SectionList(section);
                        return SectionGrid(section);
                  }
              ).toList();
              return SliverList(
                delegate: SliverChildListDelegate(children),
              );
            },
            )
          ],
        )
      ],
    );
  }
}
 */

