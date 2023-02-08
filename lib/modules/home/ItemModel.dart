import 'package:objectbox/objectbox.dart';

@Entity()
class ItemModel {
  @Id()
  int id = 0;

  double lat = 0.0;
  double lng = 0.0;

  String? address;

  @Property(type: PropertyType.date)
  DateTime? createdDateTime;

  ItemModel(this.lat, this.lng, this.address, this.createdDateTime);
}
