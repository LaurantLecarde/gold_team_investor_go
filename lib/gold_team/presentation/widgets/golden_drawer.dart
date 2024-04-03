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
              )),
          ListTile(
            leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/icons/profile.png",fit: BoxFit.cover,)),
            title: const Text('Profile'),
            onTap: () {},
          ),ListTile(
            leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/icons/main.png",fit: BoxFit.cover,)),
            title: const Text('Asosiy'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
