import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

///Clase [userServices], da funcionamiento al banner en pantalla de inicio.
class UserServices {
  final Firestore _db = Firestore.instance;

  /// Funcion [getBannerBig].
  ///
  /// Agregando la palabra clave [async] para decir que usaremos [await].
  /// Con [await] se podra llamar a [_db.collection('banner_grande')].
  Future getBannerBig() async {
    ///Utilizamos un bloque [try] el cual dentro contiene código que posiblemente resulte en una excepción o error.
    ///Try catch, instruccion para manejar errores que lleguen a ocurrir.
    try {
      ///Con un QuerySnapshot nos devuelve la consulta y se toma la referencia de la ubicación en Firebase.
      ///Si no se usa el [await] no se toma la referencia.
      final all = await _db.collection('banner_grande').getDocuments();
      print(all.documents);
      List<String> handles = new List();
      for (var item in all.documents) {
        ///La variable [_urlD] espera lo que se ha tomado como referencia.
        ///
        ///Pasaremos el valor por referencia a un método, lo que implica que el valor va a cambiar dentro del método.
        ///Luego con  [.child] devuelve todos los datos del elemento seleccionado.
        ///En donde muestra los datos llamados [name] que se encuentran dentro del documento de la coleccion [banner].
        String _urlD = await FirebaseStorage.instance
            .ref()
            .child("banner/${item.data['name']}")
            .getDownloadURL();
        handles.add(_urlD);
      }

      ///
      print(handles);

      ///El tipo de retorno no cambia, de esta manera vuelve a mostrar las imagenes del banner continuamente.
      return handles;
    }

    ///Basicamente lo que hace [catch] es de que si se ha presentado alguna excepción en el codigo que esta en [try]
    ///lo captura, imprime el tipo de excepcion y se devuelve como [null], un vacio y no muestra los datos de la coleccion.
    catch (e) {
      print(e);
      return [];
    }
  }

  // gs://sezami-8f3b5.appspot.com/banner/apoSrc.jpg))((&&))
  ///Ahora con documento[banner_mini] de la coleccion.
  Future<List> getBannerMini() async {
    final all = await _db.collection('banner_mini').getDocuments();
    List<String> handles = new List();
    for (var item in all.documents) {
      String _urlD = await FirebaseStorage.instance
          .ref()
          .child("banner_mini/${item.data['name']}")
          .getDownloadURL();
      handles.add(_urlD);
    }
    print(handles);
    return handles;
  }
}
