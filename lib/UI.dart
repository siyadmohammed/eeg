import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SensorDataScreen extends StatefulWidget {
  @override
  _SensorDataScreenState createState() => _SensorDataScreenState();
}

class _SensorDataScreenState extends State<SensorDataScreen> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref('sensordata');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Sensor Data'),
      ),
      body: StreamBuilder(
        stream: _dbRef.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData && !snapshot.hasError && snapshot.data!.snapshot.value != null) {
            // Convert the snapshot to a Map
            Map<dynamic, dynamic> data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                // Get the key and value
                String key = data.keys.elementAt(index);
                dynamic value = data[key];

                return ListTile(
                  title: Text('Row $key'),
                  subtitle: Text('Variable 1: ${value['variable1']}, Variable 2: ${value['variable2']}'),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
