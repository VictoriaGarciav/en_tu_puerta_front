import 'package:en_tu_puerta_front/search_components/location_dialog.dart';
import 'package:flutter/material.dart';

class ServiceRequestDialog extends StatelessWidget {
  const ServiceRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
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
          Container(
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
                DayBox('Dom'),
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
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => LocationDialog(),
                );
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ],
    );
  }
}

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
