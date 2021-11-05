import 'package:flutter/material.dart';

import 'widgets/body/body_scheduling.dart';

class SchedulingPage extends StatefulWidget {
  const SchedulingPage({Key? key}) : super(key: key);

  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              'Seus Agendamentos',
              style: Theme.of(context).textTheme.headline1,
            ),
            const Divider(),
            BodyScheduling(
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
