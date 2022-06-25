import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../car_in_hand_app_theme.dart';

List<String> getDates() {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final DateTime now = DateTime.now();
  List<String> datesF = <String>[formatter.format(now)];

  for (var i = 1; i < 31; i++) {
    datesF.add(formatter.format(DateTime(now.year, now.month, now.day + i)));
  }
  return datesF;
}

List<String> getHours() {
  final DateFormat formatter = DateFormat('HH:mm');
  final DateTime now = DateTime.now();
  final DateTime initialDate = DateTime(now.year, now.month, now.day, 0, 0);
  List<String> hoursF = <String>[formatter.format(initialDate)];

  for (var i = 1; i < 48; i++) {
    hoursF.add(formatter.format(DateTime(initialDate.year, initialDate.month,
        initialDate.day, initialDate.hour, initialDate.minute + 30 * i)));
  }
  return hoursF;
}

List<String> _dates = getDates();
List<String> _hours = getHours();

const List<String> _services = <String>[
  'Troca de óleo',
  'Troca de filtro de óleo',
  'Troca de filtro de ar',
  'Troca de filtro de gasolina',
  'Calibrar pneu',
  'Revisão básica',
  'Revisão Completa',
  'Revisão freios',
  'Outros',
];

int selectDate = 0;
int selectHours = 0;
int selectService = 0;

class AddStickyNotesView extends StatelessWidget {
  const AddStickyNotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: CarInHandAppTheme.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: CarInHandAppTheme.grey.withOpacity(0.4),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Data",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                    top: 2,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 70,
                                    child: CupertinoPicker(
                                      itemExtent: 30,
                                      onSelectedItemChanged: (int indexDate) {
                                        selectDate = indexDate;
                                      },
                                      children: List<Widget>.generate(
                                          _dates.length, (int index) {
                                        return Center(
                                          child: Text(
                                            _dates[index],
                                          ),
                                        );
                                      }),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Hora",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                    top: 10,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 70,
                                    child: CupertinoPicker(
                                      itemExtent: 30,
                                      onSelectedItemChanged: (int indexHour) {
                                        selectHours = indexHour;
                                      },
                                      children: List<Widget>.generate(
                                          _hours.length, (int index) {
                                        return Center(
                                          child: Text(
                                            _hours[index],
                                          ),
                                        );
                                      }),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  right: 16,
                                  top: 16,
                                ),
                                child: Text(
                                  "Tipo de serviço",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: CarInHandAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: CarInHandAppTheme.nearlyDarkBlue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                    top: 10,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    height: 70,
                                    child: CupertinoPicker(
                                      itemExtent: 30,
                                      onSelectedItemChanged:
                                          (int indexService) {
                                        selectService = indexService;
                                      },
                                      children: List<Widget>.generate(
                                          _services.length, (int index) {
                                        return Center(
                                          child: Text(
                                            _services[index],
                                          ),
                                        );
                                      }),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30,
                                    right: 16,
                                    top: 50,
                                  ),
                                  child: SizedBox(
                                    width: 300,
                                    child: CupertinoButton(
                                      onPressed: () {},
                                      color: const Color.fromARGB(
                                          255, 91, 88, 251),
                                      child: const Text('Salvar'),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
