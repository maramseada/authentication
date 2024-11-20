import 'package:flutter/cupertino.dart';

double getResponsiveFontSize(BuildContext context, {required double fontSize}){
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize *0.8;
  double upperLimit = fontSize *1.5;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);

}
double getScaleFactor(BuildContext context ){
  double width = MediaQuery.sizeOf(context).width;


  if (width<600){
    return width/400;

  }else if (width<900){
    return width/700;

  }else{
    return width/1000;
  }
}