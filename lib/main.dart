import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:skck/information.dart';
import 'package:skck/views/procedure.dart';
import 'dart:typed_data';
import 'general.dart';
import 'button/form.dart';

Uint8List list;
TextEditingController fullName;
TextEditingController dateOfBirth;
TextEditingController sex;
TextEditingController job;
TextEditingController religion;
TextEditingController address;

var date = DateTime.now();
String hari = 'hari', bulan = 'bulan';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //then when I leave the page, put it back to normal like this:
//fungsi dispose akan bekerja ketika halaman ditinggalkan
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
        primarySwatch: Colors.grey,
        textSelectionHandleColor: Colors.grey,
      ),
      home: Scaffold(
        body: UserPage(), //UserPage()
      ),
    );
  }
}

/*
 * 
 *
 * 
 * 
 * 
 * 
 * 
 * 
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final doc = pw.Document();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final FocusNode _fnFullName = FocusNode();
  final FocusNode _fndateOfBirth = FocusNode();
  final FocusNode _fnsex = FocusNode();
  final FocusNode _fnjob = FocusNode();
  final FocusNode _fnreligion = FocusNode();
  final FocusNode _fnaddress = FocusNode();
  final FocusNode _fnSubmit = FocusNode();

  void initState() {
    super.initState();
    translateDate();
    fullName = TextEditingController();
    dateOfBirth = TextEditingController();
    sex = TextEditingController();
    job = TextEditingController();
    religion = TextEditingController();
    address = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // Bersihkan pengontrol saat widget dibuang.
    fullName.dispose();
    dateOfBirth.dispose();
    sex.dispose();
    job.dispose();
    religion.dispose();
    address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final page = ({Widget child}) =>
    //     Styled.widget(child: child).padding(vertical: 30, horizontal: 20);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
        primarySwatch: Colors.grey,
        textSelectionHandleColor: Colors.grey,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tekan sekali lagi untuk keluar'),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Text(
                      "Aplikasi permohonan surat pengantar RT untuk pembuatan SKCK",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage('lib/assets/logo.jpg'),
                      height: 100,
                    ),
                  ),
                  Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        // height: MediaQuery.of(context).size.height / 5,
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  focusNode: _fnFullName,
                                  autofocus: true,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    labelText: "Nama lengkap",
                                    hintText: "Sucipto Mangun Kusumo",
                                  ),
                                  controller: fullName,
                                  onSubmitted: (v) {
                                    if (v.isEmpty) {
                                      return 'kolom tidak boleh kosong';
                                    } else {
                                      _fnFullName.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(_fndateOfBirth);
                                    }
                                    return null;
                                  },
                                ),
                                TextField(
                                  focusNode: _fndateOfBirth,
                                  autofocus: true,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    hintText: "Bekasi, 01 April 1990",
                                    labelText: "Tempat/Tgl lahir",
                                  ),
                                  controller: dateOfBirth,
                                  onSubmitted: (v) {
                                    if (v.isEmpty) {
                                      return 'kolom tidak boleh kosong';
                                    } else {
                                      _fndateOfBirth.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(_fnsex);
                                    }
                                    return null;
                                  },
                                ),
                                TextField(
                                  focusNode: _fnsex,
                                  autofocus: true,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                      labelText: "Jenis Kelamin",
                                      hintText: "Perempuan"),
                                  controller: sex,
                                  onSubmitted: (v) {
                                    if (v.isEmpty) {
                                      return 'kolom tidak boleh kosong';
                                    } else {
                                      _fnsex.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(_fnjob);
                                    }
                                    return null;
                                  },
                                ),
                                TextField(
                                  focusNode: _fnjob,
                                  autofocus: true,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                      labelText: "Pekerjaan",
                                      hintText: "Belum Bekerja"),
                                  controller: job,
                                  onSubmitted: (v) {
                                    if (v.isEmpty) {
                                      return 'kolom tidak boleh kosong';
                                    } else {
                                      _fnjob.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(_fnreligion);
                                    }
                                    return null;
                                  },
                                ),
                                TextField(
                                  focusNode: _fnreligion,
                                  autofocus: true,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                      labelText: "Agama", hintText: "Islam"),
                                  controller: religion,
                                  onSubmitted: (v) {
                                    if (v.isEmpty) {
                                      return 'kolom tidak boleh kosong';
                                    } else {
                                      _fnreligion.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(_fnaddress);
                                    }
                                    return null;
                                  },
                                ),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  focusNode: _fnaddress,
                                  autofocus: true,
                                  minLines: 3,
                                  maxLines: null,
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                      labelText: "Alamat",
                                      hintText:
                                          "Perum. Griya Persada Indah Rt/Rw 001/010 \nblok xx no.x, desa Sukadami, kec. Cikarang \nSelatan, Kab. Bekasi"),
                                  controller: address,
                                  onSubmitted: (v) {
                                    _fnaddress.unfocus();
                                    FocusScope.of(context)
                                        .requestFocus(_fnSubmit);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Procedure()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Lihat Panduan"),
                              SizedBox(width: 10,),
                              Image(
                      image: AssetImage('lib/assets/syarat_64px.png'),
                      height: 20,
                    ),
                            ],
                          ))),
                  FormButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
