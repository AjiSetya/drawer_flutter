part of 'pages.dart';

class DrawerItem {
  String titleItem;
  IconData iconItem;

  DrawerItem(this.titleItem, this.iconItem);
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final drawerItems = [
    DrawerItem('Home', Icons.home),
    DrawerItem('Business', Icons.business),
    DrawerItem('School', Icons.school),
    DrawerItem('Contacts', Icons.contacts),
    DrawerItem('About', Icons.info),
  ];

  int _selectedItemIndex = 0;

  _switchPage(int position) {
    switch (position) {
      case 0:
        return HomePage();
      case 1:
        return BussinessPage();
      case 2:
        return SchoolPage();
      case 3:
        return ContactPage();
      case 4:
        return AboutPage();
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedItemIndex = index;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var drawerMenu = <Widget>[];

    for (var indexMenu = 0; indexMenu < drawerItems.length; indexMenu++) {
      drawerMenu.add(ListTile(
        title: Text(drawerItems[indexMenu].titleItem),
        leading: Icon(drawerItems[indexMenu].iconItem),
        selected: indexMenu == _selectedItemIndex,
        onTap: () => _onSelectItem(indexMenu),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Apps W/ Drawer'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://wallpaperaccess.com/full/99840.jpg")
                )
              ),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("https://qph.fs.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859"),
              ),
                accountName: Text('Aji Setya'),
                accountEmail: Text('setyaaji07@gmail.com')),
            Expanded(
              child: ListView(
                children: drawerMenu,
              ),
            )
          ],
        ),
      ),
      body: _switchPage(_selectedItemIndex),
    );
  }
}
