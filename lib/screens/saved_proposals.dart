import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../models/proposal.dart';
import '../screens/form_screen.dart';

class SavedProposals extends StatefulWidget {
  const SavedProposals({super.key});

  @override
  State<SavedProposals> createState() => _SavedProposalsState();
}

class _SavedProposalsState extends State<SavedProposals> {

  final List<Proposal>_propostas = [];

  _addProposal (String name, double value) {
    final newProposal = Proposal(name: name, valueofplayer: value);
    setState(() {
      _propostas.add(newProposal);
    });
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
          title: const Text('Propostas Salvas'),
        ),
        body: ListView.builder(
          itemCount: _propostas.length,
          itemBuilder: (ctx, index) {
            final pr = _propostas[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              child: ListTile(
                leading: IconButton(onPressed: () {},
                    icon: const Icon(Icons.monetization_on),),
                title: Text(
                  pr.name,
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('R\$ ${pr.valueofplayer.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => FormScreen(_addProposal)
            ),
          );
        },
          child: const Icon(Icons.add),),
      ),
    );
  }
}
