
import 'package:en_tu_puerta_front/widget_home.dart';
import 'package:en_tu_puerta_front/widget_notifications.dart';
import 'package:en_tu_puerta_front/widget_search.dart';
import 'package:en_tu_puerta_front/widget_settings.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  //index of the current page
  int _selectedIndex = 0;
  //bottom navigation bar items
  static final List<Widget> _widgetOptions = <Widget>[
    WidgetHome(),
    WidgetSearch(),
    WidgetNotification(),
    WidgetSettings()
  ];

  void _selectOptionInMyBottomNavigation(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
  title: Row(
    children: [
      Image.network(
        'https://i.postimg.cc/05h66XrJ/Artboard-1-copy-2-3x.png',
        width: 150, // Adjust width as needed
        height: 150, // Adjust height as needed
      ),
      SizedBox(width: 10), // Space between image and title
      Spacer(), // Pushes the profile logo to the right
      Icon(
        Icons.account_circle_outlined,
         size: 40,
         color: Color(0xFF001563)),
    ],
  ),
),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(items: const<BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Búsqueda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notificaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xFF001563),
      onTap: _selectOptionInMyBottomNavigation,
      ),
    );
  }
}
