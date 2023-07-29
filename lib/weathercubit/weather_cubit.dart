import 'package:exlpore_egypt/drawer_screens/weather.dart';
import 'package:exlpore_egypt/weathercubit/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../shared/dio.dart';
import '../shared/weathermodel.dart';

class WeatherCubit extends Cubit<WeatherState>
{
  WeatherCubit():super(WeatherInitState());

  static WeatherCubit get(context)=>BlocProvider.of(context);

  //get location
  Future<dynamic> getLocationId()
  async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    try {
      _serviceEnabled = await location.serviceEnabled();
    } on PlatformException catch (err) {
      print ("Platform exception calling serviceEnabled(): $err");
      _serviceEnabled = false;
      getLocationId();
    }
    if (!_serviceEnabled) {
      getLocationId();
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        getLocationId();
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    return _locationData;
  }


  //get the weather by lat and lon
   WeatherModel ? modelLatAndLon;
  Future<dynamic> searchByLatAndLon(double ? lat,double? lon)
  {
    return DioHelper.getData(
        url: 'data/2.5/weather',
        query: {
          'lat':lat,
          'lon':lon,
          'appid':'c03011e05678ba0f0d74f5ca02d0dcf0',
          'units':'metric',
        }
    ).then((value) {
      var x =value.data['main']['temp'];
      var k=value.data['weather'][0]['main'];
      var z=value.data['weather'][0]['icon'];
      var l=value.data['name'];
      var p=value.data['sys']['country'];
      modelLatAndLon=WeatherModel(temp: x,name:l,status: k,image: z ,date: p);
      emit(WeatherGetting1Success());
    });
  }


  //call the function of get location then pass the location to get the weather
  void getWeatherData()
  {
    try
        {
          getLocationId().then(( value) {
            searchByLatAndLon(value.latitude, value.longitude);
            get7DaysWeather(value.latitude, value.longitude);
            emit(WeatherGettingSuccess());
          });
        }
        catch(error){
      print(error.toString());
        }
  }



  //get the weather for the next 7 days
  List<dynamic>list=[];
  String ? name;
  void get7DaysWeather(lat,lon)
  {
    DioHelper.getData(
      url:'data/2.5/onecall',
      query: {
        'appid':'c03011e05678ba0f0d74f5ca02d0dcf0',
        'units':'metric',
        'lat':lat,
        'lon':lon,
        'exclude':'current,minutely,hourly,alerts',
      }
    ).then((value) {
      list=value.data['daily'];
      name=value.data['timezone'];
      getDays(DateTime.now());
      emit(Weather7DaysSuccess());
    });
  }


  List<String> days=[];
  void getDays(DateTime date)
  {
    for(int i=0;i<7;i++)
      {
        String x='';
        String m=DateTime(date.year,date.month,date.day+i+1).toString();
        for(int j=0;j<10;j++)
          {
            x+=m[j];
          }
        days.add(x);
        x='';
      }
  }

}