import 'package:flutter/material.dart';

// Componente que muestra una tarjeta de resultado de búsqueda
class SearchResultCard extends StatelessWidget {

  final IconData icon;
  final String name;
  final double price;
  final double rating;
  final String description;

  const SearchResultCard({
    required this.icon,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Construye la tarjeta de resultado con icono, nombre, rating y descripción

    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Container(
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),

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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
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
