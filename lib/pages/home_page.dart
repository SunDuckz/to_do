import 'package:flutter/material.dart';
import 'package:to_do/widgets/InputWidget.dart';
import 'package:to_do/widgets/listWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  var listaUsuario = <String>["Pedro", "joão", "Jorge"];
  var nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InputWidget(controller: nomeController),
              Listwidget(
                  listaUsuario: listaUsuario,
                  addNome: addNome,
                  deleteNome: deleteNome)
            ]),
        floatingActionButton: FloatingActionButton(
          tooltip: "Adicionar nome",
          onPressed: addNome,
          child: Icon(Icons.add),
        ));
  }

  void addNome() {
    if (nomeController.text == "") {
      return;
    }

    setState(() {
      listaUsuario.add(nomeController.text);
      nomeController.clear();
    });
  }

  void deleteNome(String name) {
    setState(() {
      listaUsuario.remove(name);
    });
  }
}
