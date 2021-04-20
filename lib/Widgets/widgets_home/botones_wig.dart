import 'package:flutter/material.dart';
import 'package:sezamiapp/Widgets/Servicios/visa_wid.dart';
import 'package:sezamiapp/Widgets/Servicios/wid_asesoria.dart';
import 'package:sezamiapp/Widgets/Servicios/wid_localizacion.dart';
import 'package:sezamiapp/Widgets/calendario/calendario_wid.dart';
import 'package:sezamiapp/Widgets/widget_directorio/SEZAMI_wid.dart';
import 'package:sezamiapp/Widgets/widget_directorio/federaciomes_wid.dart';
import 'package:sezamiapp/Widgets/widget_directorio/representaciones_wid.dart';

import 'package:sezamiapp/Widgets/widgets_programas/2x1_wid.dart';
import 'package:sezamiapp/Widgets/widgets_programas/apostilla_page.dart';
import 'package:sezamiapp/Widgets/widgets_programas/corazonplata_wig.dart';
import 'package:sezamiapp/Widgets/widgets_programas/exbraceros_wid.dart';
import 'package:sezamiapp/Widgets/widgets_programas/feria_page.dart';
import 'package:sezamiapp/Widgets/widgets_programas/mariposa_wig.dart';
import 'package:sezamiapp/Widgets/widgets_programas/wid_fam.dart';

import 'package:sezamiapp/Widgets/widgets_programas/wid_traslados.dart';

