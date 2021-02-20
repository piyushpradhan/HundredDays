import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:hive/hive.dart';
import 'package:hundreddays/models/task.dart';
import 'package:hundreddays/providers/bottom_nabigation_bar_provider.dart';
import 'package:hundreddays/providers/task_provider.dart';
import 'package:hundreddays/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  Hive.registerAdapter(TaskAdapter());
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BottomNavigationBarProvider>(create: (_) => BottomNavigationBarProvider(),),
        Provider<TaskProvider>(create: (_) => TaskProvider(),),
      ],
      child: MaterialApp(
        title: '100daysofstuff',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
            create: (_) => BottomNavigationBarProvider(),
            builder: (BuildContext context, _) {
              return CustomBottomNavigationBar();
            },
          )
      ),
    );
  }
}