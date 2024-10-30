



import 'package:mvvm_project/features/features_home/data/mapper/mapper_home.dart';

extension NonNullString on String?{

  String orEmpty(){
    if(this == null){
      return EMPTY;

    }else


    return this!;
  }
}

extension NonNullInteger on int?{
  int orZero(){
    // print("data : ${this}");

    if(this == null){
      return ZERO;

    }else
      return this!;
  }
}

extension NonNullDouble on double?{
  double orDouble(){
    if(this == null){
      return Double;

    }else
      return this!;
  }
}


extension NonNullBool on bool?{
  bool orBool(){
    if(this == null){
      return STATUS;

    }else
      return this!;
  }
}