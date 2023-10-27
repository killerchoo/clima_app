import 'dart:ui';

import 'package:clima/bloc/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/aligment.dart';
import '../widgets/textstyle.dart';
import '../widgets/weathericon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, kToolbarHeight * 1.2, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CircularAligment(),
              CircularAligment(aligment: AlignmentDirectional(-3, -0.3)),
              RectangularAligment(),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherBlocSucces) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('📍${state.weather.areaName}',
                              style: createCustomTextStyle(
                                  fontWeight: FontWeight.w800)),
                          const SizedBox(height: 8),
                          Text('Good Morning',
                              style: createCustomTextStyle(fontSize: 30)),
                          getweatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}° C',
                              style: createCustomTextStyle(fontSize: 55),
                            ),
                          ),
                          Center(
                            child: Text(
                                state.weather.weatherMain!.toUpperCase(),
                                style: createCustomTextStyle(fontSize: 30)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                                DateFormat('EEEE dd . ')
                                    .add_jm()
                                    .format(state.weather.date!),
                                style: createCustomTextStyle()),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/11.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text('SUNRISE',
                                                style: createCustomTextStyle()),
                                          ),
                                          Text(
                                              DateFormat('').add_jm().format(
                                                  state.weather.sunrise!),
                                              style: createCustomTextStyle())
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/12.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text('SUNSET',
                                            style: createCustomTextStyle()),
                                        Text(
                                            DateFormat('')
                                                .add_jm()
                                                .format(state.weather.sunset!),
                                            style: createCustomTextStyle())
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/13.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text('TEMP MAX',
                                          style: createCustomTextStyle()),
                                      Text(
                                          '${state.weather.tempMax!.celsius!.round()} °C',
                                          style: createCustomTextStyle())
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/14.png',
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text('TEMP LOW',
                                          style: createCustomTextStyle()),
                                      Text(
                                          '${state.weather.tempMax!.celsius!.round()} °C',
                                          style: createCustomTextStyle())
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
