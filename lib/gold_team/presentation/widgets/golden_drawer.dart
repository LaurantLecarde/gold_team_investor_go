import 'package:flutter/material.dart';

class GoldenDrawer extends StatelessWidget {
  const GoldenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
           DrawerHeader(
              child: Container(
                color: Colors.red,
                child: null,
              )), ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Asosiy'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
