import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techmall_analytic/provider/variablesExt.dart';

class ImagenHomePrincipalMOVIL extends StatelessWidget {
  const ImagenHomePrincipalMOVIL({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var storageRef = FirebaseStorage.instance
        .ref()
        .child(context.watch<VariablesExt>().url)
        .getDownloadURL();
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
          return ImagenCentro(url: snapshot.data.toString());
        }
      },
    );
  }
}

class ImagenCentro extends StatefulWidget {
  final String url;
  const ImagenCentro({super.key, required this.url});

  @override
  State<ImagenCentro> createState() => _ImagenCentroState();
}

class _ImagenCentroState extends State<ImagenCentro> {
  late TransformationController _transformationController;
  late InteractiveViewer _interactiveViewer;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _interactiveViewer = InteractiveViewer(
      transformationController: _transformationController,
      boundaryMargin: EdgeInsets.all(double.infinity),
      minScale: 0.5,
      maxScale: 3.0,
      child: Image.network(
        widget.url, // Replace with your image URL

        fit: BoxFit.contain,
      ),
    );
  }

  void _zoomIn() {
    _transformationController.value *= Matrix4.diagonal3Values(1.2, 1.2, 1);
  }

  void _zoomOut() {
    _transformationController.value *= Matrix4.diagonal3Values(0.8, 0.8, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _interactiveViewer,
        Positioned(
          top: 16.0,
          right: 16.0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.purple, // Color de fondo morado
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'NDVI',
              style: TextStyle(
                color: Colors.white, // Color del texto blanco
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: _zoomIn,
                child: Icon(Icons.zoom_in),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: _zoomOut,
                child: Icon(Icons.zoom_out),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
