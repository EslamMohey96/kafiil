abstract class HomePageStates {}

class HomePageInitState extends HomePageStates {}

class HomePageBottomNavState extends HomePageStates {}

class HomePageBottomNavIndexState extends HomePageStates {}

class GetBusinessDataSuccessState extends HomePageStates {}

class GetBusinessDataErrorState extends HomePageStates {
  late final String error;
  GetBusinessDataErrorState(this.error) {
    print(error);
  }
}

class GetBusinessLoadingState extends HomePageStates {}

class GetSportsDataSuccessState extends HomePageStates {}

class GetSportsDataErrorState extends HomePageStates {
  late final String error;
  GetSportsDataErrorState(this.error) {
    print(error);
  }
}

class GetSportsLoadingState extends HomePageStates {}

class GetScienceDataSuccessState extends HomePageStates {}

class GetScienceDataErrorState extends HomePageStates {
  late final String error;
  GetScienceDataErrorState(this.error) {
    print(error);
  }
}

class GetScienceLoadingState extends HomePageStates {}

class GetAllDataSuccessState extends HomePageStates {}

class GetAllDataErrorState extends HomePageStates {
  late final String error;
  GetAllDataErrorState(this.error) {
    print(error);
  }
}

class GetAllLoadingState extends HomePageStates {}

