import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(new ListaTarefasApp());
}

class ListaTarefasApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'TodoList App',
      home: new ListaScreen()
    );
  }

}

class ListaScreen extends StatefulWidget {
  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {

  List<Tarefa> tarefas = new List<Tarefa>();
  TextEditingController controller = new TextEditingController();

  void adicionarTarefa(String nome) {

    setState(() {
      tarefas.add(Tarefa(nome));
    });
    controller.clear();
  }

  Widget getItem(Tarefa tarefa ) {

    return new Row(
              children: [
                IconButton(
                  icon: new Icon(tarefa.concluida ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.green,),
                  iconSize: 42,
                  onPressed: () {
                    setState(() {
                      bool estado = tarefa.concluida;
                      if (estado == false) {
                        tarefa.concluida = true;
                      }else{
                        tarefa.concluida = false;
                      }
                    });
                  },
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tarefa.nome, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                      Text(tarefa.data.toIso8601String())
                    ],
                  )
              ]
            );

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Lista de Tarefas")
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                onSubmitted: adicionarTarefa,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (_, indice) {
                  return getItem(tarefas[indice]);
                },
              )
              )
          ]
        )
      );
  }
}