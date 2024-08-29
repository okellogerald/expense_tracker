import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:budgetting_app/widgets/app_floating_action_button.dart';

import '../source.dart';

enum EditType { addingCategory, editingCategory }

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late final CategoriesPageBloc bloc;
  late final CategoriesService categoryService;
  late final PreferencesService prefsService;
  late final RecordsService recordsService;
  late final BudgetsService budgetsService;
  final editTypeNotifier = ValueNotifier<EditType>(EditType.addingCategory);

  @override
  void initState() {
    categoryService = Provider.of<CategoriesService>(context, listen: false);
    prefsService = Provider.of<PreferencesService>(context, listen: false);
    recordsService = Provider.of<RecordsService>(context, listen: false);
    budgetsService = Provider.of<BudgetsService>(context, listen: false);
    bloc = CategoriesPageBloc(
        categoryService, prefsService, recordsService, budgetsService);
    bloc.init();
    super.initState();
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

  Widget _buildLoading(List<Category> categoryList, CategoryForm form) {
    return const CircularProgressIndicator();
  }

  Widget _buildContent(List<Category> categoryList, CategoryForm form) {
    return Scaffold(
        body: ListView(padding: EdgeInsets.only(top: 50.dh), children: [
          _buildCategories('Income Categories',
              categoryList.where((e) => e.type == kIncome).toList(), form),
          SizedBox(height: 30.dh),
          _buildCategories('Expenses Categories',
              categoryList.where((e) => e.type == kExpense).toList(), form),
        ]),
        floatingActionButton: AppFloatingActionButton(
            onPressed: () => push(const CategoryEditPage())));
  }

  _buildCategories(
      String title, List<Category> categoryList, CategoryForm form) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 10.dw, bottom: 10.dh),
            child: AppText(title,
                size: 20.dw, color: AppColors.onBackground, family: kFontFam2)),
        Container(
            padding: EdgeInsets.symmetric(vertical: 10.dh),
            decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(15.dw)),
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: categoryList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  final category = categoryList[index];
                  return CategoryTile(
                    category: category,
                    cancelCallback: bloc.cancel,
                    editCallback: () => push(CategoryEditPage(category)),
                    isSelected: category.id == form.id,
                    isUndeletable:
                        form.undeletableCategories.contains(category.id),
                    changeSelectedIdCallback: bloc.updateId,
                    deleteCallback: bloc.deleteCategory,
                    showTopBorder: index != 0,
                    showBottomBorder: index != categoryList.length - 1,
                  );
                }))
      ],
    );
  }
}
