// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'modules/home/ItemModel.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 5100361755899701873),
      name: 'ItemModel',
      lastPropertyId: const IdUid(5, 1737134456051454259),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4024640307289354307),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3201626211204898680),
            name: 'lat',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6257569658240770878),
            name: 'lng',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3037369062315407584),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1737134456051454259),
            name: 'createdDateTime',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 5100361755899701873),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ItemModel: EntityDefinition<ItemModel>(
        model: _entities[0],
        toOneRelations: (ItemModel object) => [],
        toManyRelations: (ItemModel object) => {},
        getId: (ItemModel object) => object.id,
        setId: (ItemModel object, int id) {
          object.id = id;
        },
        objectToFB: (ItemModel object, fb.Builder fbb) {
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addFloat64(1, object.lat);
          fbb.addFloat64(2, object.lng);
          fbb.addOffset(3, addressOffset);
          fbb.addInt64(4, object.createdDateTime?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final createdDateTimeValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final object = ItemModel(
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 6, 0),
              const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0),
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              createdDateTimeValue == null
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(createdDateTimeValue))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ItemModel] entity fields to define ObjectBox queries.
class ItemModel_ {
  /// see [ItemModel.id]
  static final id = QueryIntegerProperty<ItemModel>(_entities[0].properties[0]);

  /// see [ItemModel.lat]
  static final lat = QueryDoubleProperty<ItemModel>(_entities[0].properties[1]);

  /// see [ItemModel.lng]
  static final lng = QueryDoubleProperty<ItemModel>(_entities[0].properties[2]);

  /// see [ItemModel.address]
  static final address =
      QueryStringProperty<ItemModel>(_entities[0].properties[3]);

  /// see [ItemModel.createdDateTime]
  static final createdDateTime =
      QueryIntegerProperty<ItemModel>(_entities[0].properties[4]);
}