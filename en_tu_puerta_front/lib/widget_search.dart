import 'package:flutter/material.dart';

class WidgetSearch extends StatelessWidget {
  const WidgetSearch({super.key});

  @override
Widget build(BuildContext context) {
  return Container(
    color: Colors.grey,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: SearchBar(
            hintText: 'Search...',
            leading: Icon(Icons.search),
            trailing: [
              PopupMenuButton<String>(
                icon: Icon(Icons.filter_list),
                onSelected: (String value) {
                  // Handle filter selection
                  switch (value) {
                    case 'Todos':
                      // Handle Todos filter
                      break;
                    case 'Servicio':
                      // Handle Servicio filter
                      break;
                    case 'Cuenta':
                      // Handle Cuenta filter
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'Todos',
                    child: Text('Todos'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Servicio',
                    child: Text('Servicio'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Cuenta',
                    child: Text('Cuenta'),
                  ),
                ],
              ),
            ],
            onChanged: (value) {
              // Handle search input
            },
          ),
        ),
        Text('Index 1: Search'),
      ],
    ),
  );
}
}