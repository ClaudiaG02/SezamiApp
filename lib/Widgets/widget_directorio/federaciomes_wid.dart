import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

///Inicia clase Federaciones
///
//////Muestra direcciones de los contactos de federaciones, es parecido a federaciones y SEZAMI,
///ya que las tres tienen como objetivo mostrar al usuario una ista de direcciones de los contactos.

class Federaciones extends StatelessWidget {
  void customLaunch(command) async {
    /// [customLaunch] es requerido para la opcion de mandar via whatsapp.
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('no se ejecuto $command');
    }
  }

  ///Se incluye el[asset] accediendo en tiempo de ejecución, el cual se implementa mostrando la direccion del recurso a utilizar[actionIcon].
  Image actionIcon = new Image.asset("images/icons/ico22.png",
      width: 40, color: Color(0xff252526));
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        ///Titulo del appBar
        title: Text('Federaciones'),
        actions: <Widget>[
          Padding(
            ///Espacio en el appBar para el icono de Tramites de visa [actionIcon].
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 0.0, left: 0.0, right: 20.0),
            child: actionIcon,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(
              child: Container(
                //color: Colors.lightGreen,
                width: MediaQuery.of(context).size.width,

                ///Para mostrar la informacion de Firebase, se usa StreamBuilder
                /// El StreamBuilder recibe eventos y crea un Widget.
                child: StreamBuilder(
                  ///El estado que arroja el stream  es una collecion ('directorio_federaciones') de firebase
                  stream: Firestore.instance
                      .collection('directorio_federaciones')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    List<DocumentSnapshot> docs = snapshot.data.documents;
                    docs.sort((a, b) {
                      return a['federacion']
                          .toLowerCase()
                          .compareTo(b['federacion'].toLowerCase());
                    });

                    ///La informacion que contienen los campos de los documentos se presentan en el widget ListView
                    ///El constructor builder() construye una lista de elementos.
                    return ListView.builder(
                      /// El constructor builder() toma dos parámetros:
                      ///
                      /// itemCount para el numero de elementos.
                      itemCount: (docs.length),

                      /// itemBuilder para construir cada elemento de la lista.
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = docs[index].data;

                        return ExpansionTile(
                          backgroundColor: Color(0x1D605e5f),
                          title: Text(
                            data['federacion'],
                            style: TextStyle(
                                color: Color(0xFF262626),
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(data['nombre']),
                          children: <Widget>[
                            ///Al deplegar el ExpansionTile se muestra la informacion de: puesto, correo,
                            ///direccio y numero telefonico.
                            new ListTile(
                              leading: Icon(Icons.people),
                              title: Text(data['puesto']),
                            ),
                            if (data['correo'] != null)

                              ///Si en Firebase el campo de correo no esta vacio,
                              ///Entonces muestra el correo correspondiente.
                              ListTile(
                                leading: Icon(Icons.mail),
                                title: Text(data['correo']),

                                ///Ademas se usa nuevamente en [CustomLaunch] o lanzamiento personalizado,
                                ///Para abrir y mandar correo electronico al correto que esta almacenado den el campo.
                                onTap: () {
                                  customLaunch('mailto:' +
                                      data['correo'] +
                                      '?subject=Asunto: ');
                                },
                              ),
                            if (data['correo1'] != null)
                              ListTile(
                                leading: Icon(Icons.mail),
                                title: Text(data['correo1']),
                                onTap: () {
                                  customLaunch('mailto:' +
                                      data['correo1'] +
                                      '?subject=Asunto: ');
                                },
                              ),
                            if (data['direccion'] != null)

                              ///Si el campo de direccion nosta vacio en el campo de la coleccion,
                              ///Entonces al seleccionar el ListTile de direccion, mediante customLaunch
                              ///abre en automatico GoogleMaps y busca la direccion almacenada en la coleccion.
                              ListTile(
                                leading: Icon(Icons.pin_drop),
                                title: Text(data['direccion']),
                                onTap: () {
                                  var dire = data['direccion'];
                                  var direurl = dire.replaceAll(" ", "+");
                                  customLaunch(
                                      'https://www.google.com/maps/search/?api=1&query=$direurl&z=20&q=32.534916,-117.017154');
                                },
                              ),

                            ///Ademas de tener u telefono tambien es celular dentro del campo de la coleccion,
                            ///
                            if (data['celular'] != null)
                              ListTile(
                                ///Al desplegar el ListTile de celular de algun contacto
                                ///
                                ///Da una opcion para poder guardar el numero en el telefono
                                ///La clase de BotomModal es requerida.
                                leading: Icon(Icons.phone_iphone),
                                title: Text(data['celular']),
                                onTap: () => {
                                  showModalBottomSheet(
                                      elevation: (queryData.size.height) * 0.6,
                                      backgroundColor:
                                          Color.fromRGBO(0, 0, 0, 0),
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        var phone = data['celular'];
                                        return BotomModal(data: phone);
                                      }),
                                },
                              ),
                            if (data['celular1'] != null)
                              ListTile(
                                leading: Icon(Icons.phone_iphone),
                                title: Text(data['celular1']),
                                onTap: () => {
                                  showModalBottomSheet(
                                      elevation: (queryData.size.height) * 0.6,
                                      backgroundColor:
                                          Color.fromRGBO(0, 0, 0, 0),
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        var phone = data['celular1'];
                                        return BotomModal(data: phone);
                                      }),
                                },
                              ),
                            if (data['oficina'] != null)
                              ListTile(
                                leading: Icon(Icons.phone),
                                title: Text(data['oficina']),
                                onTap: () {
                                  customLaunch('tel:' + data['oficina']);
                                },
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Clase BotomModal requerida en ListTile de celular
class BotomModal extends StatelessWidget {
  ///CustomLaunch permite abrir y ejecutar e proceso.
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('no se ejecuto $command');
    }
  }

  final data;
  BotomModal({this.data});
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFffffff),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: queryData.size.width,
      height: (queryData.size.height) * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: Container(
              width: (queryData.size.width) * 0.80,
              child: Column(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: Container(
                      height: (queryData.size.height) * 0.08,
                      child: Center(
                        child: Text(
                          'Abrir con...',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 3,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          new Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  new Expanded(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () {
                                        customLaunch(
                                            "whatsapp://send?phone=$data");
                                      },
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.whatsappSquare,
                                          size: 60.0,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),

                                  ///WhatsApp
                                  new Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Center(
                                        child: Text('WhatsApp'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ///Telefono
                          new Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  new Expanded(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () {
                                        customLaunch("tel:$data");
                                      },
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.phoneSquare,
                                          size: 60.0,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Center(
                                        child: Text('Teléfono'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ///SMS
                          new Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  new Expanded(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () {
                                        customLaunch("sms:$data");
                                      },
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.sms,
                                          size: 60.0,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ),
                                  new Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Center(
                                        child: Text('SMS'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///Boton Cancelar y salir de las opciones.
          Container(
            height: (queryData.size.height) * 0.1,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: (queryData.size.width) * 0.70,
                  height: (queryData.size.height) * 0.06,
                  decoration: BoxDecoration(
                      color: Color(0x1D605e5f),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                    child: Text('Cancelar'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
