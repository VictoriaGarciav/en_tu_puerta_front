import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController timePicker = TextEditingController();
  TextEditingController datePicker = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solicitar Servicio"),
        elevation: 0,
        centerTitle: true,
      ), //AppBar

    body: Padding(
      padding: const EdgeInsets.all(20,0),
      child: Column(
        children: [
          TextField(
            controller:timePicker,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              labelText: "Escoge un horario",
              labelStyle: const TextStyle(
                frontSize: 16,
                color: Colors.purple,
              ), //TextStyle
            ), //Input Decoration
            onTap: () async{
              var time = await showTimePicker(
                context: context, initialTime: TimeOfDay.now());

              if (time !=null){
                setState(() {
                  timePicker.text = time.format(context);
                });
              }
            }
          ), //Text Field
    
          const SizedBox(height: 20,),


          TextField(
            controller:datePicker,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              labelText: "Escoge una fecha",
              labelStyle: const TextStyle(
                frontSize: 16,
                color: Colors.purple,
              ), //TextStyle
            ), //Input Decoration
          ),

        ],
      ), // Column 
    ), // Padding
    );  //Scaffold
  }
}


