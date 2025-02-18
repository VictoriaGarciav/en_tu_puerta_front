import 'package:en_tu_puerta_front/search_components/location_dialog.dart';
import 'package:en_tu_puerta_front/widget_search.dart';
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Text('Carrousel de fechas')),
          ),
          SizedBox(height: 20),
          Text(
            'Seleccionar hora',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              RadioListTile(
                title: Text('9:00 AM'),
                value: '9:00',
                groupValue: null,
                onChanged: (value) {},
              ),
              RadioListTile(
                title: Text('11:00 AM'),
                value: '11:00',
                groupValue: null,
                onChanged: (value) {},
              ),
              RadioListTile(
                title: Text('1:00 PM'),
                value: '13:00',
                groupValue: null,
                onChanged: (value) {},
              ),
              RadioListTile(
                title: Text('3:00 PM'),
                value: '15:00',
                groupValue: null,
                onChanged: (value) {},
              ),
            ],
          ),
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