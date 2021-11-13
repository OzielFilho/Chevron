import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barbers_list/barbers_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbearias'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Modular.to.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BarberListWidget(
            scrollController: scrollController,
          ),
        ),
      ),
    );
  }
}
