import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:kafiil_test/constants.dart';
import 'package:kafiil_test/core/utils/dioHelper.dart';
import 'package:kafiil_test/feature/home_page/presentation/manager/home_page/home_page_state.dart';
import 'package:kafiil_test/feature/home_page/presentation/views/widget/countries/countries.dart';
import 'package:kafiil_test/feature/home_page/presentation/views/widget/services/services.dart';
import 'package:kafiil_test/feature/home_page/presentation/views/widget/who_i_am/who_i_am.dart';


class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitState());
  static HomePageCubit get(context) => BlocProvider.of(context);
  int indexOfBottomNzvBar = 0;
  bool darkMode = false;
  List states = ["0"];
  List title = [
    "Who I Am",
    "Countries",
    "Services",
  ];
  List<Widget> screens = [
    const WhoIAm(),
    const Countries(),
    const Services(),
    // settings(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Profile),
      label: 'Who I Am',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.map),
      label: 'Countries',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Services',
    ),
  ];

  void changeIndex({required index}) {
    indexOfBottomNzvBar = index;
    emit(HomePageBottomNavIndexState());
  }

  late Map<String, dynamic> businessData;
  void getBusiness(Map<String, dynamic> apiBody) {
    print(states.length);
    print(apiBody);
    emit(GetBusinessLoadingState());
    dioHelper
        .getData(
      url: urlMethod,
      queryParameter: apiBody,
    )
        .then((value) {
      print("get is done");
      businessData = value.data;
      print(businessData['totalResults']);
      emit(GetBusinessDataSuccessState());
      states.add('1');
      print(states.length);
    }).catchError((onError) {
      emit(GetBusinessDataErrorState(onError.toString()));
    });
    ;
  }

  late Map<String, dynamic> sportsData;
  void getSports(Map<String, dynamic> apiBody) {
    print(states.length);
    print(apiBody);
    dioHelper
        .getData(
      url: urlMethod,
      queryParameter: apiBody,
    )
        .then((value) {
      print("get is done");
      sportsData = value.data;
      print(sportsData['totalResults']);
      emit(GetSportsDataSuccessState());
      states.add('2');
      print(states.length);
    }).catchError((onError) {
      emit(GetSportsDataErrorState(onError.toString()));
    });
    ;
  }

  late Map<String, dynamic> scienceData;
  void getScience(Map<String, dynamic> apiBody) {
    print(states.length);
    print(apiBody);
    dioHelper
        .getData(
      url: urlMethod,
      queryParameter: apiBody,
    )
        .then((value) {
      print("get is done");
      scienceData = value.data;
      print(scienceData['totalResults']);
      emit(GetScienceDataSuccessState());
      states.add('3');
      print(states.length);
    }).catchError((onError) {
      emit(GetScienceDataErrorState(onError.toString()));
    });
    ;
  }

  late Map<String, dynamic> allData = {};
  void getAllData(String value) {
    allData.clear();
    dioHelper.getData(
      url: urlSearchMethod,
      queryParameter: {
        'q': value,
        'apiKey': '3d7b81f1a1e94dfaadb9eb5cde0a3d65',
      },
    ).then((value) {
      print("get is done");
      allData = value.data;
      print(allData['totalResults']);
      states.add('4');
      print(states.length);
    }).catchError((onError) {
      emit(GetAllDataErrorState(onError.toString()));
    });
  }

  Map<String, dynamic> searchData = {
    "status": "ok",
    "totalResults": 302,
    "articles": []
  };
  
}
