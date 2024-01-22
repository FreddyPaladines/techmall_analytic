import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImagenHomePrincipal extends StatelessWidget {
  const ImagenHomePrincipal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var storageRef =
        FirebaseStorage.instance.ref().child('Fondo.png').getDownloadURL();
    print(storageRef);

    return FutureBuilder<String>(
      future: storageRef,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Text('No hay URL de imagen disponible.');
        } else {
          return Image.network(snapshot.data.toString());
        }
      },
    );
  }
}
