import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class Persona {
  String nombre;
  int Publicaciones;
  int Videos;
  int Horas;
  int Revisitas;
  int Estudios;

  Persona(
      {required this.nombre,
      required this.Publicaciones,
      required this.Videos,
      required this.Horas,
      required this.Revisitas,
      required this.Estudios});
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App para recopilar datos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Time'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
        ),
        body: SingleChildScrollView(
          child: ListaPersonas(),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class ListaPersonas extends StatefulWidget {
  ListaPersonas({super.key});

  @override
  State<ListaPersonas> createState() => _ListaPersonasState();
}

class _ListaPersonasState extends State<ListaPersonas> {

  final List<Persona> listaPersonas = [
    Persona(
        nombre: 'Juan',
        Publicaciones: 10,
        Videos: 20,
        Horas: 50,
        Revisitas: 40,
        Estudios: 34),
    Persona(
        nombre: 'Pedro',
        Publicaciones: 10,
        Videos: 20,
        Horas: 50,
        Revisitas: 40,
        Estudios: 34),
    Persona(
        nombre: 'Silvia',
        Publicaciones: 10,
        Videos: 20,
        Horas: 50,
        Revisitas: 40,
        Estudios: 34),
    Persona(
        nombre: 'Ernesto',
        Publicaciones: 10,
        Videos: 20,
        Horas: 50,
        Revisitas: 40,
        Estudios: 34),
    Persona(
        nombre: 'Fidel',
        Publicaciones: 10,
        Videos: 20,
        Horas: 50,
        Revisitas: 40,
        Estudios: 34),
    Persona(
        nombre: 'Juana',
        Publicaciones: 10,
        Videos: 20,
        Horas: 50,
        Revisitas: 40,
        Estudios: 34),
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Publicaciones')),
        DataColumn(label: Text('Videos')),
        DataColumn(label: Text('Horas')),
        DataColumn(label: Text('Revisitas')),
        DataColumn(label: Text('Estudios')),
      ],
      rows: listaPersonas.map((persona) {
        return DataRow(cells: [

          DataCell(TextFormField(
            initialValue: persona.nombre,
            onChanged: (value) => {persona.nombre = value},
          )),
          DataCell(TextFormField(
            initialValue: persona.Publicaciones.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value)  {
               setState(() {
                 persona.Publicaciones =  value.isEmpty ? 0 :  int.parse(value);
               });
            },
          )),
          DataCell(TextFormField(
            initialValue: persona.Videos.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              setState(() {
                persona.Videos =  value.isEmpty ? 0 :  int.parse(value);
              });
            },
          )),
          DataCell(TextFormField(
            initialValue: persona.Horas.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              setState(() {
                persona.Horas =  value.isEmpty ? 0 :  int.parse(value);
              });
            },
          )),
          DataCell(TextFormField(
            initialValue: persona.Revisitas.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value)  {
              setState(() {
               persona.Revisitas =  value.isEmpty ? 0 :  int.parse(value);
              });
            },
          )),
          DataCell(TextFormField(
            initialValue: persona.Estudios.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) { 
              setState(() {
                persona.Estudios =  value.isEmpty ? 0 :  int.parse(value);
              });
            },
          )),
        ]);
      }).toList(),
    );
  }
}

