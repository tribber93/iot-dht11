import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FirebaseDatabase db = FirebaseDatabase.instance;
  Map data = {'suhu': 0, 'kelembaban': 0};

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    starCountRef.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value as Map;
      print(data);
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  DatabaseReference starCountRef = FirebaseDatabase.instance
      .refFromURL("https://iot-kelompok-3-default-rtdb.firebaseio.com/");
  // streamData() {
  //   starCountRef.onValue.listen((DatabaseEvent event) {
  //     final data = event.snapshot.value;
  //     print(data);
  //   });
  // }

  // DatabaseReference starCountRef = db.;
  // DatabaseReference startCount = FirebaseDatabase.instance
  //     .ref()
  //     .child("https://iot-kelompok-3-default-rtdb.firebaseio.com/");
  // streamData() {
  //   startCount.onValue.listen((event) {
  //     final data = event.snapshot.value;
  //     // updateStarCount(data);
  //     print(data);
  //   });
  // }
  // starCount.
  // onValue.listen((DatabaseEvent event) {
  //     final data = event.snapshot.value;
  //     updateStarCount(data);
  // });
}
