import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shutter/core/data/container/data.dart';
import 'package:shutter/visual/menu/widgets/information.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/administration.dart';
import 'package:shutter/visual/menu/widgets/management/widgets/creator.dart';
import 'package:shutter/visual/menu/widgets/support.dart';

import '../core/object/user/permissions.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  final List<GButton> _buttonAdmin = [
    const GButton(
      icon: Icons.view_in_ar_rounded,
      text: 'Creatorbereich',
    ),
    const GButton(
      style: GnavStyle.google,
      icon: Icons.admin_panel_settings_rounded,
      text: 'Administration',
    ),
    const GButton(
      icon: Icons.contact_support,
      text: 'Supportbereich',
    ),
    const GButton(
      icon: Icons.info_rounded,
      text: 'Information',
    ),
  ];

  final List<GButton> _buttonCreator = [
    const GButton(
      icon: Icons.view_in_ar_rounded,
      text: 'Creatorbereich',
    ),
    const GButton(
      icon: Icons.contact_support,
      text: 'Supportbereich',
    ),
    const GButton(
      icon: Icons.info_rounded,
      text: 'Information',
    ),
  ];

  final List<GButton> _buttonUser = [
    const GButton(
      icon: Icons.view_in_ar_rounded,
      text: 'Creatorbereich',
    ),
    const GButton(
      icon: Icons.contact_support,
      text: 'Supportbereich',
    ),
    const GButton(
      icon: Icons.info_rounded,
      text: 'Information',
    ),
  ];

  final List<Widget> _pagesAdmin = [
    CreatorPage(),
    AdminPanel(),
    Support(),
    Information(),
  ];

  final List<Widget> _pagesCreator = [
    CreatorPage(),
    Support(),
    Information(),
  ];

  final List<Widget> _pagesUser = [
    CreatorPage(),
    Support(),
    Information(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            body: Center(
              child: (Data.user!.permissions == Permissions.Administrator)
                  ? _pagesAdmin.elementAt(_selectedIndex)
                  : ((Data.user!.permissions == Permissions.Creator)
                      ? _pagesCreator.elementAt(_selectedIndex)
                      : _pagesUser.elementAt(_selectedIndex)),
            ),
            backgroundColor: Data.colorBackground,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Data.colorBackground,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.2, vertical: 7),
                child: GNav(
                    backgroundColor: Data.colorBackground,
                    tabActiveBorder:
                        Border.all(color: Data.colorSelected, width: 3),
                    onTabChange: (value) {
                      _onItemTapped(value);
                    },
                    gap: 10,
                    color: Data.colorUnselected,
                    activeColor: Data.colorSelected,
                    haptic: true,
                    padding: const EdgeInsets.all(12),
                    selectedIndex: 0,
                    tabs: (Data.user!.permissions == Permissions.Administrator)
                        ? _buttonAdmin
                        : ((Data.user!.permissions == Permissions.Creator)
                            ? _buttonCreator
                            : _buttonUser)),
              ),
            ),
          )),
    );
  }
}
