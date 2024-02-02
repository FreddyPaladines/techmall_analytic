import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class DataServiceCampo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getData() async {
    QuerySnapshot snapshot = await _firestore.collection('Campo').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}

class DataServiceLote {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getData() async {
    QuerySnapshot snapshot =
        await _firestore.collection('/Campo/zWkmZT0wQQfnHd509SHd/Lote').get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}

class DataServiceFecha {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getData() async {
    QuerySnapshot snapshot = await _firestore
        .collection(
            '/Campo/zWkmZT0wQQfnHd509SHd/Lote/NdWGolLHIN5VkwX3IObW/Fecha')
        .get();
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}

class DataDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataServiceCampo().getData(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Access data from snapshot.data and display it in your widget
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              print(snapshot.data);
              return ListTile(
                title: Text(
                    'Item ${index + 1}: ${snapshot.data![index]['Nombre']}'),
              );
            },
          );
        }
      },
    );
  }
}

class DataDisplayCampo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataServiceCampo().getData(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text(
            '${snapshot.data![0]['Nombre']}',
            style: FlutterFlowTheme.of(context).bodyMedium,
          );
          // Access data from snapshot.data and display it in your widget
        }
      },
    );
  }
}

class DataDisplayLote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataServiceLote().getData(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text(
            '${snapshot.data![0]['Nombre']}',
            style: FlutterFlowTheme.of(context).bodyMedium,
          );
          // Access data from snapshot.data and display it in your widget
        }
      },
    );
  }
}

class DataDisplayFecha extends StatefulWidget {
  @override
  State<DataDisplayFecha> createState() => _DataDisplayFechaState();
}

class _DataDisplayFechaState extends State<DataDisplayFecha> {
  Set<int> selectedIndexes = Set<int>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataServiceFecha().getData(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  color: selectedIndexes.contains(index)
                      ? Colors.black.withOpacity(0.2)
                      : null,
                  borderRadius: BorderRadius.circular(
                      10.0), // Ajusta el radio según tus preferencias
                ),
                child: InkWell(
                  onTap: () {
                    // Maneja la selección aquí
                    setState(() {
                      if (selectedIndexes.contains(index)) {
                        selectedIndexes.remove(index);
                      } else {
                        selectedIndexes.clear();
                        selectedIndexes.add(index);
                      }
                    });
                    print(
                        "Elemento seleccionado: ${snapshot.data![index]['NDVI']}");
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${DateFormat.MMMM('es').format(snapshot.data![index]['Fecha'].toDate())}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 9,
                            ),
                      ),
                      Text(
                        '${snapshot.data![index]['Fecha'].toDate().day}',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        '${snapshot.data![index]['Fecha'].toDate().year}',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 12,
                            ),
                      ),
                    ],
                  ),
                ),
              );

              /* ListTile(
                title: Text(
                    'Item ${index + 1}: ${snapshot.data![index]['Nombre']}'),
              ); */
            },
          );
          // Access data from snapshot.data and display it in your widget
        }
      },
    );
  }
}
