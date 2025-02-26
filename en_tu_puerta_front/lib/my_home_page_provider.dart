import 'package:flutter/material.dart';
import 'package:en_tu_puerta_front/widget_provider/screen_provider_home.dart';
import 'package:en_tu_puerta_front/widget_provider/screen_provider_petition.dart';
import 'package:en_tu_puerta_front/widget_provider/screen_provider_metrics.dart';
import 'package:en_tu_puerta_front/widget_provider/screen_provider_settings.dart';

//Controlador principal de la aplicación en el rol de proveedor
class MyHomePageProvider extends StatefulWidget {
  const MyHomePageProvider({super.key, required this.title});

  final String title;

  @override
  State<MyHomePageProvider> createState() => _MyHomePageProviderState();
}

class _MyHomePageProviderState extends State<MyHomePageProvider> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    WidgetProviderHome(),
    WidgetProviderNotifications(),
    WidgetProviderMetrics(),
    WidgetProviderSettings()
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
            icon: Icon(Icons.notifications),
            label: 'Solicitudes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_outlined),
            label: 'Metricas',
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