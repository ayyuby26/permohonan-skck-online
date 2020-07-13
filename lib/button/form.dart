import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skck/main.dart';
import 'package:styled_widget/styled_widget.dart';

import '../view_pdf.dart';

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
    title: 'Buat Surat Pengantar',
    // description: 'dan paham',
  ),
];

class FormButton extends StatelessWidget {
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
    double t = 85;
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
            Future.delayed(const Duration(milliseconds: 500), () async {
              ByteData bytes = await rootBundle.load("lib/assets/logo.jpg");
              setState(() {
                list = bytes.buffer.asUint8List();
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewPdf(),
                ),
              );
            });

            // if (_formKey.currentState.validate()) {
            //   // _scaffoldKey.currentState.showSnackBar(
            //   //     SnackBar(
            //   //         content: Text('Mengirim data')));
            //   // imageCache.clear();

            // }
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
        child: Container(
      margin: EdgeInsets.only(left: t, right: t),
      alignment: Alignment.center,
      child: <Widget>[
        <Widget>[
          title,
          // description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        icon,
      ].toRow(),
    ));
  }
}
