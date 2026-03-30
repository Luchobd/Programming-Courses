import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button,
  ),

  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Tarjetas en Flutter',
    link: '/cards',
    icon: Icons.credit_card,
  ),

  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Indicadores de progreso',
    link: '/progress',
    icon: Icons.refresh,
  ),

  MenuItem(
    title: 'Snackbars y diálogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),

  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),

  MenuItem(
    title: 'UI Controls + Titles',
    subTitle: 'Una serie de controles de flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),

  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessibility_rounded,
  ),
];
