import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

///Inicia clase FeriaPage.
class FeriaPage extends StatelessWidget {
  const FeriaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ferias binacionales de Servicios'),

        ///Espacio en el appBar para el icono de Ferias binacionales de Servicios [actionIcon].
        ///Se incluye el[asset] accediendo en tiempo de ejecución, el cual se implementa mostrando la direccion del recurso a utilizar[actionIcon].
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 0.0, left: 0.0, right: 20.0),
            child: Image.asset("images/icons/icoFBS_.png",
                width: 40, color: Color(0xff252526)),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
            child: ListView(
              children: <Widget>[
                ///Objeivo del Programa.
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Objetivo del Programa'),
                  initiallyExpanded: true,
                  children: [
                    ListTile(
                      subtitle: Text(
                          'Coordinar y operar las actividades de las ferias binacionales de servicios'),
                    ),
                  ],
                ),

                ///Reglas de Operacion.
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Reglas de Operación'),
                  children: <Widget>[
                    ListTile(
                      title: Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.file_download,
                              color: Colors.lightBlue,
                            ),
                          ),
                          new Expanded(
                            flex: 10,
                            child: InkWell(
                              onTap: () {
                                customLaunch(
                                    'http://sezami.zacatecas.gob.mx/docs/lszm2021.pdf');
                              },
                              child: Text('Descargar',
                                  style: TextStyle(
                                      color: Colors.lightBlue,
                                      decoration: TextDecoration.underline,
                                      fontSize: 14.0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                ///Contacto.
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Contacto'),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person_pin),
                      title: Text('ISC Carlos Eduardo Ríos Valadez'),
                    ),
                    ListTile(
                      leading: new Icon(FontAwesomeIcons.whatsapp),
                      title: Text('Teléfono'),
                      subtitle: Text('+52 492 127 34 88'),
                      onTap: () {
                        customLaunch("whatsapp://send?phone=+524921273488");
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) await launch(command);
  }
}
