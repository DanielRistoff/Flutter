import 'package:flutter/material.dart';
import '../car_in_hand_app_theme.dart';

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
            children: <Widget>[Text("Pagina para adicioanar novos lembretes")],
          ),
        ),
      ],
    );
  }
}
