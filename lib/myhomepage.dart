import 'package:flutter/material.dart';

import 'fragments/blog_screen.dart';
import 'fragments/home_screen.dart';
import 'fragments/profile_screen.dart';

class DrawerItem {
  String title;
  IconData iconData;

  DrawerItem(this.title, this.iconData);
}

class MyHomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Profile", Icons.people),
    new DrawerItem("Blog", Icons.list)
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int position) {
    switch (position) {
      case 0:
        return new HomeScreen();
      case 1:
        return new ProfileScreen();
      case 2:
        return new BlogScreen();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOption = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var itemDrawer = widget.drawerItems[i];
      drawerOption.add(new ListTile(
        title: new Text(itemDrawer.title),
        leading: new Icon(itemDrawer.iconData),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Aji Setya"),
                accountEmail: new Text("setyaaji07@gmail.com")),
            new Column(
              children: drawerOption,
            )
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
