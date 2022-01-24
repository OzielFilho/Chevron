import 'package:barbershop/app/modules/home/pages/initial_page/widgets/barber_page/models/hours.dart';

import 'int_in_month.dart';

Hours dateTimeInDay(DateTime? dateTime) {
  List<String> dateSeparete = dateTime.toString().split(' ');
  List<String> daySeparate = dateSeparete[0].split('-');
  String day =
      '${daySeparate[2]} do ${intInMonth(int.parse(daySeparate[1]))} de ${daySeparate[0]}';
  return Hours(day: day, hour: dateSeparete[1].substring(0, 5));
}
