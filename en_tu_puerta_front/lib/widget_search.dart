import 'package:flutter/material.dart';

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({super.key});

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  String selectedFilter = 'Todos'; // Initialize with 'Todos' selected

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  setState(() {
                    selectedFilter = value;
                  });
                  // Handle filter selection
                },
                itemBuilder: (BuildContext context) => [
                  _buildMenuItem('Todos'),
                  _buildMenuItem('Servicio'),
                  _buildMenuItem('Cuenta'),
                ],
              ),
            ],
            onChanged: (value) {
              // Handle search input
            },
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildMenuItem(String value) {
  return PopupMenuItem<String>(
    value: value,
    child: Container(
      padding: EdgeInsets.all(8.0), // Increased padding
      decoration: BoxDecoration(
        color: selectedFilter == value ? Colors.grey[300] : null,
        borderRadius: BorderRadius.circular(4.0), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value),
          if (selectedFilter == value)
            Icon(Icons.check, size: 16, color: Colors.black),
        ],
      ),
    ),
  );
}
}