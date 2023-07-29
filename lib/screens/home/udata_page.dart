import 'package:companion_app_main/models/udata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:companion_app_main/screens/home/udata_list.dart';
import 'package:companion_app_main/models/auser.dart';
import 'package:companion_app_main/services/database.dart';

class UdataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auser? currentUser = Provider.of<Auser?>(context);
    final String uid = currentUser?.uid ?? '';

    return StreamProvider<List<Udata>>.value(
      initialData: [],
      value: DatabaseService(uid: uid).udata,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Make new friends'),
        ),
        body: UdataList(),
      ),
    );
  }
}
