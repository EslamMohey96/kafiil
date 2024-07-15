import 'package:firebase_core/firebase_core.dart';
import 'package:kafiil_test/core/utils/dioHelper.dart';
import 'package:kafiil_test/feature/home_page/presentation/manager/home_page/home_page_cubit.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_test/constants.dart';
import 'package:kafiil_test/core/utils/bloc_observer.dart';
import 'package:kafiil_test/core/utils/cacheHelper.dart';
import 'package:kafiil_test/feature/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:kafiil_test/feature/login/presentation/views/login_view.dart';
import 'package:kafiil_test/feature/register/presentation/manager/register_cubit/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
      (value) => print("done ${Firebase.app().options.projectId.toString()}"));

  Bloc.observer = HandelBlocObserver();
  dioHelper.init();
  await cacheHelper.init();

// Widget startPage;
//   // uIdConst = cacheHelper.getData(key: 'uId') ?? '';
//   // bool? isLogin = uIdConst == '' ? false : true;
//   // if (uIdConst == '') {
//   //   startPage = LoginView();
//   // } else {
//   //   // startPage = socialLayout();
//   // }
//   startPage = const LoginView();
//   runApp(MyApp(
//     startPage,
//   ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              HomePageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kafiil Test',
        theme: ThemeData.light(),
        home: const LoginView(),
      ),
    );
  }
}