///Inicia clase [MisBotonesHome].
///
///La pantalla principal cuenta con varios componentes  o widgets que hacen que tenga un diseño unico
/// y que ademas cuente con funcionalidades que ayuden de cierta manera al usuario al otener infomracion, Teniendo como objetivo
/// ofrecer al usuario una aplicacion en la cual puede obener informacion un poco mas detallada
/// sobre SEZAM con respecto a la interfaz de usuario, es decir, el espacio de interacciones
/// entre el usuario y la aplicacion movil SEZAMI Digital.
/// La siguiente clase incluye los botones principales para acceder a las diversas funcionalidades.
class MisBotonesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return new Column(
      children: <Widget>[
        new Expanded(
          child: Row(
            children: <Widget>[
              new Expanded(
                child: InkWell(
                  onTap: () => {
                    showModalBottomSheet(
                        elevation: (queryData.size.height) * 0.8,
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                        //shape:
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return BotonesDirectorio();
                        }),
                  },

                  ///Boton de dire
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 4.0, left: 8.0, right: 4.0),
                    child: Container(
                      color: Color(0xFF00bec1),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: (queryData.size.width) * 0.35,
                              //color: Colors.purple,
                              child: Image.asset('images/icons/icodire.png'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: new Container(
                              //color: Colors.orange,
                              child: new Center(
                                child: Container(
                                  width: (queryData.size.width) * 0.40,
                                  height: (queryData.size.height) * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: Center(
                                    child: Text(
                                      'Directorio',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFF262626),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// Boton Programas
              new Expanded(
                child: InkWell(
                  onTap: () => {
                    showModalBottomSheet(
                        elevation: (queryData.size.height) * 0.8,
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                        //shape:
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return BotonesProgramas();
                        }),
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, bottom: 4.0, left: 4.0, right: 8.0),
                    child: Container(
                      color: Color(0xFF00bec1),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: (queryData.size.width) * 0.30,
                              child: Image.asset('images/icons/icoprog.png'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: new Container(
                              //color: Colors.orange,
                              child: new Center(
                                child: Container(
                                  width: (queryData.size.width) * 0.40,
                                  height: (queryData.size.height) * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: Center(
                                    child: Text(
                                      'Programas',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFF262626),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        ///Boton Servicios
        new Expanded(
          child: Row(
            children: <Widget>[
              new Expanded(
                child: InkWell(
                  onTap: () => {
                    showModalBottomSheet(
                        elevation: (queryData.size.height) * 0.8,
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                        //shape:
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Botonesservicios();
                        }),
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 8.0, left: 8.0, right: 4.0),
                    child: Container(
                      color: Color(0xFF00bec1),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: (queryData.size.width) * 0.35,
                              //color: Colors.purple,
                              child: Image.asset('images/icons/icosev.png'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: new Container(
                              //color: Colors.orange,
                              child: new Center(
                                child: Container(
                                  width: (queryData.size.width) * 0.40,
                                  height: (queryData.size.height) * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(18.0)),
                                  child: Center(
                                    child: Text(
                                      'Servicios',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFF262626),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///Boton Calendario
              new Expanded(
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Calendario(),
                      ),
                    ),
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 8.0, left: 4.0, right: 8.0),
                    child: Container(
                      color: Color(0xFF00bec1),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: (queryData.size.width) * 0.30,
                              child: Image.asset('images/icons/icocal.png'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: new Container(
                              //color: Colors.orange,
                              child: new Center(
                                child: Container(
                                  width: (queryData.size.width) * 0.40,
                                  height: (queryData.size.height) * 0.05,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  child: Center(
                                    child: Text(
                                      'Calendario',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xFF262626),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

///Mostrando la informacion ordenada, al seleccionar el boton muestra la lista de funcionalidades
///
///Asesoria Migratoria, Tramites de Visa y Locaizacion de Personas, la opcion que el usuario elija lo direcciona a una nueva
///ventana con la inf correspondiente.
///Se presentan las clases de cada boton con sus respectivas opciones.
///Clase de [Botonesservicios] se codifica el diseño que tendran los botones.
class Botonesservicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFFffffff),
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: queryData.size.width,
      height: (queryData.size.height) * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: new InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Asesoria(),
                  ),
                ),
              },

              ///Texto dentro del boton
              child: Container(
                width: (queryData.size.width) * 0.90,
                height: (queryData.size.height) * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),

                ///Se presenta a continuacion,las caracteristicas de la opcion de Asesoria
                child: Row(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.20,
                      child: Center(
                        child: Container(
                          width: (queryData.size.width) * 0.20,
                          height: (queryData.size.height) * 0.06,
                          child: Image(
                            image: AssetImage("images/icons/ico17.png"),
                            color: Color(0xFF005F66),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.60,
                      height: (queryData.size.height) * 0.08,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            new Container(
                              height: (queryData.size.height) * 0.06,
                              child: VerticalDivider(
                                color: Colors.blueGrey,
                              ),
                            ),
                            new Container(
                              child: Text(
                                "Asesoría Migratoria",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.1,
                      height: (queryData.size.height) * 0.08,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          ///Opcion de Tramites de Visa
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: new InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Visa(),
                  ),
                ),
              },
              child: Container(
                width: (queryData.size.width) * 0.90,
                height: (queryData.size.height) * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.20,
                      child: Center(
                        child: Container(
                          width: (queryData.size.width) * 0.20,
                          height: (queryData.size.height) * 0.06,
                          child: Image(
                            image: AssetImage("images/icons/ico18.png"),
                            color: Color(0xFFD67500),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.60,
                      height: (queryData.size.height) * 0.08,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            new Container(
                              height: (queryData.size.height) * 0.06,
                              child: VerticalDivider(
                                color: Colors.blueGrey,
                              ),
                            ),
                            new Container(
                              child: Text(
                                "Tramite de VISA",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.1,
                      height: (queryData.size.height) * 0.08,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          ///Opcion de Localizacion de Personas
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: new InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Localizacion(),
                  ),
                ),
              },
              child: Container(
                width: (queryData.size.width) * 0.90,
                height: (queryData.size.height) * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.20,
                      child: Center(
                        child: Container(
                          width: (queryData.size.width) * 0.20,
                          height: (queryData.size.height) * 0.06,
                          child: Image(
                            image: AssetImage("images/icons/ico16.png"),
                            color: Color(0xFF00709E),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.60,
                      height: (queryData.size.height) * 0.08,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            new Container(
                              height: (queryData.size.height) * 0.06,
                              child: VerticalDivider(
                                color: Colors.blueGrey,
                              ),
                            ),
                            new Container(
                              child: Text(
                                "Localización de Personas",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.1,
                      height: (queryData.size.height) * 0.08,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///Para el boton de Directorio.
class BotonesDirectorio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: queryData.size.width,
      height: (queryData.size.height) * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ///Opcion de Directorio de SEZAMI
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: new InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,

                  ///Una vez Pulsando la opcion nos direcciona a la ventana de SEZAMI
                  MaterialPageRoute(
                    builder: (context) => Sezami(),
                  ),
                ),
              },
              child: Container(
                width: (queryData.size.width) * 0.90,
                height: (queryData.size.height) * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.20,
                      child: Center(
                        child: Container(
                          width: (queryData.size.width) * 0.20,
                          height: (queryData.size.height) * 0.06,
                          child: Image(
                            image: AssetImage("images/icons/ico21.png"),
                            color: Color(0xFF008849),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.60,
                      height: (queryData.size.height) * 0.08,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            new Container(
                              height: (queryData.size.height) * 0.06,
                              child: VerticalDivider(
                                color: Colors.blueGrey,
                              ),
                            ),
                            new Container(
                              child: Text(
                                "SEZAMI",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.1,
                      height: (queryData.size.height) * 0.08,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          /// Opcion de directorios de Federaciones
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: new InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,

                  ///Una vez Pulsando la opcion nos direcciona a la ventana de Federaciones
                  MaterialPageRoute(
                    builder: (context) => Federaciones(),
                  ),
                ),
              },
              child: Container(
                ///Diseño de caja.
                width: (queryData.size.width) * 0.90,
                height: (queryData.size.height) * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    new Container(
                      ///Decoracion incluyendo imagen.
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.20,
                      child: Center(
                        child: Container(
                          width: (queryData.size.width) * 0.20,
                          height: (queryData.size.height) * 0.06,
                          child: Image(
                            image: AssetImage("images/icons/ico22.png"),
                            color: Color(0xFF005B9F),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.60,
                      height: (queryData.size.height) * 0.08,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            ///Division entre imagen y texto de opcion dentro de caja.
                            new Container(
                              height: (queryData.size.height) * 0.06,
                              child: VerticalDivider(
                                color: Colors.blueGrey,
                              ),
                            ),

                            ///Texto y caracteristicas
                            new Container(
                              child: Text(
                                "Federaciones",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.1,
                      height: (queryData.size.height) * 0.08,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          ///Opcion de directorios de Representaciones.
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: new InkWell(
              onTap: () => {
                Navigator.pop(context),
                Navigator.push(
                  context,

                  ///Al seleccionar la opcion se direccionas al a ventana de Reprsentaciones.
                  MaterialPageRoute(
                    builder: (context) => Representaciones(),
                  ),
                ),
              },
              child: Container(
                width: (queryData.size.width) * 0.90,
                height: (queryData.size.height) * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.20,
                      child: Center(
                        child: Container(
                          width: (queryData.size.width) * 0.20,
                          height: (queryData.size.height) * 0.06,
                          child: Image(
                            image: AssetImage("images/icons/ico20.png"),
                            color: Color(0xFF009C49),
                          ),
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.60,
                      height: (queryData.size.height) * 0.08,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            new Container(
                              height: (queryData.size.height) * 0.06,
                              child: VerticalDivider(
                                color: Colors.blueGrey,
                              ),
                            ),
                            new Container(
                              child: Text(
                                "Representaciones",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      width: (queryData.size.width) * 0.1,
                      height: (queryData.size.height) * 0.08,
                      child: Icon(
                        Icons.chevron_right,
                        size: 40.0,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///Clase del boton de Programas
class BotonesProgramas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      width: queryData.size.width, // height: (queryData.size.height) * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ///Acontinuacion se presenta todas las opciones existentes dentro del boton de Programas
          ///
          ///y al seleccionar cada una de las opcionesse direcciona a las ventanas correspondientes.
          ///Opcion Ferias binacionales de Servicios.
          botonesOpciones(
            context,
            Color(0xFFFE8510),
            'icoFBS_.png',
            'Ferias binacionales de Servicios',
            MaterialPageRoute(builder: (context) => FeriaPage()),
          ),

          ///Opcion Corazon de Plata.
          botonesOpciones(
            context,
            Color(0xFF006CAB),
            'ico10.png',
            'Corazón de Plata',
            MaterialPageRoute(builder: (context) => Corazon()),
          ),

          ///Opcion Mariposa.
          botonesOpciones(
            context,
            Color(0xFFC85C06),
            'ico15.png',
            'Mariposa',
            MaterialPageRoute(builder: (context) => Mariposa()),
          ),

          ///Opcion Apoyo a Deportados.
          botonesOpciones(
            context,
            Color(0xFFBD8F00),
            'ico13.png',
            'Apoyo a Deportados',
            MaterialPageRoute(builder: (context) => Fam()),
          ),

          ///Opcion 2x1.
          botonesOpciones(
            context,
            Color(0xFF8B9020),
            'ico11.png',
            '2x1',
            MaterialPageRoute(builder: (context) => DosporUno()),
          ),

          ///Opcion Exbraceros.
          botonesOpciones(
            context,
            Color(0xFF005DFB),
            'ico12.png',
            'Exbraceros',
            MaterialPageRoute(builder: (context) => Exbraceros()),
          ),

          ///Opcion deTraslados.
          botonesOpciones(
            context,
            Color(0xFF454545),
            'ico14.png',
            'Traslados',
            MaterialPageRoute(builder: (context) => Traslados()),
          ),

          ///Opcion  de Apostilla de Documentos Americanos.
          botonesOpciones(
            context,
            Color(0xFFD2A700),
            'icoestrella.png',
            'Apostilla de Documentos Americanos',
            MaterialPageRoute(builder: (context) => ApostillaPage()),
          ),
        ],
      ),
    );
  }

  ///Caracteristicas de la lista de opciones  del boton de Programas.
  Widget botonesOpciones(BuildContext context, Color col, String img,
      String label, MaterialPageRoute materialPageRoute) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => {
        Navigator.pop(context),
        Navigator.push(context, materialPageRoute),
      },
      child: Container(
        width: size.width * 0.90,
        height: 55,
        margin: const EdgeInsets.symmetric(vertical: 3.0),
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              padding: EdgeInsets.all(4.0),
              child: Image(
                image: AssetImage("images/icons/$img"),
                color: col,
              ),
            ),
            VerticalDivider(color: Colors.grey[300]),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.blueGrey, fontSize: 16.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Icon(
                Icons.chevron_right,
                size: 30.0,
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
