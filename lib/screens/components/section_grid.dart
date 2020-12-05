import 'package:flutter/material.dart';
import 'package:mktp_service/models/section.dart';
import 'package:mktp_service/tiles/item_tile.dart';

class SectionGrid extends StatelessWidget {
  const SectionGrid(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
              ),
              itemBuilder: (_, index) {
                return ItemTile(section.items[index]);
              },
              itemCount: section.items.length,
            )
          ],
        ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:mktp_service/models/section.dart';
import 'package:mktp_service/tiles/item_tile.dart';

class SectionGrid extends StatelessWidget {
  const SectionGrid(this.section);

  final Section section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
            ),
            itemBuilder: (_, index) {
              return ItemTile(section.items[index]);
            },
            itemCount: section.items.length,
          )
        ],
      ),
    );
  }
}

 */