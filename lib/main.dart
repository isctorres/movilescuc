import 'package:flutter/material.dart';
import 'package:moviles/providers/theme_provider.dart';
import 'package:moviles/screens/dashboard_screen.dart';
import 'package:moviles/screens/despensa_screen.dart';
import 'package:moviles/screens/intenciones_screen.dart';
import 'package:moviles/screens/login_screen.dart';
import 'package:moviles/screens/product_screen.dart';
import 'package:moviles/screens/register_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MatApp(),
    );
  }
}

class MatApp extends StatelessWidget {
  const MatApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: theme.gettheme(),
      routes: {
        '/register' : (context) => const RegisterScreen(),
        '/dash'     : (context) => const DashboardScreen(),
        '/intent'   : (context) => const IntencionesScreen(),
        '/despensa' : (context) => const DespensaScreen(),
        '/add'      : (context) => const ProductScreen() 
      },
      home: LoginScreen(),
    );
  }
}