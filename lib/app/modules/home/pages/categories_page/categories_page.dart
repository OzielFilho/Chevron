import 'package:barbershop/app/modules/home/models/barbers.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/initial_controller.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/barber_page.dart';
import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barbers_list/barbers_list_widget.dart';
import 'package:barbershop/app/core/utils/widgets/textfield/textformfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  ScrollController scrollController = ScrollController();
  bool _search = false;
  final TextEditingController _searchText = TextEditingController();
  final controllerInitial = Modular.get<InitialController>();

  List<Barbers>? getStore(String name) {
    List<Barbers>? barbers = [];
    for (var element in controllerInitial.stores!.listBarbers) {
      if (element.name!.toLowerCase().contains(name.toLowerCase())) {
        barbers.add(element);
      }
    }
    return barbers;
  }

  List<Barbers>? searchBarber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbearias'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _search = true;
                });
              },
              icon: const Icon(Icons.search))
        ],
        leading: IconButton(
            onPressed: () => Modular.to.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: !_search
                ? BarberListWidget(
                    scrollController: scrollController,
                  )
                : Column(
                    children: [
                      TextFormFieldCustom(
                        controllerText: _searchText,
                        title: 'Pesquisar Loja',
                        onChanged: (value) {
                          setState(() {
                            searchBarber = getStore(value)!;
                          });
                        },
                      ),
                      controllerInitial.stores!.listBarbers.isNotEmpty
                          ? searchBarber != null
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  itemCount: searchBarber!.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            width: 0.5,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () => Modular.to.push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BarberPage(index: index),
                                                ),
                                              ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 27,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      controllerInitial
                                                          .stores!
                                                          .listBarbers[index]
                                                          .photo!,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(controllerInitial
                                                          .stores!
                                                          .listBarbers[index]
                                                          .name!),
                                                      Text(
                                                        controllerInitial
                                                            .stores!
                                                            .listBarbers[index]
                                                            .description!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ],
                                          )),
                                    ),
                                  ),
                                )
                              : Container()
                          : const Text('Lista de Barbearias Vazia')
                    ],
                  )),
      ),
    );
  }
}
