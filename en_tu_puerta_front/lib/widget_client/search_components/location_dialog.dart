import 'package:flutter/material.dart';
import 'package:en_tu_puerta_front/widgets/reusable_button.dart';


// Diálogo para seleccionar la ubicación del servicio
class LocationDialog extends StatelessWidget {

  const LocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Construye el diálogo con campo de ubicación y acciones

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
          onPressed: () {
            // Cierra el diálogo actual y regresa al diálogo anterior
            Navigator.pop(context);
          },

          child: Text('Atras'),
        ),
            ReusableButton(
              text: 'Enviar solicitud',
              color: Color(0xFF001563),
              onPressed: () {
                // Cierra el diálogo actual y muestra la confirmación de solicitud
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
                          child: ReusableButton(
                            text: 'Aceptar',
                            color: Color(0xFF001563),
                            onPressed: () {
                              // Cierra todos los diálogos y regresa a la pantalla principal
                              Navigator.popUntil(context, (route) => route.isFirst);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      ],
    );
  }
}
