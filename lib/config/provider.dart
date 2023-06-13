import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../src/controller/home_provider.dart';

class AppProvider {
  List<SingleChildWidget> get provider => _provider;
  final List<SingleChildWidget> _provider = [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ];
}
