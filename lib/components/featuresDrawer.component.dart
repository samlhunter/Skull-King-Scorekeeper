import 'package:flutter/material.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/cheatSheet.view.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/previousRounds.view.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/rules.view.dart';
import 'package:skull_king_scorekeeper/views/extraPanePages/settings.view.dart';

Drawer generateGameDrawer(BuildContext context) {
  return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Skull King ScoreKeeper'),
      ),
      ListTile(
        title: const Text('Previous Rounds'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PreviousRoundsView();
          }));
        },
      ),
      ListTile(
        title: const Text('Cheat Sheet'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CheatSheetView();
          }));
        },
      ),
      ListTile(
        title: const Text('Rules'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RulesView();
          }));
        },
      ),
      ListTile(
        title: const Text('Settings'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SettingsView();
          }));
        },
      ),
    ],
  ));
}
