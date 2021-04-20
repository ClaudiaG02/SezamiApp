import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///Inicia clase Asesoria
class Asesoria extends StatefulWidget {
  @override
  _AsesoriaState createState() => _AsesoriaState();
}

class _AsesoriaState extends State<Asesoria> {
  ///Creacion de [TextEditingController].
  ///
  /// TextEditingController para editar campo de texto
  TextEditingController nombre;
  TextEditingController direccion;
  TextEditingController tel;
  TextEditingController correo;
  TextEditingController asesoria;

  @override
  void initState() {
    ///Declaracion de variables: nombre, direccion, tel,correo,asesoria.
    ///
    ///Igualar las variables a TextEditingController correspondiente.
    ///Para luego ser notificados cuando el texto cambia, para  escuchar al controlador se usa el método addListener.
    nombre = TextEditingController();
    direccion = TextEditingController();
    tel = TextEditingController();
    correo = TextEditingController();
    asesoria = TextEditingController();
    super.initState();
  }

  ///[_scaffoldKey] obtiene el valor de [GlobalKey].
  ///
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ///Se incluye el[asset] accediendo en tiempo de ejecución, el cual se implementa mostrando la direccion del recurso a utilizar[actionIcon]
  Image actionIcon = new Image.asset("images/icons/ico17.png",
      width: 40, color: Color(0xff252526));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        ///Texto de appBar de la pantalla.
        title: Text('Asesoría Migratoría'),
        actions: <Widget>[
          Padding(
            ///Espacio para el icono del widget de asesoria [actionIcon].
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 0.0, left: 0.0, right: 20.0),
            child: actionIcon,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
            flex: 9,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: new Container(
                  //color: Colors.blueGrey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Color(0xFF0076a6),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                                child: Text(
                              'Rellene los Siguientes Campos',
                              style: TextStyle(
                                color: Color(0xFF0076a6),
                              ),
                            )),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xFF0076a6),
                            ),
                          ),
                        ]),
                      ),

                      ///La aplicacion permite al usuario ingresar algunos datos que ingresara en [controller]
                      ///En la linea 107 [controller: nombre] suministra el TextEditingController a un TextField
                      ///Para que tenga funcionamiento, el TextEditingController debe estar aplicado a un TextField.
                      ///Entonces se puede empezar a escuchar los cambios en el campo de texto con el meodo addListener.
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextFormField(
                          controller: nombre,
                          maxLength: 45,
                          decoration: InputDecoration(
                            labelText: 'Nombre:',
                            filled: true,
                            prefixIcon: Icon(Icons.account_circle),
                          ),
                        ),
                      ),

                      /// [controller: direccion] suministra el TextEditingController a un TextField
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          controller: direccion,
                          maxLength: 60,
                          decoration: InputDecoration(
                            labelText: 'Dirección:',
                            //icon: Icon(Icons.account_circle),
                            filled: true,
                            prefixIcon: Icon(Icons.location_on),
                          ),
                        ),
                      ),

                      /// [controller: tel] suministra el TextEditingController a un TextField
                      TextField(
                        controller: tel,
                        maxLength: 10,
                        decoration: InputDecoration(
                            labelText: 'Telefono:',
                            filled: true,
                            prefixIcon: Icon(Icons.phone)),
                        keyboardType: TextInputType.phone,
                        onSubmitted: (String textfinal) {},
                      ),

                      /// [controller: correo] suministra el TextEditingController a un TextField
                      TextField(
                        controller: correo,
                        decoration: InputDecoration(
                            labelText: 'Email:',
                            filled: true,
                            prefixIcon: Icon(Icons.email)),
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (String textfinal) {},
                      ),

                      /// [controller: asesoria] suministra el TextEditingController a un TextField
                      TextField(
                        controller: asesoria,
                        maxLines: 10,
                        decoration: InputDecoration(
                            hoverColor: Colors.orange[800],
                            labelText: 'Asesoría ó Consulta:',
                            filled: true,
                            prefixIcon: Icon(Icons.receipt)),
                        keyboardType: TextInputType.text,
                        onSubmitted: (String textfinal) {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            ///Opciones para comunicarse via whastapp.
            flex: 2,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              if (validar()) {
                                ///Si el usuario ingresa los datos correctos y completos, al seleccionar la opcion de whastapp.
                                ///direcciona a la mensajeria con los datos proporcionados dentro de un mensaje automatizado
                                ///Para que los datos aparezcan dentro del mensaje se usa la concatenacion de objetos o datos
                                String n = nombre.text.toUpperCase();
                                String d = direccion.text.toUpperCase();
                                String t = tel.text;
                                String c = correo.text.toLowerCase();
                                String ase = asesoria.text.toLowerCase();
                                String msj = '''
                                      Hola, LAET Fuensanta Santacrúz.\n ------------------ \n Consulta de Asesoria Migratoria Desde Sezami Digital Móvil.\n \nDatos:\n * $n,\n * $d,\n * $t,\n * $c,\n\nNecesito Asesoría hacerca de:\n$ase \n\n Gracias.                                      
                                      ''';

                                ///Para que se sea posible se usa el plugin de  [FlutterOpenWhatsapp] para abrir WhatsApp y enviar un mensaje a un solo número telefonico.
                                FlutterOpenWhatsapp.sendSingleMessage(
                                    " +52 1 492 892 2638", "$msj");
                              }
                            },

                            ///Diseño del boton para la opcion de comunicacion mediante whastapp.
                            child: Container(
                              color: Color(0xff02ca53),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Text(''),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.whatsapp,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Enviar Solicitud',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),

                    ///  ///Opciones para comunicarse por correo electronico.
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () async {
                              if (validar()) {
                                ///Si el usuario ingresa los datos correctos y completos, al seleccionar la opcion de correo electronico.
                                String n = nombre.text.toUpperCase();
                                String d = direccion.text.toUpperCase();
                                String t = tel.text;
                                String c = correo.text.toLowerCase();
                                String ase = asesoria.text.toLowerCase();
                                String msj =
                                    '''Hola, LAET Fuensanta Santacrúz.\n ------------------ \n Consulta de Asesoria Migratoria Desde Sezami Digital Móvil.\n \nDatos:\n * $n,\n * $d,\n * $t,\n * $c,\n\nNecesito Asesoría acerca de:\n$ase \n\n De Antemano, Gracias.''';
                                final Email email = Email(
                                  body: msj,
                                  subject:
                                      'Asesoría Migratoria de Sezami Digital Movil',
                                  recipients: ['laetfuensanta@hotmail.com'],
                                  cc: [
                                    ///Correos determinados a enviar.
                                    'sezami.zac@gmail.com',
                                    'sezamiapp@gmail.com'
                                  ],
                                );

                                ///[FlutterEmailSender]Permite enviar correos electrónicos desde la aplicacion Flutter.
                                await FlutterEmailSender.send(email);
                              }
                            },
                            //////Diseño del boton para la opcion de comunicacion mediante whastapp.
                            child: Container(
                              color: Color(0xfff60027),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Text(''),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Center(
                                        child: Icon(
                                          FontAwesomeIcons.envelope,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Enviar Solicitud',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  /// [validar].
  validar() {
    ///Declaracion de varibles para el metodo [validar].
    var _final = true;
    var _e = [];

    ///Se usa la estructura de control if-else, ya que permite que se ejecute la instruccion
    ///cuando se cumple una condición y otra instruccion cuando no se cumple.
    ///Las siguientes lineas de codigo indica que si el usuario deja los campos de texto vacios,
    ///La variable [_final] tomara el valor de false
    ///Al final le aparece un texto en donde se requiere que debe ingresar datos en los campos.
    if (nombre.text.isEmpty) {
      _e.add('Nombre es Requerido.');
      _final = false;
    }
    if (direccion.text.isEmpty) {
      _e.add('Dirección es Requerido.');
      _final = false;
    }

    if (tel.text.isEmpty) {
      _e.add('Télefono es Requerido.');
      _final = false;
    }

    if (correo.text.isNotEmpty) {
      ///Si el usuario ingresa un correo electronico invalido, se toma como un vacio.
      ///[_final] da false.
      RegExp regExp = new RegExp(r'^[^@]+@[^@]+\.[^@]+');

      ///Si el usuario ha ingresado un correo invalido, le muestra la alerta de [ content: Text('Ingrese un Correo Electronico Valido.')].
      if (!regExp.hasMatch(correo.toString())) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Ingrese un Correo Electronico Valido.'),
          duration: Duration(milliseconds: 1500),
          backgroundColor: Color(0xffd1495b),
        ));
        _final = false;
      }
    }
    if (asesoria.text.isEmpty) {
      _e.add('Consulta vacía.');
      _final = false;
    }

    ///Al final de la sentencia se imprime lo que la variable [_final] ha almacenado.
    print(_final);
    if (_final) {
      ///Si la variable [_final] devuelve true, entonces el usuario ha ingresado correctamene los datos en los campos de texto.
      return true;
    } else {
      ///En caso contrario si la variable [_final] arroja false, de los campos vacios, entonces regresa [_displaySnackBar].
      ///
      ///[_displaySnackBar] dispara o arroja la variable [_e] la cual ha almacenado la alerta de ('Télefono es Requerido.').
      return _displaySnackBar(context, _e);
    }
  }

  ///  [_displaySnackBar] Contiene el tiempo de duracion de cada alerta, el color, asi como el contenido.
  _displaySnackBar(BuildContext context, List a) {
    for (int i = 0; i <= a.length; i++) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(a[i]),
        duration: Duration(milliseconds: 750),
        backgroundColor: Color(0xffd1495b),
      ));
    }
  }
}
