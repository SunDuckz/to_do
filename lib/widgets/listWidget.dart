import 'package:flutter/material.dart';

class Listwidget extends StatelessWidget {
  final List<String> listaUsuario;
  final void Function() addNome;
  final void Function(int index) deleteNome;

  const Listwidget(
      {super.key,
      required this.listaUsuario,
      required this.addNome,
      required this.deleteNome});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
          itemCount: listaUsuario.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.person),
                trailing: IconButton(
                    onPressed: () => deleteNome(index),
                    icon: Icon(Icons.delete)),
                title: Text(listaUsuario[index]));
          }),
    );
  }
}
