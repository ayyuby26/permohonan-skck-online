import 'package:flutter/material.dart';

class Procedure extends StatefulWidget {
  @override
  _ProcedureState createState() => _ProcedureState();
}

class _ProcedureState extends State<Procedure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Syarat pembuatan SKCK",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              ListView(
                physics: ScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    leading: Text("1"),
                    title: Text(
                      "Surat pengantar Desa/Kelurahan yang disahkan",
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  ),
                  ListTile(
                    leading: Text("2"),
                    title: Text(
                      "Fotocopy KTP diperbesar",
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  ),
                  ListTile(
                    leading: Text("3"),
                    title: Text(
                      "Fotocopy Kartu Keluarga (KK)",
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  ),
                  ListTile(
                    leading: Text("4"),
                    title: Text(
                      "Fotocopy Akte Kelahiran",
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  ),
                  ListTile(
                    leading: Text("5"),
                    title: Text(
                      "Fotocopy Ijazah terakhir",
                      style: TextStyle(fontSize: 14),
                    ),
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  ),
                  ListTile(
                      leading: Text("6"),
                      title: Text(
                        "Pas Foto 4x6 background merah",
                        style: TextStyle(fontSize: 14),
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                      subtitle: ListView(
                          physics: ScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: <Widget>[
                            ListTile(
                              leading: Text("-"),
                              title: Text(
                                "SKCK 4 lembar",
                                style: TextStyle(fontSize: 14),
                              ),
                              contentPadding:
                                  EdgeInsets.only(left: 0.0, right: 0.0),
                            ),
                            ListTile(
                              leading: Text("-"),
                              title: Text(
                                "Sidik jari 2 lembar",
                                style: TextStyle(fontSize: 14),
                              ),
                              contentPadding:
                                  EdgeInsets.only(left: 0.0, right: 0.0),
                            ),
                          ])),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    "Langkah - langkah pembuatan SKCK",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      leading: Text("1"),
                      title: Text(
                        "Membuat surat pengantar dari RT",
                        style: TextStyle(fontSize: 14),
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    ),
                    ListTile(
                      leading: Text("2"),
                      title: Text(
                        "Membuat surat pengantar dari Desa/Kelurahan, dengan membawa surat pengantar dari RT",
                        style: TextStyle(fontSize: 14),
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    ),
                    ListTile(
                      leading: Text("3"),
                      title: Text(
                        "Menuju polsek cikarang selatan dengan membawa surat pengantar dari Desa/Kelurahan beserta syarat - syaratnya",
                        style: TextStyle(fontSize: 14),
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    ),
                    ListTile(
                      leading: Text("4"),
                      title: Text(
                        "Mengisi formulir, lalu berikan pada polisi, setelah itu ikuti instruksi selanjutnya, karena selama pandemi disuruh datang kembali pukul 16.00 untuk mengambil SKCK, (tapi sebelumnya bayar terlebih dahulu pada saat datang pukul 16.00)",
                        style: TextStyle(fontSize: 14),
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text:
                        'Sesuai dengan PP Nomor 60 Tahun 2016, biaya pembuatan SKCK sebesar ',
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Rp. 30.000, - / lembar',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ', jangan mau bayar apapun selain biaya diatas, kecuali saat didesa karena ada beberapa desa yang meminta uang untuk kas desa'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
