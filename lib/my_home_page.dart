import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/petani.dart';
import 'package:flutter_application_1/screens/aboutus_screen.dart';
import 'package:flutter_application_1/screens/books_screen.dart';
import 'package:flutter_application_1/screens/latihanapi_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/petani_screen.dart';
// import 'package:flutter_application_1/screens/latihancrudsqlite_screen.dart';
import 'package:flutter_application_1/screens/settings_screen.dart';
import 'package:flutter_application_1/screens/notification_screen.dart';
import 'package:flutter_application_1/screens/listproducts_screen.dart';
import 'package:flutter_application_1/screens/profile_screen.dart';
// import 'package:flutter_application_1/services/apistatic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // late Future<List<Petani>> futurePetani;

  // final ApiStatic apistatic = ApiStatic();

  // @override
  // void initState() {
  //   super.initState();
  //   futurePetani = apistatic.fetchPetani();
  // }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ListProductsScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'List Products',
    'Notification',
    'Profile',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    if (index >= 0 && index < _screens.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.search), // <-- Ikon pencarian
            onPressed: () {
              // Tambahkan logika ketika ikon pencarian diklik
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 1),
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width * 0.3,
          //     child: const TextField(
          //       decoration: InputDecoration(
          //         hintText: 'Search...',
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //   ),
          // ),
          IconButton(
            icon: const Icon(Icons.favorite), // <-- Ikon keranjang belanja
            onPressed: () {
              // Tambahkan logika ketika ikon keranjang belanja diklik
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart), // <-- Ikon chat
            onPressed: () {
              // Tambahkan logika ketika ikon chat diklik
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        // type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),

      //DRAWERNYA
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              trailing: const Icon(Icons.home),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   title: const Text('Settings'),
            //   selected: _selectedIndex == 1,
            //   onTap: () {
            //     // Update the state of the app
            //     _onItemTapped(1);
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Profile'),
            //   selected: _selectedIndex == 2,
            //   onTap: () {
            //     // Update the state of the app
            //     _onItemTapped(2);
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('LatihanAPI'),
            //   selected: _selectedIndex == 3,
            //   onTap: () {
            //     // Update the state of the app
            //     _onItemTapped(3);
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              title: const Text('Latihan API'),
              trailing: const Icon(Icons.list),
              selected: _selectedIndex == 4,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LatihanAPIScreen()), // <-- Tambah baris ini
                );
              },
            ),
            // ListTile(
            //   title: const Text('Latihan CRUD SQlite'),
            //   selected: _selectedIndex == 5,
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const LatihanCRUDSQlite()), // <-- Tambah baris ini
            //     );
            //   },
            // ),
            ListTile(
              title: const Text('Books'),
              trailing: const Icon(Icons.book),
              selected: _selectedIndex == 5,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const BooksScreen()), // <-- Tambah baris ini
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              trailing: const Icon(Icons.settings),
              selected: _selectedIndex == 6,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SettingsScreen()), // <-- Tambah baris ini
                );
              },
            ),
            ListTile(
              title: const Text('About Us'),
              trailing: const Icon(Icons.info),
              selected: _selectedIndex == 7,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AboutUs()), // <-- Tambah baris ini
                );
              },
            ),
            ListTile(
              title: const Text('Petani'),
              trailing: const Icon(Icons.api),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PetaniScreen()),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
