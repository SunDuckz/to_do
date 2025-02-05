import 'package:flutter/material.dart';

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
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: TextField(
                      controller: nomeController,
                      decoration: InputDecoration(
                          label: Text("nome"), border: OutlineInputBorder()))),
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                      height: 500,
                      child: ListView.builder(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                          itemCount: listaUsuario.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Icon(Icons.person),
                                trailing: IconButton(
                                    onPressed: () =>
                                        deleteNome(listaUsuario[index]),
                                    icon: Icon(Icons.delete)),
                                title: Text(listaUsuario[index]));
                          }))),
            ])),
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
