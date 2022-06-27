// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';

class StickNote {
  int? id;
  final String date;
  final String hour;
  final KindOfService kindOfService;
  final String note;
  final bool done;

  StickNote({
    required this.id,
    required this.date,
    required this.hour,
    required this.kindOfService,
    required this.note,
    required this.done,
  });

  String getStatusStickNote() {
    return done ? "Realizado" : "Não Realizado";
  }

  String getDateHourFormatted() {
    return "${date} ${hour}";
  }
}
