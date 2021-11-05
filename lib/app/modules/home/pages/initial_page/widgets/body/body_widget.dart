import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barbers_list/barbers_list_widget.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/categories_list/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BodyWidget extends StatefulWidget {
  final ScrollController scrollController;
  const BodyWidget({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final controllerInitial = Modular.get<InitialController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SingleChildScrollView(
        controller: widget.scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'Categorias',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 10,
              ),
              const CategoriesListWidget(),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Barbearias',
                style: Theme.of(context).textTheme.headline1,
              ),
              controllerInitial.stores != null
                  ? BarberListWidget(
                      scrollController: widget.scrollController,
                    )
                  : Container()
            ],
          ),
        ),
      );
    });
  }
}
