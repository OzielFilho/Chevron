import 'package:barbershop/app/modules/home/pages/scheduling_page/scheduling_controller.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/widgets/schedules_list/schedules_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState
    extends ModularState<SchedulingPage, SchedulingController> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    controller.getSchedules(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, view) => SingleChildScrollView(
        controller: scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: view.minHeight,
            maxHeight: view.maxHeight,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Text(
                  'Seus Agendamentos',
                  style: Theme.of(context).textTheme.headline1,
                ),
                controller.schedules.isNotEmpty
                    ? SchedulesListWidget(
                        scrollController: scrollController,
                      )
                    : const Text('Você não possui agendamentos'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
