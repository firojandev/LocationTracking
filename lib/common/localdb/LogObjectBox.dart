import 'dart:io';
import 'package:log_my_location/common/app_constants.dart';
import 'package:log_my_location/modules/home/ItemModel.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../objectbox.g.dart';

class LogObjectBox {
  late final Store store;

  late final Box<ItemModel> _itemModelBox;

  LogObjectBox._create(this.store) {
    _itemModelBox = Box<ItemModel>(store);
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<LogObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
        directory: p.join(docsDir.path, AppConstants.app_db_name));
    return LogObjectBox._create(store);
  }

  //Remove all the data
  static void removeAllData() async {
    final docsDir = await getApplicationDocumentsDirectory();
    Directory(docsDir.path + '/' + AppConstants.app_db_name).delete().then(
            (FileSystemEntity value) => print("DB Deleted: ${value.existsSync()}"));
  }

  void saveItem(ItemModel itemModel) async {
    _itemModelBox.putAsync(itemModel);
  }

  List<ItemModel> getItems(int count) {
    final builder = _itemModelBox.query().order(ItemModel_.id,flags: Order.descending);
    Query<ItemModel> query = builder.build();
    if(count == 999){
      //return all the items on the table
      return query.find();
    }
    return query.find().take(count).toList();
  }


}