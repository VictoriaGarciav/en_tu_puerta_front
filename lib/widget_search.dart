import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final IconData icon;
  final String name;
  final double rating;
  final String description;

  const DetailView({
    required this.icon,
    required this.name,
    required this.rating,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 60, color: Color(0xFF001563)),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, size: 24, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({super.key});

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  String selectedFilter = 'Todos';
  final List<Map<String, dynamic>> mockResults = [
    {
      'icon': Icons.cleaning_services,
      'name': 'Limpieza Profunda de Ares 🤑🤑',
      'rating': 4.5,
      'description': 'Servicio completo de limpieza para hogares y oficinas'
    },
    {
      'icon': Icons.laptop,
      'name': 'Técnico en Informática Victoria',
      'rating': 4.8,
      'description': 'Tengo habilidades en reparación de computadoras (y hambre)'
    },
    {
      'icon': Icons.girl,
      'name': 'Estilista Certificada Dani',
      'rating': 4.7,
      'description': 'Hago uñas, peinados, maquillaje y más'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: SearchBar(
            hintText: 'Search...',
            leading: Icon(
              Icons.search,
              color: Color(0xFF001563),
            ),
            trailing: [
              PopupMenuButton<String>(
                icon: Icon(
                  Icons.filter_list,
                  color: Color(0xFF001563),
                ),
                onSelected: (String value) {
                  setState(() {
                    selectedFilter = value;
                  });
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
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: mockResults.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailView(
                        icon: mockResults[index]['icon'],
                        name: mockResults[index]['name'],
                        rating: mockResults[index]['rating'],
                        description: mockResults[index]['description'],
                      ),
                    ),
                  );
                },
                child: SearchResultCard(
                  icon: mockResults[index]['icon'],
                  name: mockResults[index]['name'],
                  rating: mockResults[index]['rating'],
                  description: mockResults[index]['description'],
                ),
              );
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
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedFilter == value ? Colors.grey[300] : null,
          borderRadius: BorderRadius.circular(4.0),
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

class SearchResultCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final double rating;
  final String description;

  const SearchResultCard({
    required this.icon,
    required this.name,
    required this.rating,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 130,
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Color(0xFF001563)),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
