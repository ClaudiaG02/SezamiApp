import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

///Inicio de clase de Visa
///
///Para la clase de tramites de visa, se usa el widget  listView para presentar la informacion al usuario
class Visa extends StatefulWidget {
  @override
  _VisaState createState() => _VisaState();
}

class _VisaState extends State<Visa> {
  void customLaunch(command) async {
    /// [customLaunch] es requerido para la opcion de abrir y mandar via whatsapp.
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('no se ejecuto $command');
    }
  }

  ///Se incluye el[asset] accediendo en tiempo de ejecución, el cual se implementa mostrando la direccion del recurso a utilizar[actionIcon].
  Image actionIcon = new Image.asset("images/icons/ico18.png",
      width: 40, color: Color(0xff252526));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        ///Titulo del appBar
        title: Text('Trámite de Visa'),

        ///Espacio en el appBar para el icono de Tramites de visa [actionIcon].
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 0.0, left: 0.0, right: 20.0),
            child: actionIcon,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Expanded(
              child: ListView(
                ///Lista  deslizable de elementos [ListView].
                children: <Widget>[
                  ///Para ordenar la informacion se han creado dos [ExpansionTile].
                  ExpansionTile(
                    ///Color de fondo.
                    backgroundColor: Color(0x1D605e5f),

                    ///Titulo.
                    title: Text('Tramites de visa'),

                    ///Expandir la lista de elementos.
                    initiallyExpanded: true,
                    children: <Widget>[
                      ///Al desplegar el ExpansionTile
                      ///
                      ///Muestra tres [ListTile].
                      ///
                      ListTile(
                        subtitle: Text(
                            'Nosotros te ayudamos a realizar la entrevista consular, en el consulado de tu elección.'),
                      ),

                      ///Para el siguiente ListTile, se muestra la infomacion de los requisitos para tramitar la visa
                      ///como [subtitle] muestra la informacion de la calse [Requisitos]
                      ListTile(
                        title: Text('REQUISITOS'),
                        subtitle: Requisitos(),
                      ),

                      ///
                      ListTile(
                        title: Text('NOTA: TODOS LOS SERVICIOS SON GRATUITOS'),
                      ),
                    ],
                  ),

                  ///Segundo ExpansionTile
                  ExpansionTile(
                    backgroundColor: Color(0x1D605e5f),
                    title: Text('Contacto'),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person_pin),
                        title: Text('LAET Fuensanta Santacrúz'),
                      ),

                      ///La informacion que contiene el ExpansionTile de Contacto
                      ///Solo contiene un ListTile.
                      ListTile(
                        leading: new Icon(FontAwesomeIcons.whatsapp),
                        title: Text('Teléfono'),
                        subtitle: Text('+52 1 492 892 2638'),
                        onTap: () {
                          ///Para que el usuario pueda comunicarse mediante via whatsapp, se usa
                          ///[CustomLaunch] o lanzamiento personalizado para que direccione a la mensajeria instantanea de whastapp.
                          customLaunch(
                              "whatsapp://send?phone=+52 1 492 892 2638");
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Inicia clase Requisitos.
///
///Esta clase es requerida para el ExpansionTile de Tramites de Visa, su contenido dentro de un ListTile.
class Requisitos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      ///Dentro del siguiente [children]
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///La informacion se presenta en  Container
        ///
        Container(
            child: Align(

                ///Propiedad para centrar texto [Alignment.centerLeft].
                ///
                alignment: Alignment.centerLeft,
                child: Text('Pasaporte Vigente'))),
        Row(children: <Widget>[
          ///Iniciar un [Divider] para separacion.
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Dirección en Estados Unidos'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Nombre y Teléfono de persona a quien visita'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Fecha de Nacimiento de Padres'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Text('Nombre y dirección del lugar de trabajo o escuela'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Fecha de ingreso al trabajo o escuela'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Ingresos Mensuales'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Fecha tentativa de Viaje'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Correo electrónico y Redes Sociales'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),

        ///
        Container(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'Pago de derechos de entrevista consular(ESTE PAGO SE REALIZA EN EL BANCO), Tendrá que pasar 3 horas después de haber realizado el pago para poder agendar si cita en la SEZAMI.'))),
        Row(children: <Widget>[
          Expanded(child: Divider()),
        ]),
      ],
    );
  }
}
