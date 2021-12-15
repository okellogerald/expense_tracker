import '../source.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late final CategoryPageBloc bloc;
  late final CategoriesService service;
  late final OverlayState overlayState;
  late final OverlayEntry overlayEntry;

  @override
  void initState() {
    service = Provider.of<CategoriesService>(context, listen: false);
    bloc = CategoryPageBloc(service);
    bloc.init();
    overlayState = Overlay.of(context)!;
    overlayEntry = _popUpMenuOverlayEntry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryPageBloc, CategoryPageState>(
      bloc: bloc,
      builder: (_, state) {
        return state.when(loading: _buildLoading, content: _buildContent);
      },
    );
  }

  Widget _buildLoading(List<Category> categoryList) {
    return const CircularProgressIndicator();
  }

  Widget _buildContent(List<Category> categoryList, String selectedId) {
    return WillPopScope(
      onWillPop: _handleWillPop,
      child: ListView(children: [
        _buildAddCategoryTile(),
        _buildIncomeCategories(categoryList, selectedId),
        _buildExpenseCategories(categoryList, selectedId),
      ]),
    );
  }

  Future<bool> _handleWillPop() async {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
      return false;
    }
    return true;
  }

  _buildAddCategoryTile() {
    return Column(
      children: [
        SizedBox(height: 30.dh),
        AppText('You can always add your custom category',
            size: 16.dw, color: AppColors.textColor),
        AppTextButton(
          onPressed: _insertCustomSheet,
          withIcon: true,
          text: 'Add Category',
          margin: EdgeInsets.only(top: 10.dh, bottom: 40.dh),
          width: 200.dw,
          height: 40.dw,
          icon: Icons.add,
          textColor: Colors.black,
          buttonColor: AppColors.primaryColor,
        )
      ],
    );
  }

  _buildIncomeCategories(List<Category> categoryList, String selectedId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.dw, bottom: 5.dh),
          child: AppText('Income Categories',
              size: 20.dw, color: AppColors.textColor2),
        ),
        Container(
            color: AppColors.secondaryColor,
            child: Column(
                children: categoryList
                    .where((e) => e.type == cIncome)
                    .map((e) => CategoryTile(
                          category: e,
                          editCallback: _insertCustomSheet,
                          isSelected: e.id == selectedId,
                          cancelCallback: bloc.cancel,
                          changeSelectedIdCallback: bloc.changeSelectedId,
                          deleteCallback: bloc.delete,
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
          padding: EdgeInsets.only(left: 10.dw, bottom: 5.dh, top: 20.dh),
          child: AppText('Expenses Categories',
              size: 20.dw, color: AppColors.textColor2),
        ),
        Container(
            color: AppColors.secondaryColor,
            child: Column(
                children: categoryList
                    .where((e) => e.type == cExpense)
                    .map((e) => CategoryTile(
                          category: e,
                          cancelCallback: bloc.cancel,
                          editCallback: _insertCustomSheet,
                          isSelected: e.id == selectedId,
                          changeSelectedIdCallback: bloc.changeSelectedId,
                          deleteCallback: bloc.delete,
                        ))
                    .toList()))
      ],
    );
  }

  OverlayEntry _popUpMenuOverlayEntry() {
    return OverlayEntry(builder: (_) => _buildSheetChild());
  }

  _buildSheetChild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            child: GestureDetector(
          onTap: overlayEntry.remove,
          child: Container(color: Colors.black.withOpacity(.75)),
        )),
        Material(
          child: Container(
            height: 600.dh,
            width: ScreenSizeConfig.getDeviceSize.width,
            color: AppColors.overlayColor,
            child: Padding(
              padding: EdgeInsets.all(10.dw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText('Adding Category',
                      color: AppColors.backgroundColor, size: 24.dw),
                  SizedBox(height: 30.dh),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _insertCustomSheet() {
    overlayState.insert(overlayEntry);
  }
}
