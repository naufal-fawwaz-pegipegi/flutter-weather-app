import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app_test/weather/presentation/weather/weather_cubit.dart';
import 'package:web_app_test/weather/presentation/weather/weather_state.dart';

class WeatherPage extends StatefulWidget {
  final String title;

  WeatherPage({Key? key, required this.title});

  @override
  State createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late TextEditingController _controller;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Text("Enter location: "),
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Input location"),
                        controller: _controller,
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<WeatherCubit>()
                              .getWeather(_controller.text);
                        },
                        child: Text("Submit"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                if (state is WeatherLoadingState) ...[
                  CircularProgressIndicator(),
                ] else if (state is WeatherSuccessState) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text("Condition: "),
                      ),
                      Flexible(
                        child: Text(state.weather.main.toString()),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text("Description: "),
                      ),
                      Flexible(
                        child: Text(state.weather.desc.toString()),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text("Temperature: "),
                      ),
                      Flexible(
                        child: Text(state.weather.temp.toString()),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text("Location: "),
                      ),
                      Flexible(
                        child: Text(state.weather.loc.toString()),
                      )
                    ],
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
