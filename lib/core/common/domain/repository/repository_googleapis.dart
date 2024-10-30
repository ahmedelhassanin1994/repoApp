


import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/data/model/model_place.dart';
import 'package:mvvm_project/core/common/data/model/model_place_details.dart';
import 'package:mvvm_project/core/common/network/failure.dart';


abstract class RepositoryGoogleApis {

  Future<Either<Failure,Model_Place >> Autocomplete(String search);
  Future<Either<Failure,ModelPlaceDetails >> Autocomplete_details(String place_id);


}
