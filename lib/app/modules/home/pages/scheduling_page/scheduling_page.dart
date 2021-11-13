import 'package:barbershop/app/modules/home/pages/scheduling_page/scheduling_controller.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/widgets/finalize_schedule/finalize_schedule.dart';
import 'package:barbershop/app/modules/home/pages/scheduling_page/widgets/schedules_list/schedules_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    controller.getSchedulesFinalize(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Em andamento'),
              Tab(text: 'Finalizados'),
            ],
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Seus Agendamentos',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: TabBarView(
          children: [
            Observer(
              builder: (context) => controller.schedules.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SchedulesListWidget(
                        scrollController: scrollController,
                      ),
                    )
                  : Container(),
            ),
            Observer(
                builder: (context) => controller.schedulesFinalize.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: FinalizeSchedule(
                          scrollController: scrollController,
                        ),
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }
}
