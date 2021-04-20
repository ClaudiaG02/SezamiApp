import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sezamiapp/Widgets/widgets_metodos.dart';
import 'package:url_launcher/url_launcher.dart';

///Inicia clase Fam, parecido a cor
class Fam extends StatelessWidget {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('no se ejecuto $command');
    }
  }

  ///Se incluye el[asset] accediendo en tiempo de ejecución, el cual se implementa mostrando la direccion del recurso a utilizar[actionIcon].

  Image actionIcon = new Image.asset("images/icons/ico13.png",
      width: 40, color: Color(0xff252526));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apoyo a Deportados'),

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
            child: ListView(
              children: <Widget>[
                ///Lista  desplegable de elementos [ListView].
                ///
                ///Para ordenar la informacion se han creado dos [ExpansionTile].
                ExpansionTile(
                  ///Color de fondo de ExpansionTile.
                  backgroundColor: Color(0x1D605e5f),

                  ///Titulo.
                  title: Text('Objetivo del Programa'),

                  ///Expandir la lista de elementos.
                  initiallyExpanded: true,

                  ///Llamar a la clase [Obetivoscorazon].
                  children: <Widget>[
                    ListTile(
                      subtitle: Obetivoscorazon(),
                    ),
                  ],
                ),

                //////Muestra  [ExpansionTile] con informacion.
                ///
                ///Cuando el usuario seleccione la opcion del tituolo en ExpansioTitle,despliega la informacion correspondiente.
                ///Requisitos.
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Requisitos'),
                  children: <Widget>[
                    requitoPrograma("Identificación Oficial con Fotografía"),
                    requitoPrograma("Hoja de deportación o repatriación"),
                    requitoPrograma("Comprobante de Domicilio"),
                    requitoPrograma("Acta de Nacimiento"),
                    requitoPrograma("Solicitud de apoyo"),
                    requitoPrograma("CURP"),
                    requitoPrograma("RFC"),
                    ListTile(
                      subtitle: Text(
                        'FAVOR DE TRAER LOS DOCUMENTOS EN EL ORDEN LISTADO',

                        ///Estilo de letra.
                        style: TextStyle(fontSize: 11.0),
                      ),
                      //leading: Icon(Icons.done),
                    ),
                  ],
                ),

                ///Beneficiarios
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Beneficiarios'),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Migrantes deportados en los años 2017, 2018 y 2019',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),

                ///Reglas de Operación
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
                                    'http://sezami.zacatecas.gob.mx/docs/ropazdyex2021.pdf');
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

                ///Contacto
                ExpansionTile(
                  backgroundColor: Color(0x1D605e5f),
                  title: Text('Contacto'),
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.person_pin),
                      title: Text('LAET. Santa Yuri Soto de la torre'),
                    ),
                    ListTile(
                      leading: new Icon(FontAwesomeIcons.whatsapp),
                      title: Text('Teléfono'),
                      subtitle: Text('+52 492 103 03 57'),

                      ///Uso de customLaunch.
                      onTap: () {
                        customLaunch("whatsapp://send?phone=+52 492 103 0357");
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
/// Linea 53:   subtitle: Obetivoscorazon(),
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
            'Contribuir a la reincorporación de los migrantes zacatecanos deportados en la vida social y productiva en sus comunidades a través de apoyos económicos para su traslado o el desarrollo de proyectos productivos.',
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
            'Apoyar a los trabajadores zacatecanos migrantes deportados o repatriados a instalar un proyecto productivo en esta Entidad con el fin de que generen ingresos.',
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
            'Apoyar a los zacatecanos migrantes que son deportados a regresar a su lugar de origen.',
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
