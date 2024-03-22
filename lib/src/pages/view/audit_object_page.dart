import 'package:ams/src/pages/view/widget/audit_objects_wiget.dart';
import 'package:ams/src/services/controller/object_controller.dart';
import 'package:ams/src/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuditObjectList extends StatelessWidget {
  const AuditObjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ObjectController>(builder: (controller) {
        return controller.isLoaded
            ? Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                    Expanded( flex:1,child: headerText("ID")),
                    Expanded( flex:2,child: headerText("Title")),
                    Expanded( flex:2,child: headerText("Description")),
                    Expanded( flex:1,child: headerText("Type")),
                    Expanded( flex:1,child: headerText("")),
                  ],),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            color: index%2==0?Colors.green.shade50:Colors.blue.shade50,
                            child: auditObjectContainer(
                                controller.list[index].iD,
                                controller.list[index].objectName,
                                controller.list[index].objectDescription,
                                controller.list[index].objectType),
                          );
                        }),
                  ),
                ],
              ),
            )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
