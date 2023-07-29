import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:exlpore_egypt/weathercubit/weather_cubit.dart';
import 'package:exlpore_egypt/weathercubit/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Weather extends StatelessWidget {
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubit()..getWeatherData(),
      child: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherGetting1Success) {
            color = Colors.deepOrange;
          }
        },
        builder: (context, state) {
          var model = WeatherCubit.get(context).modelLatAndLon;
          var list = WeatherCubit.get(context).list;
          var days = WeatherCubit.get(context).days;
          var cubit = WeatherCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 10,
              flexibleSpace: const Image(
                image: AssetImage('images/appbar.jpg'),
                fit: BoxFit.cover,
              ),
              title: const Text(
                'Weather',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: model == null || list.isEmpty
                  ? const Center(
                      child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ))
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            weatherItem(model),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children:  [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 7,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                   Text(
                                    'Next 7 days  Weather',
                                    style: TextStyle(
                                        color: defaultColor2,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 262,
                              child: ListView.separated(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    weatherItemList(model, index, days, list),
                                separatorBuilder: (context, index) => Container(
                                  width: 4,
                                ),
                                itemCount: 7,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
