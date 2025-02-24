import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// Widget que muestra un carrusel de imágenes con soporte para deslizamiento
class ImageCarousel extends StatelessWidget {
  /// Lista de URLs de las imágenes a mostrar en el carrusel
  final List<String> imageUrls;

  /// Constructor del carrusel de imágenes
  const ImageCarousel({required this.imageUrls, super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      // Número de imágenes en el carrusel
      itemCount: imageUrls.length,
      
      // Opciones de configuración del carrusel
      options: CarouselOptions(
        height: 250, // Altura fija del carrusel
        autoPlay: true, // Reproducción automática
        enlargeCenterPage: true, // Efecto de zoom en la imagen central
        viewportFraction: 1.0, // Fracción de la pantalla que ocupa cada imagen
        enableInfiniteScroll: imageUrls.length > 1, // Scroll infinito si hay más de una imagen
        autoPlayInterval: const Duration(seconds: 3), // Intervalo de cambio automático
        scrollPhysics: const BouncingScrollPhysics(), // Física de desplazamiento
      ),
      
      // Constructor de cada ítem del carrusel
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
              width: double.infinity,
              // Manejo de errores al cargar imágenes
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
              // Mostrar indicador de carga mientras se cargan las imágenes
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
