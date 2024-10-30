

import 'package:hive_flutter/hive_flutter.dart';
part 'repos_entities.g.dart';

@HiveType(typeId: 1)
class ReposEntities{
 @HiveField(0)
 late int id;
 @HiveField(1)
 late String name;
 @HiveField(2)
 late String full_name;
 @HiveField(3)
 late String description;

 ReposEntities(this.id, this.name, this.full_name, this.description);

 @override
 bool operator ==(Object other) =>
     identical(this, other) ||
         other is ReposEntities &&
             runtimeType == other.runtimeType &&
             id == other.id &&
             name == other.name;

 @override
 int get hashCode => id.hashCode ^ name.hashCode;

 @override
 String toString() => 'ReposEntities(id: $id, name: $name)';
}