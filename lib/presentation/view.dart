// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:dav_smart_wastebin_app/presentation/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmartWasteBinPageView extends StatefulWidget {
  const SmartWasteBinPageView({super.key});

  @override
  State<SmartWasteBinPageView> createState() => _SmartWasteBinPageViewState();
}

class _SmartWasteBinPageViewState extends State<SmartWasteBinPageView> {
  final controller = Get.put(SmartWasteBinController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: false,
        title: const Text(
          'IoT Waste Bin App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GetBuilder<SmartWasteBinController>(
            init: SmartWasteBinController(),
            builder: (context) {
              return IconButton(
                onPressed: () {
                  controller.changeSnoozeState();
                },
                icon: Icon(
                  controller.snoozeNotification
                      ? Icons.notifications_off_outlined
                      : Icons.notifications_active_outlined,
                  color: Colors.white,
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: GetBuilder<SmartWasteBinController>(
        init: SmartWasteBinController(),
        builder: (context) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                'Bin fill level:',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${controller.percentageVal.toString()}%',
                                style: TextStyle(
                                  fontSize: 55,
                                  fontWeight: FontWeight.w800,
                                  color: controller.percentageVal >= 90
                                      ? Colors.red
                                      : controller.percentageVal >= 80
                                          ? Colors.amber[900]
                                          : controller.percentageVal >= 70
                                              ? Colors.amber[700]
                                              : controller.percentageVal >= 60
                                                  ? Colors.amber
                                                  : controller.percentageVal >=
                                                          50
                                                      ? Colors.amber
                                                      : controller.percentageVal >=
                                                              40
                                                          ? Colors.green[400]
                                                          : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 18,
                  ),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[100]?.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 18),
                        child: Text(
                          'Controls',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom: 10, top: controller.open ? 12 : 12),
                              height: 210,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(24, 160, 221, 0.06),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  controller.open
                                      ? const Image(
                                          image:
                                              AssetImage("assets/bin_open.png"),
                                          height: 110,
                                          width: 100,
                                          color: Colors.black87,
                                        )
                                      : const Image(
                                          image: AssetImage(
                                              "assets/bin-closed.png"),
                                          height: 110,
                                          width: 100,
                                          color: Colors.black87,
                                        ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    controller.open
                                        ? ' Bin is Open'
                                        : 'Bin is Closed',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: controller.open
                                          ? Colors.red[800]
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              height: 210,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(64, 190, 121, 0.05),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  controller.locked
                                      ? const Image(
                                          image: AssetImage(
                                            "assets/lock-closed.png",
                                          ),
                                          height: 130,
                                          width: 80,
                                          color: Colors.black87,
                                        )
                                      : const Image(
                                          image: AssetImage(
                                            "assets/padlock_open.png",
                                          ),
                                          height: 150,
                                          width: 100,
                                          color: Colors.black87,
                                        ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    controller.locked
                                        ? 'Bin is Locked'
                                        : 'Bin is Not Locked',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: controller.locked
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Custom Button pressed');
                        controller.mqttPublish(controller.open ? "C" : "O");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: controller.open
                            ? Colors.amber[900]
                            : Colors.blue[400],
                        fixedSize: Size(size.width / 2.5, 50),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        controller.open ? "Close" : "Open",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //
                    TextButton(
                      onPressed: () {
                        print('Custom Button pressed');
                        controller.mqttPublish(controller.locked ? "U" : "L");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor:
                            controller.locked ? Colors.red : Colors.green[400],
                        fixedSize: Size(size.width / 2.5, 50),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        controller.locked ? "Unlock" : "Lock",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
