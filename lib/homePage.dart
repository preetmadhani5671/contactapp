import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List name = ["Dad", "Bhai", "Ben", "Home", "Dada"];
  List no = [
    "9979615575",
    "9712617142",
    "9265725908",
    "9913890184",
    "8238279254",
  ];
  TextEditingController txtname = TextEditingController();
  TextEditingController txtno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CONTACT LIST",style: GoogleFonts.podkova(),),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Add Contact"),
                          content: SizedBox(
                            height: 250,
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Name"),
                                  controller: txtname,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Mobile Nuber"),
                                  controller: txtno,
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        name.add(txtname.text);
                                        no.add(txtno.text);
                                        txtno = TextEditingController(text: '');
                                        txtname =
                                            TextEditingController(text: '');
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("Save")),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: Icon(Icons.add),
                tooltip: "Add Contact"),
          ],
        ),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Are You Sure Delete ?"),
                          content: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      name.removeAt(index);
                                      no.removeAt(index);
                                    });
                                  },
                                  child: Text("Delete"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red)),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text("Cancel"),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue)),
                            ],
                          ),
                        );
                      });
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                  ),
                  title: Text("${name[index]}"),
                  subtitle: Text("${no[index]}"),
                  trailing: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse("tel: +91 ${no[index]}"));
                            },
                            icon: Icon(Icons.call),
                            color: Colors.green),
                        IconButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse("sms: +91 ${no[index]}"));
                            },
                            icon: Icon(Icons.sms),
                            color: Colors.blue),
                        IconButton(
                            onPressed: () async {
                              await Share.share("${name[index]}");
                            },
                            icon: Icon(Icons.share),
                            color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
