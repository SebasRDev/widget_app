import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    late final hasNotch = MediaQuery.of(context).viewPadding.top;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.url);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch, 20, 10),
          child: const Text('Hola User!'),
        ),

        ...appMenuItems
          .sublist(0,3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text('Otras opciones'),
        ),
        ...appMenuItems
          .sublist(3)
          .map((item) => NavigationDrawerDestination(
            icon: Icon(item.icon), 
            label: Text(item.title)
          ),
        ),
      ]
    );
  }
}