import 'package:en_tu_puerta_front/widget_home.dart';
import 'package:en_tu_puerta_front/widget_notifications.dart';
import 'package:en_tu_puerta_front/widget_search.dart';
import 'package:en_tu_puerta_front/widget_settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class PreHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://i.postimg.cc/05h66XrJ/Artboard-1-copy-2-3x.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                '¡Nosotros nos encargamos!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                '¿Que necesitas?',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Cliente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Icon(
                Icons.person,
                size: 50,
                color: Colors.blue,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home')),
                  );
                },
                child: Text('Solicitar servicio'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Color(0xFF001563),
                ),
              ),
              SizedBox(height: 40),
              Icon(
                Icons.person,
                size: 50,
                color: Colors.green,
              ),
              SizedBox(height: 10),
              Text(
                'Proveedor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add navigation for provider flow here
                },
                child: Text('Ofrecer servicio'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Color(0xFF001563),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PreHomeScreen(),
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
  int _selectedIndex = 0;

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
              width: 150,
              height: 150,
            ),
            SizedBox(width: 10),
            Spacer(),
            Icon(
              Icons.account_circle_outlined,
              size: 40,
              color: Color(0xFF001563)),
          ],
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
