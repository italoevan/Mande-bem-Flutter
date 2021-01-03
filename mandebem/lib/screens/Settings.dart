import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SharedPreferences prefs;
  bool ativo;
  bool aparecerAlert = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    preferencesc().then((value) {
      aparecerAlert = value;
      ativo = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações"), centerTitle: true),
      body: Column(
        children: [
          ListTile(
            title: Text("Ativar/Desativar dicas"),
            leading: Icon(Icons.lightbulb),
            trailing: FutureBuilder(
                future: preferencesc(),
                builder: (context, snapshot) {
                  return Checkbox(
                    value: aparecerAlert,
                    onChanged: (value) {
                      setState(() {
                        aparecerAlert = value;
                        ativo = value;
                      });
                      final i = prefs.getBool('exibirDialog') ?? null;
                      prefs.setBool('exibirDialog', !i);
                    },
                  );
                }),
            
          )
        ],
      ),
    );
  }

  Future<bool> preferencesc() async {
    prefs = await SharedPreferences.getInstance();
    final ativo = prefs.getBool('exibirDialog') ?? true;
    return ativo;
  }
}
