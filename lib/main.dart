import 'package:flutter/material.dart';


void  main(List<String> args) {
    runApp( MyApp() );
}

class Persona {
  final String nombre;
  final int Publicaciones;
  final int Videos;
  final int Horas;
  final int Revisitas;
  final int Estudios;

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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App para recopilar datos',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Time'),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.settings)
            ),
          ],
        ),
        body: Center(
         
        ),
      ),
    );
  }
}

class ListaPersonas extends StatelessWidget {
   ListaPersonas({super.key});

  final List<Persona> listaPersonas = [
    Persona(nombre: 'Juan', Publicaciones: 10, Videos: 20, Horas: 50, Revisitas: 40, Estudios: 34),
    Persona(nombre: 'Pedro', Publicaciones: 10, Videos: 20, Horas: 50, Revisitas: 40, Estudios: 34),
    Persona(nombre: 'Silvia', Publicaciones: 10, Videos: 20, Horas: 50, Revisitas: 40, Estudios: 34),
    Persona(nombre: 'Ernesto', Publicaciones: 10, Videos: 20, Horas: 50, Revisitas: 40, Estudios: 34),
    Persona(nombre: 'Fidel', Publicaciones: 10, Videos: 20, Horas: 50, Revisitas: 40, Estudios: 34),
    Persona(nombre: 'Juana', Publicaciones: 10, Videos: 20, Horas: 50, Revisitas: 40, Estudios: 34),
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
          DataCell(Text(persona.nombre)),
          DataCell(Text(persona.Publicaciones.toString())),
          DataCell(Text(persona.Videos.toString())),
          DataCell(Text(persona.Horas.toString())),
          DataCell(Text(persona.Revisitas.toString())),
          DataCell(Text(persona.Estudios.toString())),
        ]);
      }).toList(),
    );
  }
}



/**
 * 
 * import 'package:flutter/material.dart';

class ListaPersonas extends StatelessWidget {
  final List<Persona> listaPersonas;

  ListaPersonas(this.listaPersonas);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Foto')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Edad')),
        DataColumn(label: Text('Peso')),
        DataColumn(label: Text('Altura')),
      ],
      rows: listaPersonas.map((persona) {
        return DataRow(cells: [
          DataCell(CircleAvatar(backgroundImage: NetworkImage(persona.foto))),
          DataCell(Text(persona.nombre)),
          DataCell(Text(persona.edad.toString())),
          DataCell(Text('${persona.peso} kg')),
          DataCell(Text('${persona.altura} m')),
        ]);
      }).toList(),
    );
  }
}

class Persona {
  String nombre;
  int edad;
  double peso;
  double altura;
  String foto;

  Persona(this.nombre, this.edad, this.peso, this.altura, this.foto);
}

void main() {
  List<Persona> listaPersonas = [
    Persona('Juan', 25, 70, 1.75, 'https://miweb.com/foto1.jpg'),
    Persona('María', 30, 60, 1.65, 'https://miweb.com/foto2.jpg'),
    Persona('Pedro', 28, 80, 1.80, 'https://miweb.com/foto3.jpg'),
  ];

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Lista de personas')),
        body: ListaPersonas(listaPersonas),
      ),
    ),
  );
}

 */
