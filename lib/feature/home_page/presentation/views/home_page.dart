import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_test/core/shared_components/size_box.dart';
import 'package:kafiil_test/feature/home_page/presentation/manager/home_page/home_page_cubit.dart';
import 'package:kafiil_test/feature/home_page/presentation/manager/home_page/home_page_state.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (BuildContext context, HomePageStates state) {},
      builder: (BuildContext context, HomePageStates state) {
        HomePageCubit cubit = HomePageCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("${cubit.title[cubit.indexOfBottomNzvBar]}"),
          ),
          body: cubit.screens[cubit.indexOfBottomNzvBar],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            fixedColor: Colors.green[800],
            onTap: (value) {
              cubit.changeIndex(index: value);
            },
            currentIndex: cubit.indexOfBottomNzvBar,
          ),
        );
      },
    );
  }
}
