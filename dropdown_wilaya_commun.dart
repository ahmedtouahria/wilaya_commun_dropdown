import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:tbr3_flutter/controllers/data_controller.dart';

class WilayaCommun extends GetWidget {
  WilayaCommun({Key? key}) : super(key: key);
  @override
  DataController controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FutureBuilder(
              future: controller.getAllWilaya(),
              builder: (context, snapshot) => FormHelper.dropDownWidget(
                      context,
                      'الولاية',
                      controller.wilayaName,
                      controller.wilayaMaps, (String? v) {
                    controller.wilayaName = v!;
                    controller.getAllCommun(v);
                    controller.communName = '';
                   // print(v);
                  }, (onValid) {},
                      borderFocusColor: const Color.fromARGB(255, 155, 37, 28),
                      borderColor: const Color.fromARGB(255, 155, 37, 28),
                      borderRadius: 15,
                      optionValue: "wilaya_name",
                      optionLabel: "wilaya_name")),
        ),
        Expanded(
            child: GetBuilder<DataController>(
                builder: (controller) => FormHelper.dropDownWidget(
                        context,
                        'البلدية',
                        controller.communName,
                        controller.commun, (String? v) {
                      controller.communName = v!;
                      //print(v);
                    }, (onValid) {},
                        borderFocusColor:
                            const Color.fromARGB(255, 155, 37, 28),
                        borderColor: const Color.fromARGB(255, 155, 37, 28),
                        borderRadius: 15,
                        optionValue: "commune_name",
                        optionLabel: "commune_name")))
      ],
    );
  }
}
