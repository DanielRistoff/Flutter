import 'package:carronamao/car_in_hand_app/models/kind_of_service.dart';

class StickNote {
  int? id;
  final String date;
  final String hour;
  final KindOfService kindOfService;
  final bool done;

  StickNote({
    required this.id,
    required this.date,
    required this.hour,
    required this.kindOfService,
    required this.done,
  });
}
