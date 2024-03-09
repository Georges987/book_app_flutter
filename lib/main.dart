import 'package:ergonomie/widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OPALE',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'OPALE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: const [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: null,
            ),
            Icon(
              Icons.notification_important,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.account_circle, size: 100),
                      Text('User Name'),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Accueil'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Bookfinder'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const BookFinder();
                    },
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock_rounded),
                title: const Text('Admin'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const Admin();
                    },
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const Home(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Paramètres',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Acceuil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Bibliothèque',
            ),
          ],
          selectedItemColor: Colors.amber[800],
        ));
  }

  int _selectedIndex = 0;
}
