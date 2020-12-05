import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          padding: EdgeInsets.only(left: 18),
          height: 60.0,
          child: Row(
            children: [
              Icon(
                icon,
                //size: 32.0,
                color: controller.page.round() == page ?
                Theme.of(context).primaryColor : Colors.black54,
              ),
              SizedBox(width: 25),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: controller.page.round() == page ?
                Theme.of(context).primaryColor : Colors.black54,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}