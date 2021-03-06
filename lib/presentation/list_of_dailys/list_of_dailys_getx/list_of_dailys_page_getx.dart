import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_getx/list_of_dailys_controller_getx.dart';
import 'package:daily_scrum/presentation/list_of_dailys/widgets/list_of_dailys_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfDailysPageGetx extends GetView<ListOfDailysControllerGetx> {
  static const String routeName = '/list_of_dailys_page_getx';

  const ListOfDailysPageGetx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.reloadList(),
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.dailys.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final DailyEntity daily = controller.dailys[index];
                return ListOfDailysItemWidget(
                  todoYesterday: daily.todoYesterday,
                  todoToday: daily.todoToday,
                  thereAnyImpediment: daily.thereAnyImpediment,
                  onTap: () => controller.openModallEdit(daily),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
