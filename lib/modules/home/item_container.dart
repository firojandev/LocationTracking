import 'package:flutter/cupertino.dart';
import 'package:log_my_location/modules/home/ItemModel.dart';
import 'package:log_my_location/modules/home/item_row.dart';

class ItemContainer extends StatefulWidget {
  const ItemContainer({Key? key, required this.itemsList}) : super(key: key);

  final List<ItemModel> itemsList;

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.itemsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemRow(itemModel: widget.itemsList[index]);
        });
  }
}
