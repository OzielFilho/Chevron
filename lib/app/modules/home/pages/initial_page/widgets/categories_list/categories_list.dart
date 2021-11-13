import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  List<Map<String, dynamic>> categories = [
    {
      'name': 'HairStyle',
      'icon': const Icon(
        Icons.cut,
        size: 30,
        color: Colors.white,
      )
    },
    {
      'name': 'Hidratação',
      'icon': const Icon(
        Icons.air_sharp,
        size: 30,
        color: Colors.white,
      )
    },
    {
      'name': 'Lavagem',
      'icon': const Icon(
        Icons.shower_outlined,
        size: 30,
        color: Colors.white,
      )
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        shrinkWrap: true,
        itemBuilder: (c, i) => InkWell(
          onTap: () {
            Modular.to.pushNamed('categories');
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: categories[i]['icon'],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  categories[i]['name'],
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
