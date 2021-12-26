import '../source.dart';

enum EditType { addingCategory, editingCategory }

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late final CategoriesPageBloc bloc;
  late final CategoriesService categoryService;
  late final PreferencesService prefsService;
  final editTypeNotifier = ValueNotifier<EditType>(EditType.addingCategory);

  @override
  void initState() {
    categoryService = Provider.of<CategoriesService>(context, listen: false);
    prefsService = Provider.of<PreferencesService>(context, listen: false);
    bloc = CategoriesPageBloc(categoryService, prefsService);
    bloc.init();
    super.initState();
  }

  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesPageBloc, CategoriesPageState>(
      bloc: bloc,
      builder: (_, state) {
        return state.when(
            loading: _buildLoading,
            content: _buildContent,
            success: _buildContent);
      },
    );
  }

  Widget _buildLoading(List<Category> categoryList, Supplements supplements) {
    return const CircularProgressIndicator();
  }

  Widget _buildContent(List<Category> categoryList, Supplements supplements) {
    final isAtTheTop = supplements.position == AddCategoryWidgetPosition.top;

    return ListView(padding: EdgeInsets.only(top: 30.dh), children: [
      isAtTheTop ? _buildAddCategoryTile(supplements) : Container(),
      isAtTheTop ? Container() : SizedBox(height: 20.dh),
      _buildIncomeCategories(categoryList, supplements.id),
      _buildExpenseCategories(categoryList, supplements.id),
      isAtTheTop ? Container() : _buildAddCategoryTile(supplements),
    ]);
  }

  _buildAddCategoryTile(Supplements supplements) {
    return AddCategoryWidget(
      onPressed: _navigateToEditPage,
      whereToShowCallback: bloc.updatePosition,
      position: supplements.position,
    );
  }

  _buildIncomeCategories(List<Category> categoryList, String selectedId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.dw, bottom: 5.dh),
          child: AppText('Income Categories',
              size: 20.dw, color: appColors.textColor),
        ),
        Container(
            color: appColors.backgroundColor2,
            child: Column(
                children: categoryList
                    .where((e) => e.type == kIncome)
                    .map((e) => CategoryTile(
                          category: e,
                          editCallback: () => _navigateToEditPage(category: e),
                          isSelected: e.id == selectedId,
                          cancelCallback: bloc.cancel,
                          changeSelectedIdCallback: bloc.updateId,
                          deleteCallback: bloc.deleteCategory,
                        ))
                    .toList()))
      ],
    );
  }

  _buildExpenseCategories(List<Category> categoryList, String selectedId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.dw, bottom: 5.dh, top: 30.dh),
          child: AppText('Expenses Categories',
              size: 20.dw, color: appColors.textColor),
        ),
        Container(
            color: appColors.backgroundColor2,
            child: Column(
                children: categoryList
                    .where((e) => e.type == kExpense)
                    .map((e) => CategoryTile(
                          category: e,
                          cancelCallback: bloc.cancel,
                          editCallback: () => _navigateToEditPage(category: e),
                          isSelected: e.id == selectedId,
                          changeSelectedIdCallback: bloc.updateId,
                          deleteCallback: bloc.deleteCategory,
                        ))
                    .toList()))
      ],
    );
  }

  _navigateToEditPage({Category? category}) =>
      CategoryEditPage.navigateTo(context, category: category);
}
