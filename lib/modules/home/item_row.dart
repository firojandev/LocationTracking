import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:log_my_location/common/styles/app_text_style.dart';
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

    DateTime dateTime = widget.itemModel.createdDateTime!;
    print(dateTime);
    String fDateTime = DateFormat.yMMMMEEEEd().format(dateTime);
    String formattedTime = DateFormat.jms().format(dateTime);
    return Card(
        margin: EdgeInsets.all(1.0),
        child: InkWell(
          child: Container(
            width: screenWidth - 36,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(fDateTime,style: AppTextStyle.TextTitleStyle),
                              Spacer(),
                              Text(formattedTime,style: AppTextStyle.TextTitleStyle),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 6.0, 10, 10.0),
                            child: Text(
                              widget.itemModel.address.toString(),
                              textAlign: TextAlign.start,
                              style: AppTextStyle.TextTitleStyle,
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
