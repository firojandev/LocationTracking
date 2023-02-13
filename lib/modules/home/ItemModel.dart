import 'package:objectbox/objectbox.dart';

@Entity()
class ItemModel {
  @Id()
  int id = 0;

  double lat = 0.0;
  double lng = 0.0;

  String? address;

  @Property(type: PropertyType.dateNano)
  DateTime? createdDateTime;

  int day = 0;
  int month = 0;
  int year = 0;

  ItemModel(this.lat, this.lng, this.address, this.createdDateTime,this.day,this.month,this.year);
}
