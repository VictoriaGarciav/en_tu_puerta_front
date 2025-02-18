import 'package:flutter/material.dart';
import 'search_components/detail_view.dart';
import 'search_components/search_result_card.dart';
import 'search_components/search_service.dart';

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({super.key});

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredResults = [];

  void _filterResults(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredResults = [];
      } else {
        _filteredResults = SearchService.mockResults
            .where((result) => result['name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt, color: Color(0xFF001563)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Filtrar'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Filtros no disponibles por el momento'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Aceptar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: Color(0xFF001563)),
              decoration: InputDecoration(
                hintText: 'Buscar servicio...',
                hintStyle: TextStyle(color: Color(0xFF001563).withOpacity(0.6)),
                prefixIcon: Icon(Icons.search, color: Color(0xFF001563)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF001563)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF001563)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF001563), width: 2),
                ),
              ),
              onChanged: _filterResults,
            ),
          ),
          Expanded(
            child: _filteredResults.isEmpty
                ? Center(
                    child: Text(
                      _searchController.text.isEmpty
                          ? '¿Qué deseas buscar hoy?'
                          : 'No se encontraron resultados',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF001563),
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: _filteredResults.length,
                    itemBuilder: (context, index) {
                      final result = _filteredResults[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailView(
                                icon: result['icon'],
                                name: result['name'],
                                rating: result['rating'],
                                description: result['description'],
                              ),
                            ),
                          );
                        },
                        child: SearchResultCard(
                          icon: result['icon'],
                          name: result['name'],
                          rating: result['rating'],
                          description: result['description'],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
