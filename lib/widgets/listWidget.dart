import 'package:flutter/material.dart';

class Listwidget extends StatelessWidget {
  final List<String> listaUsuario;
  final void Function() addNome;
  final void Function(String name) deleteNome;

  const Listwidget(
      {super.key,
      required this.listaUsuario,
      required this.addNome,
      required this.deleteNome});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
            height: 500,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                itemCount: listaUsuario.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Icon(Icons.person),
                      trailing: IconButton(
                          onPressed: () => _deleteNome(listaUsuario[index]),
                          icon: Icon(Icons.delete)),
                      title: Text(listaUsuario[index]));
                })));
  }

  void _deleteNome(String name) {
    deleteNome(name);
  }
}
