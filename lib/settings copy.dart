import 'package:flutter/material.dart';
import 'package:uninav/components/drawer.dart';
import 'package:uninav/components/hamburger_menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: HamburgerMenu(),
      ),
      drawer: MyDrawer(),
      body: const Center(
        child: Text('TODO'),
      ),
    );
  }
}
