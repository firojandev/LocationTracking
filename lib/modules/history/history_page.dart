import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/app_constants.dart';
import '../../main.dart';
import '../home/ItemModel.dart';
import '../home/item_container.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0,10,0,0),
            ),
            Expanded(child: itemBuilder()),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<ItemModel>> itemBuilder() {
    return FutureBuilder<List<ItemModel>>(
      future: items(),
      builder: (BuildContext context, AsyncSnapshot<List<ItemModel>> snapshot) {
        if (snapshot.hasData) {
          return ItemContainer(itemsList: snapshot.data!);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<ItemModel>> items() async {
    List<ItemModel> savedItemsList =
    logObjectBox.getItems(AppConstants.itemFeedAll);
    return savedItemsList;
  }

}
