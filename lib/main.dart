import 'package:driveway_delivery_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driveway',
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF4952DF),
              dynamicSchemeVariant: DynamicSchemeVariant.fidelity),
          textTheme:
              GoogleFonts.ibmPlexSansTextTheme(Theme.of(context).textTheme),
          useMaterial3: true),
      home: const Nav(),
    );
  }
}
