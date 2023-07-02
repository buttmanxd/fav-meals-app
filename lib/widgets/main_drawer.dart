import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 11, 248, 248),
                  Color.fromARGB(255, 145, 255, 0),
                  Color.fromARGB(255, 222, 245, 11)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.local_cafe_outlined,
                  size: 60,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                const SizedBox(width: 18),
                Text(
                  'Choose Your Options ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood,
              size: 40,
              color: Color.fromARGB(255, 4, 212, 239),
            ),
            title: Text(
              'Menu',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Color.fromARGB(255, 248, 11, 137),
                    fontSize: 30,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings_applications_sharp,
              size: 40,
              color: Color.fromARGB(255, 4, 212, 239),
            ),
            title: Text(
              'Sort by filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Color.fromARGB(255, 248, 11, 137),
                    fontSize: 30,
                  ),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
