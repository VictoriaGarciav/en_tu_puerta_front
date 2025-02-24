import 'package:flutter/material.dart';

class SearchService {
  static const List<Map<String, dynamic>> mockResults = [
    {
      'icon': Icons.cleaning_services,
      'name': 'Servicio de Peluquería',
      'price': 25.0,
      'rating': 4.5,
      'description': 'Servicio de Peluquería profesional con los mejores estilistas',
      'providerImage': 'https://example.com/prof1.jpg',
      'providerName': 'María López',
      'location': 'Calle Principal #123'
    },
    {
      'icon': Icons.brush_rounded,
      'name': 'Servicio de Manicura',
      'price': 15.0,
      'rating': 4.8,
      'description': 'Manicura profesional con diseños modernos',
      'providerImage': 'https://example.com/prof2.jpg',
      'providerName': 'Ana Martínez',
      'location': 'Avenida Central #456'
    },
    {
      'icon': Icons.girl,
      'name': 'Servicio de Pedicura',
      'price': 20.0,
      'rating': 4.7,
      'description': 'Pedicura relajante con masaje incluido',
      'providerImage': 'https://example.com/prof3.jpg',
      'providerName': 'Laura Gómez',
      'location': 'Boulevard Norte #789'
    },
  ];

}
