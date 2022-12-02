import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/main.dart';
import 'package:skull_king_scorekeeper/utils/constants.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/cheatSheet.view.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/previousRounds.view.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/rules.view.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/settings.view.dart';

Drawer generateGameDrawer(BuildContext context) {
  return Drawer(

      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
    child:Container(
        decoration: secondaryDecoration,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black87,
                ),
                child:Align(
                  alignment: Alignment.center,
                  child: Text('Skull King ScoreKeeper', style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ),
            ),
            ListTile(
              title: const Text('Previous Rounds' , style: TextStyle(color: Colors.black87, fontSize: 20)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PreviousRoundsView();
                }));
              },
            ),
            ListTile(
              title: const Text('Cheat Sheet', style: TextStyle(color: Colors.black87, fontSize: 20)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheatSheetView();
                }));
              },
            ),
            ListTile(
              title: const Text('Rules', style: TextStyle(color: Colors.black87, fontSize: 20,)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RulesView();
                }));
              },
            ),
            ListTile(
              title: const Text('Settings', style: TextStyle(color: Colors.black87, fontSize: 20)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsView();
                }));
              },
            ),
            ListTile(
              title: const Text('Main Menu', style: TextStyle(color: Colors.black87, fontSize: 20)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyApp();
                }));
              },
            ),
          ],
        )
    ),
      );
}
