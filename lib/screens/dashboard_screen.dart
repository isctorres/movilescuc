import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:moviles/providers/theme_provider.dart';
import 'package:moviles/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {

    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gimnasio Pokemon'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset('assets/pokemon.png'),
              accountName: const Text('Rubén Torres Frias'), 
              accountEmail: const Text('ruben.torres@unicuc.mx')
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/intent'),
              leading: const Icon(Icons.phone),
              title: const Text('Intenciones'),
              subtitle: const Text('Web/SMS/Phone/Email/Photo'),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/despensa'),
              leading: const Icon(Icons.production_quantity_limits),
              title: const Text('despensApp'),
              subtitle: const Text('Mis compras'),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/movies'),
              leading: const Icon(Icons.movie),
              title: const Text('Movies App'),
              subtitle: const Text('Peliculas más populares'),
              trailing: const Icon(Icons.chevron_right),
            ),
            const ListTile(
              leading: Icon(Icons.close),
              title: Text('Cerrar Sesión'),
              subtitle: Text('Salir de la aplicación'),
              trailing: Icon(Icons.chevron_right),
            ),
            DayNightSwitcher(
              isDarkModeEnabled: isDarkModeEnabled, 
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled 
                ? theme.settheme(StylesSettings.darkTheme())
                : theme.settheme(StylesSettings.lightTheme());

                this.isDarkModeEnabled = isDarkModeEnabled;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}