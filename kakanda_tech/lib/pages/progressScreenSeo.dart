import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kakanda_tech/model/course.dart';
import 'package:kakanda_tech/model/data/trasaction.dart';

import 'package:kakanda_tech/network/api.dart';
import 'package:kakanda_tech/pages/homeScreen.dart';
import 'package:kakanda_tech/widgets/themes.dart';

class ProgressScrennSeo extends StatefulWidget {
  @override
  State<ProgressScrennSeo> createState() => _ProgressScrennSeoState();
}

class _ProgressScrennSeoState extends State<ProgressScrennSeo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transaction Seo"),
        ),
        body: FutureBuilder<List<Transaction>>(
            future: Network().getDataTransactionSeo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                List<Transaction> transaction = snapshot.data!;
                return ListView.builder(
                  itemCount: transaction.length,
                  itemBuilder: (BuildContext context, index) {
                    // Course course = courseList[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          title: Text(
                            transaction[index].package.namaPackage,
                            style: titleTransaction,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                  'Status Pengerjaan : ' +
                                      transaction[index].workingStatus,
                                  style: statusTransaction),
                              new Text(
                                  'Status Pembayaran : ' +
                                      transaction[index].paymentStatus,
                                  style: statusTransaction),
                              new Text(
                                  'Proses : ' + transaction[index].persentase,
                                  style: statusTransaction),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('galgal'),
                );
              }
            }));
  }
}
