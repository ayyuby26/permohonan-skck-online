import 'package:flutter/material.dart';
import 'package:skck/main.dart';
import 'package:styled_widget/styled_widget.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final page = ({Widget child}) =>
        Styled.widget(child: child).padding(vertical: 30, horizontal: 20);

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: Container(
        color: Colors.amber,
        child: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2.1,
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'PERHATIAN, Permohonan surat pengantar SKCK dari RT ini tetap membutuhkan stempel dari RT setempat',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  wordSpacing: 2),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Settings(),
        ].toColumn().parent(page),
      )),
    );
  }
}

class SettingsItemModel {
  final IconData icon;
  final Color color;
  final String title;
  // final String description;
  const SettingsItemModel({
    @required this.color,
    // @required this.description,
    @required this.icon,
    @required this.title,
  });
}

const List<SettingsItemModel> settingsItems = [
  SettingsItemModel(
    icon: Icons.arrow_forward,
    color: Color(0xffFEC85C),
    title: 'Saya Paham',
    // description: 'dan paham',
  ),
];

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => settingsItems
      .map((settingsItem) => SettingsItem(
            settingsItem.icon,
            settingsItem.color,
            settingsItem.title,
            // settingsItem.description,
          ))
      .toList()
      .toColumn();
}

class SettingsItem extends StatefulWidget {
  SettingsItem(
    this.icon,
    this.iconBgColor,
    this.title,
  );

  final IconData icon;
  final Color iconBgColor;
  final String title;
  // final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    double t = 105;
    final settingsItem = ({Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: Color(0x30000000),
        ) // shadow borderRadius
        .constrained(height: 80)
        .padding(vertical: 12) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          // onTapDown: (details) => print('tapDown'),
          onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
          },
        )
        .scale(pressed ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    final Widget icon = Icon(widget.icon, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
          color: widget.iconBgColor,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10);

    final Widget title = Text(
      widget.title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey[450],
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    // final Widget description = Text(
    //   widget.description,
    //   style: TextStyle(
    //     color: Colors.black26,
    //     fontWeight: FontWeight.bold,
    //     fontSize: 12,
    //   ),
    // );

    return settingsItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          title,
          icon,
        ],
      ),
    );
  }
}
