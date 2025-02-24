import 'package:en_tu_puerta_front/widget_client/search_components/location_dialog.dart';
import 'package:en_tu_puerta_front/widgets/reusable_button.dart';

import 'package:flutter/material.dart';

// Diálogo para solicitar un servicio con selección de fecha
class ServiceRequestDialog extends StatelessWidget {

  const ServiceRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Construye el diálogo con selección de fecha y botones de acción

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Solicitar servicio',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Seleccionar fecha',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DayBox('Lun'),
                DayBox('Mar'),
                DayBox('Mié'),
                DayBox('Jue'),
                DayBox('Vie'),
                DayBox('Sáb'),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Cierra el diálogo actual sin realizar cambios
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            ReusableButton(
              text: 'Continuar',
              color: Color(0xFF001563),
              onPressed: () {
                // Cierra este diálogo y abre el diálogo de ubicación
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => LocationDialog(),
                );
              },
            ),


          ],
        ),
      ],
    );
  }
}

// Widget auxiliar para mostrar cajas de selección de día
Widget DayBox(String day) {

  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: Text(day),
    ),
  );
}
