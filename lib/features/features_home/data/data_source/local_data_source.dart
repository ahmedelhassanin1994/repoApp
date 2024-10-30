import 'package:hive/hive.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/common/data/model/model_cache.dart';

abstract class LocalDataSource {
  Future<Box> Openbox();
  Future<Model_Cache> getCache();
  Future<void> AddCache(Model_Cache modelcache);
  Future<void> deleteLocal(var tittle);
}

class LocalDataSourceImplementer implements LocalDataSource {
  @override
  Future<void> AddCache(Model_Cache modelcache) async {
    // TODO: implement AddCache
    final box = await Openbox();
    await box.add(modelcache);
  }

  @override
  Future<Box> Openbox() async {
    // TODO: implement Openbox
    var box = await Hive.openBox<Model_Cache>(Constant.localKey);
    return box;
  }

  @override
  Future<void> deleteLocal(tittle) async {
    // TODO: implement deleteLocal

    final box = await Openbox();
    final Map<dynamic, dynamic> deliveriesMap = box.toMap();
    dynamic desiredKey;
    if (deliveriesMap.isNotEmpty) {
      deliveriesMap.forEach((key, value) {
        if (value.key == tittle) {
          desiredKey = key;
        }
      });
      box.delete(desiredKey);
    }
  }

  @override
  Future<Model_Cache> getCache() async {
    // TODO: implement getCache
    final box = await Openbox();
    List<Model_Cache> model = box.values.cast<Model_Cache>().toList();
    Model_Cache model_cache=  model.where((element) => element.key.toString().contains("${Constant.localKey}")).first;
    return model_cache;
  }
}
