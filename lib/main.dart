import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sezamiapp/Widgets/widgets_home/botones_wig.dart';
import 'package:sezamiapp/services/user_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'Widgets/widgets_metodos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///Titulo del appBar.
      title: 'SEZAMI Digital',
      theme: ThemeData(primaryColor: Color(0xFF0076a6)),
      home: MyHome(),
    );
  }
}

// ignore: must_be_immutable
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ///Referente a la pantalla inicio, con [appBar] y [banner].
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      ///Elementos de appBar.
      appBar: AppBar(
        elevation: 0.0,
        title: Text('SEZAMI Digital'),
        actions: <Widget>[
          ///Icono presnetado en el appBar.
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Image.asset("images/icons/ic_.png", width: 45),
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          Container(
            height: 175,
            width: size.width,
            margin: EdgeInsets.only(top: 10.0),
            child: FutureBuilder(
              future: UserServices().getBannerMini(),
              builder: (context, snap) {
                ///Mostrando una imagen [('images/banner/cone.png')] diferente si el dispositivo no cuenta con una conexion estable a internet.
                ///
                ///
                if (snap.hasError)
                  return Container(
                      child: Image.asset('images/banner/cone.png'));
                switch (snap.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    break;
                  case ConnectionState.none:
                    return Container(
                        child: Image.asset('images/banner/cone.png'));
                    break;
                  case ConnectionState.done:
                    print('hecho');
                    if (snap.data.isEmpty)
                      return Container(
                          child: Image.asset('images/banner/cone.png'));
                    else
                      return caruselMini(snap.data);
                    break;
                  default:
                    return Container(
                        child: Image.asset('images/banner/cone.png'));
                    break;
                }
              },
            ),
          ),

          ///Para presentar el banner se hace la llamada a la clase de botones_wig.dart
          Expanded(
            child: Container(
              child: MisBotonesHome(),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            height: 40,
            width: size.width,
            color: Color(0xFF605e5f),
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              ///Design footer incluyendo[iconFooter] con herramienta de iconos[FontwesomeIcons].
              children: <Widget>[
                ///IconFooter de web.
                iconFooter(
                    FontAwesomeIcons.globe, 'http://sezami.zacatecas.gob.mx/'),

                ///IconFooter de facebook.
                VerticalDivider(color: Colors.grey[600]),
                iconFooter(
                    FontAwesomeIcons.facebookF, 'http://www.fb.com/sezami'),

                ///IconFooter de twitter.
                VerticalDivider(color: Colors.grey[600]),
                iconFooter(
                    FontAwesomeIcons.twitter, 'http://www.twitter.com/_sezami'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///Describe la configuracion del [iconFooter].
  Widget iconFooter(IconData ico, String url) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.white,
      icon: new Icon(ico),
      onPressed: () {
        customLaunch(url);
      },
    );
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) await launch(command);
  }
}
