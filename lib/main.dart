import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'general.dart';

import 'package:pdf/pdf.dart';
import 'package:skck/view_pdf.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
        primarySwatch: Colors.grey,
        textSelectionHandleColor: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

// ####################################################
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final doc = pw.Document();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  FocusNode _fnFullName;
  FocusNode _fndateOfBirth;
  FocusNode _fnsex;
  FocusNode _fnjob;
  FocusNode _fnreligion;
  FocusNode _fnaddress;
  FocusNode _fnSubmit;

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

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    doc.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World!'),
        ),
      ),
    );
    final path = await _localPath;
    return File('$path/example2.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SingleChildScrollView(
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                hintText: "Bekasi, 26 April 1999",
                                labelText: "Tempat/Tgl lahir",
                              ),
                              controller: dateOfBirth,
                              onSubmitted: (v) {
                                if (v.isEmpty) {
                                  return 'kolom tidak boleh kosong';
                                } else {
                                  // _fndateOfBirth.unfocus();
                                  // FocusScope.of(context).requestFocus(_fnsex);
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              focusNode: _fnsex,
                              autofocus: true,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  labelText: "Jenis Kelamin",
                                  hintText: "Perempuan"),
                              controller: sex,
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'kolom tidak boleh kosong';
                                } else {
                                  // _fnsex.unfocus();
                                  // FocusScope.of(context).requestFocus(_fnjob);
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              focusNode: _fnjob,
                              autofocus: true,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  labelText: "Pekerjaan",
                                  hintText: "Belum Bekerja"),
                              controller: job,
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'kolom tidak boleh kosong';
                                } else {
                                  // _fnjob.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_fnreligion);
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              focusNode: _fnreligion,
                              autofocus: true,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  labelText: "Agama", hintText: "Islam"),
                              controller: religion,
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'kolom tidak boleh kosong';
                                } else {
                                  // _fnreligion.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_fnaddress);
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              focusNode: _fnaddress,
                              autofocus: true,
                              minLines: 3,
                              maxLines: null,
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  labelText: "Alamat",
                                  hintText:
                                      "Perum. Mega Pura Persada Rt/Rw 001/010 \nblok a4 no.5 kec. Cikungunya, Kab. Merotop"),
                              controller: address,
                              validator: (v) {
                                if (v.isEmpty) {
                                  return 'kolom tidak boleh kosong';
                                } else {
                                  // _fnaddress.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_fnaddress);
                                }
                                return null;
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: RaisedButton(
                                focusNode: _fnSubmit,
                                onPressed: () async {
                                  ByteData bytes = await rootBundle
                                      .load("lib/assets/logo.jpg");
                                  setState(() {
                                    list = bytes.buffer.asUint8List();
                                  });
                                  await _localFile.then((value) {
                                    value.writeAsBytesSync(doc.save());
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
                                child: Text("Buat Surat Pengantar SKCK"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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

Future<Uint8List> generateDocument(PdfPageFormat format) async {
  final pw.Document doc = pw.Document();

  final image = PdfImage.file(
    doc.document,
    bytes: list,
  );

  doc.addPage(pw.MultiPage(
      pageFormat:
          PdfPageFormat.a4.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.BoxBorder(
                    bottom: true, width: 0.5, color: PdfColors.grey)),
            child: pw.Text('Portable Document Format',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      // footer: (pw.Context context) {
      //   return pw.Container(
      //       alignment: pw.Alignment.centerRight,
      //       margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
      //       child: pw.Text(
      //           'Page ${context.pageNumber} of ${context.pagesCount}',
      //           style: pw.Theme.of(context)
      //               .defaultTextStyle
      //               .copyWith(color: PdfColors.grey)));
      // },
      build: (pw.Context context) => <pw.Widget>[
            pw.Header(
                level: 2,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Flexible(
                        flex: 1,
                        child: pw.Image(
                          image,
                        ),
                      ),
                      pw.Flexible(
                          flex: 5,
                          child: pw.Container(
                              alignment: pw.Alignment.center,
                              child: pw.Column(children: <pw.Widget>[
                                pw.Text('PEMERINTAH KABUPATEN BEKASI',
                                    textScaleFactor: 1.5),
                                pw.Text('KECAMATAN CIKARANG SELATAN',
                                    textScaleFactor: 1.5),
                                pw.Text('DESA SUKADAMI', textScaleFactor: 1.5),
                                pw.Text('Perumahan bla bla bla',
                                    textScaleFactor: 1),
                              ]))),
                      pw.Flexible(
                        flex: 1,
                        child: pw.SizedBox(width: 1000),
                      ),
                    ])),
            pw.Divider(height: 0),
            /*
          
             */
            pw.Container(margin: pw.EdgeInsets.all(1.5)),
            pw.Divider(height: 0),
            pw.Divider(height: .1),
            pw.Divider(height: .2),
            pw.Divider(height: .3),
            pw.Divider(height: .4),
            pw.Divider(height: .5),
            pw.Divider(height: .6),
            pw.Divider(height: .7),
            // pw.Divider(height: .8),
            // pw.Divider(height: .9),
            // pw.Divider(height: .10),

            pw.SizedBox(height: 10),

            pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Column(children: <pw.Widget>[
                  pw.Text('SURAT KETERANGAN',
                      style: pw.TextStyle(
                          decoration: pw.TextDecoration.underline,
                          fontSize: 12),
                      textAlign: pw.TextAlign.center),
                  pw.Paragraph(
                      style: pw.TextStyle(fontSize: 12),
                      text: 'No. .............................',
                      textAlign: pw.TextAlign.center),
                ])),

            pw.SizedBox(height: 30),

            pw.Paragraph(
                text:
                    '             Yang bertanda tangan di bawah ini Ketua RT. 03 RW 09 Desa Sukadami Kecamatan Cikarang Selatan Kabupaten Bekasi dengan ini menerangkan bahwa :'),

            pw.Center(
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Table(children: [
                  pw.TableRow(children: [
                    pw.Text("Nama"),
                    pw.Paragraph(text: ":  " + fullName.text),
                  ]),
                  pw.TableRow(children: [
                    pw.Paragraph(text: "Tempat/Tgl. Lahir"),
                    pw.Text(":  " + dateOfBirth.text),
                  ]),
                  pw.TableRow(children: [
                    pw.Paragraph(text: "Jenis Kelamin"),
                    pw.Text(":  " + sex.text),
                  ]),
                  pw.TableRow(children: [
                    pw.Paragraph(text: "Pekerjaan"),
                    pw.Text(":  " + job.text),
                  ]),
                  pw.TableRow(children: [
                    pw.Paragraph(text: "Agama"),
                    pw.Text(":  " + religion.text),
                  ]),
                  pw.TableRow(children: [
                    pw.Paragraph(text: "Alamat"),
                    pw.Text(":  " + address.text),
                  ]),
                ]),
              ),
            ),
            pw.SizedBox(height: 10),

            pw.RichText(
                text: pw.TextSpan(
                    text: "             Orang tersebut diatas, adalah ",
                    children: <pw.TextSpan>[
                  pw.TextSpan(
                      text:
                          "benar-benar warga kami dan berkelakuan baik dimasyarakat",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.TextSpan(
                      text: ". Surat keterangan ini dibuat untuk keperluan ",
                      style: pw.TextStyle()),
                  pw.TextSpan(
                      text: "pengurusan SKCK.",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ])),

            pw.SizedBox(height: 10),

            pw.Paragraph(
                text:
                    '             Demikian surat keterangan ini kami buat, untuk dapat dipergunakan sebagai mana mestinya.'),

            pw.SizedBox(height: 10),

            pw.Stack(children: <pw.Widget>[
              pw.Container(
                  child: pw.Column(children: <pw.Widget>[
                pw.SizedBox(height: 13),
                pw.Text("Ketua RW 09"),
                pw.SizedBox(height: 50),
                pw.Text("................................",
                    style:
                        pw.TextStyle(decoration: pw.TextDecoration.underline)),
              ])),
              pw.Container(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Column(children: <pw.Widget>[
                    pw.Text(
                      "Kab. Bekasi, " +
                          DateFormat('d').format(date).toString() +
                          ' ' +
                          bulan +
                          ' ' +
                          DateFormat('yyyy').format(date).toString(),
                      textAlign: pw.TextAlign.left,
                      style: pw.TextStyle(),
                    ),
                    pw.Text("Ketua RT 03"),
                    pw.SizedBox(height: 50),
                    pw.Text("................................",
                        style: pw.TextStyle(
                            decoration: pw.TextDecoration.underline)),
                  ]))
            ]),

            // pw.Paragraph(
            //     text:
            //         'PDF was a proprietary format controlled by Adobe until it was released as an open standard on July 1, 2008, and published by the International Organization for Standardization as ISO 32000-1:2008, at which time control of the specification passed to an ISO Committee of volunteer industry experts. In 2008, Adobe published a Public Patent License to ISO 32000-1 granting royalty-free rights for all patents owned by Adobe that are necessary to make, use, sell, and distribute PDF compliant implementations.'),
            // pw.Paragraph(
            //     text:
            //         "PDF 1.7, the sixth edition of the PDF specification that became ISO 32000-1, includes some proprietary technologies defined only by Adobe, such as Adobe XML Forms Architecture (XFA) and JavaScript extension for Acrobat, which are referenced by ISO 32000-1 as normative and indispensable for the full implementation of the ISO 32000-1 specification. These proprietary technologies are not standardized and their specification is published only on Adobe's website. Many of them are also not supported by popular third-party implementations of PDF."),
            // pw.Paragraph(
            //     text:
            //         'On July 28, 2017, ISO 32000-2:2017 (PDF 2.0) was published. ISO 32000-2 does not include any proprietary technologies as normative references.'),
            // pw.Header(level: 1, text: 'Technical foundations'),
            // pw.Paragraph(text: 'The PDF combines three technologies:'),
            // pw.Bullet(
            //     text:
            //         'A subset of the PostScript page description programming language, for generating the layout and graphics.'),
            // pw.Bullet(
            //     text:
            //         'A font-embedding/replacement system to allow fonts to travel with the documents.'),
            // pw.Bullet(
            //     text:
            //         'A structured storage system to bundle these elements and any associated content into a single file, with data compression where appropriate.'),
            // pw.Header(level: 2, text: 'PostScript'),
            // pw.Paragraph(
            //     text:
            //         'PostScript is a page description language run in an interpreter to generate an image, a process requiring many resources. It can handle graphics and standard features of programming languages such as if and loop commands. PDF is largely based on PostScript but simplified to remove flow control features like these, while graphics commands such as lineto remain.'),
            // pw.Paragraph(
            //     text:
            //         'Often, the PostScript-like PDF code is generated from a source PostScript file. The graphics commands that are output by the PostScript code are collected and tokenized. Any files, graphics, or fonts to which the document refers also are collected. Then, everything is compressed to a single file. Therefore, the entire PostScript world (fonts, layout, measurements) remains intact.'),
            // pw.Column(
            //     crossAxisAlignment: pw.CrossAxisAlignment.start,
            //     children: <pw.Widget>[
            //       pw.Paragraph(
            //           text:
            //               'As a document format, PDF has several advantages over PostScript:'),
            //       pw.Bullet(
            //           text:
            //               'PDF contains tokenized and interpreted results of the PostScript source code, for direct correspondence between changes to items in the PDF page description and changes to the resulting page appearance.'),
            //       pw.Bullet(
            //           text:
            //               'PDF (from version 1.4) supports graphic transparency; PostScript does not.'),
            //       pw.Bullet(
            //           text:
            //               'PostScript is an interpreted programming language with an implicit global state, so instructions accompanying the description of one page can affect the appearance of any following page. Therefore, all preceding pages in a PostScript document must be processed to determine the correct appearance of a given page, whereas each page in a PDF document is unaffected by the others. As a result, PDF viewers allow the user to quickly jump to the final pages of a long document, whereas a PostScript viewer needs to process all pages sequentially before being able to display the destination page (unless the optional PostScript Document Structuring Conventions have been carefully complied with).'),
            //     ]),
            // pw.Header(level: 1, text: 'Content'),
            // pw.Paragraph(
            //     text:
            //         'A PDF file is often a combination of vector graphics, text, and bitmap graphics. The basic types of content in a PDF are:'),
            // pw.Bullet(
            //     text:
            //         'Text stored as content streams (i.e., not encoded in plain text)'),
            // pw.Bullet(
            //     text:
            //         'Vector graphics for illustrations and designs that consist of shapes and lines'),
            // pw.Bullet(
            //     text:
            //         'Raster graphics for photographs and other types of image'),
            // pw.Bullet(text: 'Multimedia objects in the document'),
            // pw.Paragraph(
            //     text:
            //         'In later PDF revisions, a PDF document can also support links (inside document or web page), forms, JavaScript (initially available as plugin for Acrobat 3.0), or any other types of embedded contents that can be handled using plug-ins.'),
            // pw.Paragraph(
            //     text:
            //         'PDF 1.6 supports interactive 3D documents embedded in the PDF - 3D drawings can be embedded using U3D or PRC and various other data formats.'),
            // pw.Paragraph(
            //     text:
            //         'Two PDF files that look similar on a computer screen may be of very different sizes. For example, a high resolution raster image takes more space than a low resolution one. Typically higher resolution is needed for printing documents than for displaying them on screen. Other things that may increase the size of a file is embedding full fonts, especially for Asiatic scripts, and storing text as graphics. '),
            // pw.Header(
            //     level: 1, text: 'File formats and Adobe Acrobat versions'),
            // pw.Paragraph(
            //     text:
            //         'The PDF file format has changed several times, and continues to evolve, along with the release of new versions of Adobe Acrobat. There have been nine versions of PDF and the corresponding version of the software:'),
            // pw.Table.fromTextArray(context: context, data: const <List<String>>[
            //   <String>['Date', 'PDF Version', 'Acrobat Version'],
            //   <String>['1993', 'PDF 1.0', 'Acrobat 1'],
            //   <String>['1994', 'PDF 1.1', 'Acrobat 2'],
            //   <String>['1996', 'PDF 1.2', 'Acrobat 3'],
            //   <String>['1999', 'PDF 1.3', 'Acrobat 4'],
            //   <String>['2001', 'PDF 1.4', 'Acrobat 5'],
            //   <String>['2003', 'PDF 1.5', 'Acrobat 6'],
            //   <String>['2005', 'PDF 1.6', 'Acrobat 7'],
            //   <String>['2006', 'PDF 1.7', 'Acrobat 8'],
            //   <String>['2008', 'PDF 1.7', 'Acrobat 9'],
            //   <String>['2009', 'PDF 1.7', 'Acrobat 9.1'],
            //   <String>['2010', 'PDF 1.7', 'Acrobat X'],
            //   <String>['2012', 'PDF 1.7', 'Acrobat XI'],
            //   <String>['2017', 'PDF 2.0', 'Acrobat DC'],
            // ]),
            // pw.Padding(padding: const pw.EdgeInsets.all(10)),
            // pw.Paragraph(
            //     text:
            //         'Text is available under the Creative Commons Attribution Share Alike License.')
          ]));

  return doc.save();
}
