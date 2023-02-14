import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iot_dht11/app/utils/meteran.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'IOT sensor suhu dan kelembaban',
      //     style: TextStyle(color: Colors.black87),
      //   ),
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      // ),
      backgroundColor: Color(0xFFF3F5FA),
      // backgroundColor: Colors.black45,
      body: SafeArea(
        child: SingleChildScrollView(
          // margin: const EdgeInsets.all(15),
          child: GetBuilder<HomeController>(
            builder: (controller) => Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  width: double.infinity,
                  child: const Text.rich(
                    TextSpan(
                      text: "IOT Kelompok 3\n",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "Sensor Suhu dan Kelembaban",
                          style: TextStyle(color: Colors.black54, fontSize: 24),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  height: 200,
                  width: double.infinity,
                  child: Meter(
                    judul: "Temperatur",
                    satuan: "°C",
                    value: controller.data['suhu'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GridView.extent(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    maxCrossAxisExtent: 250,
                    children: [
                      MyWidget(
                        ikon: const Icon(Icons.thermostat_auto_outlined),
                        title: "Suhu",
                        value: "${controller.data['suhu']}°C",
                      ),
                      MyWidget(
                        value: "${controller.data['kelembaban']}%",
                        ikon: const Icon(Icons.water_drop_outlined),
                        title: "Kelembaban",
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            "For Your Info ❔\n",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 18),
                          children: [
                            TextSpan(
                              text: "Suhu Normal\n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  "Suhu yang normal/sedang berada dikisaran antara 25° celcius - 30° celcius.\n\n",
                            ),
                            TextSpan(
                              text: "Suhu Rendah\n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  "Suhu yang rendah/dingin berada dibawah 25° celcius. Ini dapat menimbulkan risiko kesehatan seperti hipotermia dan flu.\n\n",
                            ),
                            TextSpan(
                              text: "Suhu Tinggi\n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  "Suhu yang tinggi/panas berada diatas 30° celcius. Ini dapat menyebabkan kenyamanan berkurang dan menimbulkan risiko kesehatan seperti dehidrasi dan heat stroke.\n\n",
                            ),
                            TextSpan(
                              text: "Kelembaban Ideal\n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  "Para ahli kesehatan merekomendasikan tingkat kelembaban udara (atau yang disebut dengan Relative Humidity – RH) pada kisaran 45% - 65%, sebagai tingkat yang ideal.\n\n",
                            ),
                            TextSpan(
                              text: "Kelembaban Rendah\n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  "Tingkat kelembaban udara yang sangat rendah dapat menyebabkan kulit kering, sariawan, dan memperparah masalah kesehatan seperti sinusitis.\n\n",
                            ),
                            TextSpan(
                              text: "Kelembaban Tinggi\n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  "Tingkat kelembaban udara yang sangat tinggi dapat menyebabkan jamur dan bakteri berkembang dengan cepat, yang menimbulkan masalah kesehatan seperti infeksi saluran pernapasan.",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  Icon ikon;
  String title;
  String value;
  MyWidget({
    required this.ikon,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(8),
      height: 200,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF3F5FA),
                  borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.all(15),
              child: ikon,
            ),
            // const SizedBox(height: 30),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
