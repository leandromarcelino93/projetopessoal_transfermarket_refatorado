import 'package:flutter/material.dart';
import '../screens/home_page.dart';

class FormScreen extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const FormScreen(this.onSubmit, {super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueofplayerController =
      TextEditingController();

  _submitForm() {
    final title = _nameController.text;
    final value = double.tryParse(_valueofplayerController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
      //validação dos dados digitados pelo usuário
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (_) {
                    return const MyHomePage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Faça Sua Proposta'),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            height: 620,
            width: 350,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextField(
                    controller: _nameController,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Nome do Jogador',
                      hintText: 'Digite o nome do jogador',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _valueofplayerController,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      labelText: 'Valor da Proposta',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(_submitForm());
                  },
                  child: const Text('Enviar Proposta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Faça Sua Proposta'),
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            height: 570,
            width: 350,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: TextFormField(
                    controller: _nameofplayerController,
                    validator: (String? value){
                      if(value != null && value.isEmpty){
                        return 'Insira o nome do jogador';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w400, ),
                    decoration: const InputDecoration(
                      labelText: 'Nome do Jogador',
                      hintText: 'Digite o nome do jogador',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value){
                      if(value != null && value.isEmpty){
                        return 'Insira um valor para proposta';
                      }
                      return null;
                    },
                    controller: _valueofplayerController,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      labelText: 'Valor da Proposta',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Enviar Proposta'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
 */
