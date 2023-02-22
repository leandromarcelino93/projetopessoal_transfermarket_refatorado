import 'package:flutter/material.dart';
import 'package:projetopessoal_transfermarket_refatorado/screens/saved_proposals.dart';
import 'package:projetopessoal_transfermarket_refatorado/utils/app_routes.dart';
import 'screens/home_page.dart';

main() => runApp(const TransfermarketApp());

class TransfermarketApp extends StatefulWidget {
  const TransfermarketApp({Key? key}) : super(key: key);

  @override
  State<TransfermarketApp> createState() => _TransfermarketAppState();
}

class _TransfermarketAppState extends State<TransfermarketApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.teal,
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const MyHomePage(),
        AppRoutes.PROPOSTAS: (ctx) => SavedProposals(),
      },
    );
  }
}
