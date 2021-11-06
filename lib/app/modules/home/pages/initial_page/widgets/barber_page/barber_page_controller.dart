import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/models/professionals.dart';
import 'package:faker/faker.dart';
import 'package:mobx/mobx.dart';
part 'barber_page_controller.g.dart';

class BarberPageController = _BarberPageControllerBase
    with _$BarberPageController;

abstract class _BarberPageControllerBase with Store {
  @action
  List<Professionals> generateListProfessionals() {
    List<Professionals> professionals = [];
    for (var i = 0; i < 4; i++) {
      Professionals professional = Professionals(
          name: faker.person.firstName(),
          photo: 'https://thispersondoesnotexist.com/image');
      professionals.add(professional);
    }

    return professionals;
  }
}
