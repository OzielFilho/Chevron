import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/body/body_widget.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/header/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends ModularState<InitialPage, InitialController> {
  @override
  void initState() {
    controller.initPage();
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        controller: _scrollController,
        child: ConstrainedBox(
          constraints: constraints,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderWidget(),
                  BodyWidget(scrollController: _scrollController)
                ],
              ),
              ClipPath(
                clipper: OvalTopBorderClipper(),
                child: Container(
                  height: 60,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.list_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
