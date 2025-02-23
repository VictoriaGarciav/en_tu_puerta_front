import 'package:flutter/material.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Ubicacion',
              style: TextStyle(
                color: Color(0xFF001563),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
  decoration: InputDecoration(
    labelText: 'Estado',
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF001563)),
    ),
    alignLabelWithHint: true,
  ),
  maxLines: 10,
)

        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Atras'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Solicitud enviada!'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('El proveedor de servicio responderá en los próximos 10 minutos para confirmar la solicitud'),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text('Aceptar'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text('Enviar solicitud'),
        ),
      ],
    );
  }
}