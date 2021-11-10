import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/models/professionals.dart';
import 'package:mobx/mobx.dart';
part 'barber_page_controller.g.dart';

class BarberPageController = _BarberPageControllerBase
    with _$BarberPageController;

abstract class _BarberPageControllerBase with Store {
  @observable
  List<Professionals> professionals = [
    Professionals(
        name: 'José',
        photo:
            'https://images.unsplash.com/photo-1630477064785-57a9b519e94a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmFyYmVyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
    Professionals(
        name: 'Ricardo',
        photo:
            'https://i.pinimg.com/originals/bb/6e/ce/bb6ece66a80c6331196a8655faf77cbc.jpg'),
    Professionals(
        name: 'Henrique',
        photo:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJMAMWJXBNj394zO0rPSZraOCx-iss1WM8NZeTxN5VBwpBIahZ4ciy4BYzB2NHeTyBF18&usqp=CAU'),
    Professionals(
        name: 'Lucas',
        photo:
            'https://image.freepik.com/free-photo/handsome-man-barber-shop-styling-hair_1303-20977.jpg')
  ];
}
