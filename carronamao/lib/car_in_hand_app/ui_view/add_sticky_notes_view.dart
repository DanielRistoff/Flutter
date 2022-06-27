import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../car_in_hand_app_theme.dart';

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

int selectService = 0;

class AddStickyNotesView extends StatefulWidget {
  const AddStickyNotesView({Key? key}) : super(key: key);

  @override
  State<AddStickyNotesView> createState() => _AddStickyNotesViewState();
}

class _AddStickyNotesViewState extends State<AddStickyNotesView> {
  @override
  Widget build(BuildContext context) {
    late TextEditingController _dateController =
        TextEditingController(text: '');
    late TextEditingController _hoursController =
        TextEditingController(text: '');

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
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
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
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 16,
                                  ),
                                  child: SizedBox(
                                      width: 100,
                                      height: 30,
                                      child: CupertinoTextField(
                                        controller: _dateController,
                                        enabled: false,
                                      ))),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.date_range),
                                    onPressed: () async {
                                      final data = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                            DateTime(DateTime.now().year),
                                        lastDate:
                                            DateTime(DateTime.now().year + 1),
                                        locale: const Locale("pt", "BR"),
                                      );
                                      if (data != null) {
                                        final dataFormatted =
                                            DateFormat.yMd("pt_BR")
                                                .format(data);

                                        _dateController.value =
                                            TextEditingValue(
                                          text: dataFormatted,
                                          selection: TextSelection.fromPosition(
                                            TextPosition(
                                                offset: dataFormatted.length),
                                          ),
                                        );
                                      }
                                    },
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
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
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 16,
                                  ),
                                  child: SizedBox(
                                      width: 55,
                                      height: 30,
                                      child: CupertinoTextField(
                                        controller: _hoursController,
                                        enabled: false,
                                      ))),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.access_time),
                                    onPressed: () async {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );

                                      if (time != null) {
                                        final now = new DateTime.now();
                                        final dt = DateTime(now.year, now.month,
                                            now.day, time.hour, time.minute);
                                        final format = DateFormat.Hm();
                                        var hourFormatted = format.format(dt);

                                        _hoursController.value =
                                            TextEditingValue(
                                          text: hourFormatted,
                                          selection: TextSelection.fromPosition(
                                            TextPosition(
                                                offset: hourFormatted.length),
                                          ),
                                        );
                                      }
                                    },
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
                                      disabledColor:
                                          CupertinoColors.inactiveGray,
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
