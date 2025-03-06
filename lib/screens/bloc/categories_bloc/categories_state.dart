abstract class CategoriesState{}
class CategoriesInitialState extends CategoriesState{}
class CategoriesLoadingState extends CategoriesState{}
class CategoriesLoadedState extends CategoriesState{
  List<dynamic> categoriesList;
  CategoriesLoadedState({required this.categoriesList});
}
class CategoriesErrorState extends CategoriesState{
  String errorMsg;
  CategoriesErrorState({required this.errorMsg});
}