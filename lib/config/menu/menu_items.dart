import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.icon,
  });

}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Buttons',
    subtitle: 'Various flutter Buttons',
    url: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: 'Cards',
    subtitle: 'A Container with styles',
    url: '/cards',
    icon: Icons.credit_card
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generic and controlled',
    url: '/progress',
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: 'Snackbars and Dialogs',
    subtitle: 'Screen Indicators',
    url: '/snackbars',
    icon: Icons.info_outline
  ),
  MenuItem(
    title: 'Animated Container',
    subtitle: 'An animated Stateful widget',
    url: '/animated',
    icon: Icons.animation_rounded
  ),
  MenuItem(
    title: 'UI Controls',
    subtitle: 'Control for ui',
    url: '/ui-controls',
    icon: Icons.check_circle_outline_outlined
  ),
  MenuItem(
    title: 'Tutorial',
    subtitle: 'Tutorial pane view',
    url: '/tutorial',
    icon: Icons.new_releases_outlined
  ),
  MenuItem(
    title: 'Infinite Scroll',
    subtitle: 'Infinite Scroll test',
    url: '/infinte-scroll',
    icon: Icons.move_down_rounded
  ),
];