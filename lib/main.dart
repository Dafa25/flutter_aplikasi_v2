import 'package:flutter/material.dart';
import 'package:flutter_aplikasi/api_provider.dart';
import 'package:flutter_aplikasi/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Apiprovider apiprovider = Apiprovider();
  late Future<List<User>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = apiprovider.getallData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("mini project"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder<List<User>>(
                future: listData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<User> isiData = snapshot.data!;
                    return ListView.builder(
                      itemCount: isiData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(isiData[index].nama),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(isiData[index].avatar),
                            ),
                            subtitle: Text(isiData[index].email),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(45),
            ),
            onPressed: () {
              tambahData();
            },
            child: Text("Create User"),
          ),
        ],
      ),
    ));
  }

// tambah data
  void tambahData() async {
    bool response = await apiprovider.postData(
        "pnama", "pavatar", "palamat", "pemail", "ppekerjaan", "pquote");
    if (response == true) {
      setState(() {
        listData = apiprovider.getallData();
      });
    }
  }
}
