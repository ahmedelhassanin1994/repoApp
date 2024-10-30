

enum LanguageType{
  ENGLISH,
  ARABIC
}

enum CurrencyType{
  USD,
  SAR
}

const String Arabic="ar";
const String English="en";

// CURRENCY
const String USD="USD";
const String SAR="SAR";

extension LanguageTypeExtension on LanguageType{

  String getValue(){
    switch(this){
      case LanguageType.ENGLISH:

        return English;

      case LanguageType.ARABIC:

        return Arabic;
    }
  }
}

extension CurrencyTypeExtension on CurrencyType{

  String getValue(){
    switch(this){
      case CurrencyType.USD:

        return USD;

      case CurrencyType.SAR:

        return SAR;
    }
  }
}