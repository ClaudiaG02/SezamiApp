import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

///Clase  [Mariposa] como muchas de las ventanas, se usaun [ListView] para mostrar la informacion correspondiente.
class Mariposa extends StatelessWidget {
  void customLaunch(command) async {
    ///CanLaunch.
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('no se ejecuto $command');
    }
  }

  ///Se incluye el[asset] accediendo en tiempo de ejecución, el cual se implementa mostrando la direccion del recurso a utilizar[actionIcon].
  Image actionIcon = new Image.asset("images/icons/ico15.png",
      width: 40, color: Color(0xff252526));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mariposa'),

        ///Espacio en el appBar para el icono de Tramites de visa [actionIcon].
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 0.0, left: 0.0, right: 20.0),
            child: actionIcon,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
            ///ListView,Mostrar informacion en lista.
            child: ListView(
              children: <Widget>[
                ///Muestra  [ExpansionTile] con informacion.
                ///
                ///Cuando el usuario seleccione la opcion del tituolo en ExpansioTitle,despliega la informacion correspondiente.
                ///Objetivo del Programa.
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Objetivo del Programa'),
                  initiallyExpanded: true,
                  children: <Widget>[
                    ListTile(
                      subtitle: Obetivoscorazon(),
                    ),
                  ],
                ),

                ///Beneficiarios.
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Beneficiarios'),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Los talleres van dirigidos a personas que atienden a zacatecanos migrantes y sus familias que sean víctimas de violencia doméstica y que soliciten el apoyo para ser asesorados y apoyados sin distinción alguna, particularmente de los estados de la Unión Americana señalados. ',
                        style: TextStyle(fontSize: 13.0),
                      ),
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
                              ///customLaunch Direccionar a un archivo PDF.
                              onTap: () {
                                customLaunch(
                                    'http://sezami.zacatecas.gob.mx/docs/2x1.pdf');
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
                      title: Text('L.E. Miriam Yanil García Rodríguez'),
                    ),
                    ListTile(
                      ///Icono usando FontAwesomeIcons.
                      leading: new Icon(FontAwesomeIcons.whatsapp),
                      title: Text('Teléfono'),
                      subtitle: Text('+52 492 227 98 03'),
                      onTap: () {
                        customLaunch("whatsapp://send?phone=+52 492 227 98 03");
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
}

///Clase Obetivoscorazon referenciada en [linea].
///
/// Linea 49:   Llamada dentro de un ExpansionTile.
///  title: Text('Objetivo del Programa').
class Obetivoscorazon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        ListTile(
          title: Text(
            'Contribuir a hacer frente a la violencia doméstica a la población zacatecana migrante y en especial a la indocumentada, a través de las Organizaciones de Zacatecanos Migrantes con talleres informativos y capacitaciones.',
            textAlign: TextAlign.left,
            style: TextStyle(
                //color: Colors.blueGrey,
                fontSize: 13.0),
          ),
        ),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        ListTile(
          title: Text(
            'Brindar asesoría y una cartera de organizaciones locales que ofrecen ayuda para superar el problema de violencia familiar a las y los migrantes zacatecanos que radican en la Unión Americana.',
            textAlign: TextAlign.left,
            style: TextStyle(
                //color: Colors.blueGrey,
                fontSize: 13.0),
          ),
        ),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        ListTile(
          title: Text(
            'Crear redes de apoyo con instituciones u organizaciones, en caso de presentarse la situación, para recibir el servicio y contar con la debida información.',
            textAlign: TextAlign.left,
            style: TextStyle(
                //color: Colors.blueGrey,
                fontSize: 13.0),
          ),
        ),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),
      ],
    );
  }
}
