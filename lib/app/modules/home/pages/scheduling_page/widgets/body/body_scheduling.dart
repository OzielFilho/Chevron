import 'package:barbershop/app/modules/home/home_controller.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/widgets/schedules_list/schedules_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BodyScheduling extends StatefulWidget {
  final ScrollController scrollController;
  const BodyScheduling({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _BodySchedulingState createState() => _BodySchedulingState();
}

class _BodySchedulingState extends State<BodyScheduling> {
  final controllerHome = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: SchedulesListWidget(
        scrollController: widget.scrollController,
      ),
    );
  }
}
