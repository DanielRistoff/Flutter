import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Menu { itemLigth, itemDark }

class _MyAppState extends State<MyApp> {
  String tema = "Light";
  var temaData = ThemeData.light();
  @override
  void initState() {
    super.initState();
    loadTema();
  }

  setTema(Theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      tema = Theme;
      temaData = Theme == "Dark" ? ThemeData.dark() : ThemeData.light();
      prefs.setString("tema", tema);
    });
  }

  loadTema() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tema = prefs.getString("tema") ?? "Ligth";
      temaData = tema == "Dark" ? ThemeData.dark() : ThemeData.light();
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: temaData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SharedPreferences",
          ),
          centerTitle: true,
          actions: <Widget>[
            // This button presents popup menu items.
            PopupMenuButton<Menu>(
                // Callback that sets the selected popup menu item.
                onSelected: (Menu item) {
                  if (item == Menu.itemLigth) {
                    setTema("Ligth");
                  } else {
                    setTema("Dark");
                  }
                },
                initialValue: tema == "Ligth" ? Menu.itemLigth : Menu.itemDark,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem<Menu>(
                        enabled: false,
                        child: Text('Configurar Tema'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemLigth,
                        child: Text('Ligth'),
                      ),
                      const PopupMenuItem<Menu>(
                        value: Menu.itemDark,
                        child: Text('Dark'),
                      ),
                    ])
          ],
        ),
      ),
    );
  }
}
