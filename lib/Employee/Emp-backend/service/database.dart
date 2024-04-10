import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  
  Future addEmployeeDetails(Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance.collection("Employee").doc(id).set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  Future updateEmployeeDetails(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance.collection("Employee").doc(id).update(updateInfo);
  }

  Future deleteEmployee(String id) async {
    return await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }

  Future addAppointment(Map<String, dynamic> appointmentInfoMap) async {
    return await FirebaseFirestore.instance.collection("Appointments").add(appointmentInfoMap);
  }
}
