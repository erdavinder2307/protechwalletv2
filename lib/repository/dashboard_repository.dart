import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:protechwalletv2/flutter_flow/flutter_flow_util.dart';

class DashboardRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  GetdashboardData() {
    final docRef = db.collection("transactions").doc();
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
