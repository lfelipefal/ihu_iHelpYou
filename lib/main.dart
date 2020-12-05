import 'package:flutter/material.dart';
import 'package:mktp_service/models/home_manager.dart';
import 'package:mktp_service/models/professional_model.dart';
import 'package:mktp_service/models/user_models.dart';
import 'package:mktp_service/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/favourite_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initializaParse();
  //setupLocators();
  runApp(MyApp());
}
/*
void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializaParse() async {
  await Parse().initialize(
    'Jwqkw6dbQvWG8KCO6ltvs3Bdi9DnxUSaMuGDqv7j',
    'https://parseapi.back4app.com/',
    clientKey: 'Vjnm1LYkpD1J1P8K63iTL7VFWSpooDh2UfCcTy9e',
    autoSendSessionId: true,
    debug: true,
  );
}
*/
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfessionalModel(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
      ],
      child: ScopedModel<UserModel>(
          model: UserModel(),
          child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model){
                return ScopedModel<FavoriteModel>(
                  model: FavoriteModel(model),
                  child: MaterialApp(
                      title: 'iHelpYou!',
                      theme: ThemeData(
                          primarySwatch: Colors.blue,
                          primaryColor: Color.fromARGB(255,4,125,141)
                      ),
                      debugShowCheckedModeBanner: false,
                      home: SplashIhuScreen()
                    //HomeScreen()
                  ),
                );
              }
          )
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:mktp_service/models/home_manager.dart';
import 'package:mktp_service/models/professional_model.dart';
import 'package:mktp_service/models/user_models.dart';
import 'package:mktp_service/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'models/favourite_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initializaParse();
  //setupLocators();
  runApp(MyApp());
}
/*
void setupLocators(){
  GetIt.I.registerSingleton(PageStore());
}

Future<void> initializaParse() async {
  await Parse().initialize(
    'Jwqkw6dbQvWG8KCO6ltvs3Bdi9DnxUSaMuGDqv7j',
    'https://parseapi.back4app.com/',
    clientKey: 'Vjnm1LYkpD1J1P8K63iTL7VFWSpooDh2UfCcTy9e',
    autoSendSessionId: true,
    debug: true,
  );
}
*/
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfessionalModel(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
      ],
      child: ScopedModel<UserModel>(
          model: UserModel(),
          child: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return ScopedModel<FavoriteModel>(
                model: FavoriteModel(model),
                child: MaterialApp(
                    title: 'iHelpYou!',
                    theme: ThemeData(
                        primarySwatch: Colors.blue,
                        primaryColor: Color.fromARGB(255,4,125,141)
                    ),
                    debugShowCheckedModeBanner: false,
                    home: HomeScreen()

                ),
              );
            }
          )
      ),
    );
  }
}

 */