

import 'package:hive_flutter/hive_flutter.dart';
part 'commits_entities.g.dart';



@HiveType(typeId: 2)
class CommitsEntities{
  @HiveField(0)
  late String sha;
  @HiveField(1)
  late String nodeId;
  @HiveField(2)
  late String url;
  @HiveField(3)
  late String msg;
  @HiveField(4)
  late int count;

 CommitsEntities(this.sha, this.nodeId, this.url, this.msg, this.count);


}