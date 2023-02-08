import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:log_my_location/modules/home/ItemModel.dart';

class ItemRow extends StatefulWidget {
  const ItemRow({Key? key, required this.itemModel}) : super(key: key);

  final ItemModel itemModel;

  @override
  State<ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<ItemRow> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
        elevation: 8,
        margin: EdgeInsets.all(8.0),
        child: InkWell(
          child: Container(
            width: screenWidth - 36,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10, 0.0),
                            child: Text(widget.itemModel.createdDateTime.toString(),
                                textAlign: TextAlign.start)),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 6.0, 10, 10.0),
                            child: Text(
                              widget.itemModel.address.toString(),
                              textAlign: TextAlign.start
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {

          },
        ));
  }
}
