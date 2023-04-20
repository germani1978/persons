import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class Persona {
  String nombre;
  int publicaciones;
  int videos;
  int horas;
  int revisitas;
  int estudios;

  Persona(
      {required this.nombre,
      required this.publicaciones,
      required this.videos,
      required this.horas,
      required this.revisitas,
      required this.estudios});
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
        publicaciones: 10,
        videos: 20,
        horas: 50,
        revisitas: 40,
        estudios: 34),
    Persona(
        nombre: 'Pedro',
        publicaciones: 10,
        videos: 20,
        horas: 50,
        revisitas: 40,
        estudios: 34),
    Persona(
        nombre: 'Silvia',
        publicaciones: 10,
        videos: 20,
        horas: 50,
        revisitas: 40,
        estudios: 34),
    Persona(
        nombre: 'Ernesto',
        publicaciones: 10,
        videos: 20,
        horas: 50,
        revisitas: 40,
        estudios: 34),
    Persona(
        nombre: 'Fidel',
        publicaciones: 10,
        videos: 20,
        horas: 50,
        revisitas: 40,
        estudios: 34),
    Persona(
        nombre: 'Juana',
        publicaciones: 10,
        videos: 20,
        horas: 50,
        revisitas: 40,
        estudios: 34),
  ];

  final List<TextEditingController> nombreControllers = [];
  final List<TextEditingController> publicacionesControllers = [];
  final List<TextEditingController> videosControllers = [];
  final List<TextEditingController> horasControllers = [];
  final List<TextEditingController> revisitasControllers = [];
  final List<TextEditingController> estudiosControllers = [];

  @override
  void initState() {
    super.initState();
    listaPersonas.forEach((persona) {
      nombreControllers.add(TextEditingController(text: persona.nombre));
      publicacionesControllers
          .add(TextEditingController(text: persona.publicaciones.toString()));
      videosControllers
          .add(TextEditingController(text: persona.videos.toString()));
      horasControllers
          .add(TextEditingController(text: persona.horas.toString()));
      revisitasControllers
          .add(TextEditingController(text: persona.revisitas.toString()));
      estudiosControllers
          .add(TextEditingController(text: persona.estudios.toString()));
    });
  }

  @override
  void dispose() {
    nombreControllers.forEach((controller) => controller.dispose());
    publicacionesControllers.forEach((controller) => controller.dispose());
    videosControllers.forEach((controller) => controller.dispose());
    horasControllers.forEach((controller) => controller.dispose());
    revisitasControllers.forEach((controller) => controller.dispose());
    estudiosControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de personas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('publicaciones')),
                DataColumn(label: Text('videos')),
                DataColumn(label: Text('horas')),
                DataColumn(label: Text('revisitas')),
                DataColumn(label: Text('estudios')),
              ],
              rows: listaPersonas.map((persona) {
                int index = listaPersonas.indexOf(persona);
                nombreControllers.add(TextEditingController(text: persona.nombre));
                publicacionesControllers.add(TextEditingController(text: persona.publicaciones.toString()));
                videosControllers.add(TextEditingController(text: persona.videos.toString()));
                horasControllers.add(TextEditingController(text: persona.horas.toString()));
                revisitasControllers.add(TextEditingController(text: persona.revisitas.toString()));
                estudiosControllers.add(TextEditingController(text: persona.estudios.toString()));
                return DataRow(cells: [
                  DataCell(TextField(
                    controller: nombreControllers[index],
                    decoration: InputDecoration(
                      hintText: 'Nombre',
                    ),
                  )),
                  DataCell(TextField(
                    controller: publicacionesControllers[index],
                    decoration: InputDecoration(
                      hintText: 'publicaciones',
                    ),
                  )),
                  DataCell(TextField(
                    controller: videosControllers[index],
                    decoration: InputDecoration(
                      hintText: 'videos',
                    ),
                  )),
                  DataCell(TextField(
                    controller: horasControllers[index],
                    decoration: InputDecoration(
                      hintText: 'horas',
                    ),
                  )),
                  DataCell(TextField(
                    controller: revisitasControllers[index],
                    decoration: InputDecoration(
                      hintText: 'revisitas',
                    ),
                  )),
                  DataCell(TextField(
                    controller: estudiosControllers[index],
                    decoration: InputDecoration(
                      hintText: 'estudios',
                    ),
                  )),
                ]);
              }).toList(),
            ),
            ElevatedButton(
              child: Text('Guardar cambios'),
              onPressed: () {
                for (int i = 0; i < listaPersonas.length; i++) {
                  listaPersonas[i].nombre = nombreControllers[i].text;
                  listaPersonas[i].publicaciones = int.parse(publicacionesControllers[i].text);
                  listaPersonas[i].videos = int.parse(videosControllers[i].text);
                  listaPersonas[i].horas = int.parse(horasControllers[i].text);
                  listaPersonas[i].revisitas = int.parse(revisitasControllers[i].text);
                  listaPersonas[i].estudios = int.parse(estudiosControllers[i].text);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cambios guardados')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


