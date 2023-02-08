import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/app_constants.dart';
import '../../main.dart';
import '../home/ItemModel.dart';
import '../home/item_container.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key, required this.initialIndex}) : super(key: key);

  final int initialIndex;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialIndex);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8,8,8,16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.lightBlue,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: "All",),
                  Tab(text: "Today",),
                ],
              ),
            ),
            Expanded(
              child: Padding(padding: EdgeInsets.only(top: 10),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Center(
                      child: itemBuilder(),
                    ),
                    Center(
                      child: itemBuilder(),
                    ),
                  ],
                ),),
            ),
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
