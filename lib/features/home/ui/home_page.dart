import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:openweather/core/injections/injection.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';

import 'widgets/mobile/home_page.dart';
import 'widgets/web/home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(repository: getIt()),
      child: kIsWeb ? const HomePageWeb() : const HomePageMobile(),
    );
  }
}
