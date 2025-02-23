import 'package:flutter/material.dart';

class SearchService {
  static const List<Map<String, dynamic>> mockResults = [
    {
      'icon': Icons.cleaning_services,
      'name': 'Técnico Ares Ramírez',
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
}