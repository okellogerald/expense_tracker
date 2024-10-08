import 'package:expense_tracker/widgets/amount_text_field.dart';

import '../source.dart';
import '../widgets/app_top_bar.dart';

class BudgetEditPage extends StatefulWidget {
  const BudgetEditPage({this.budget, super.key});

  final Budget? budget;

  static void navigateTo(BuildContext context, {Budget? budget}) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BudgetEditPage(budget: budget)));

  @override
  State<BudgetEditPage> createState() => _BudgetEditPageState();
}

class _BudgetEditPageState extends State<BudgetEditPage> {
  late final BudgetEditPageBloc bloc;
  late final CategoriesService categoriesService;
  late final BudgetsService budgetsService;

  static var isEditing = false;

  @override
  void initState() {
    isEditing = widget.budget != null;
    categoriesService = Provider.of<CategoriesService>(context, listen: false);
    budgetsService = Provider.of<BudgetsService>(context, listen: false);
    bloc = BudgetEditPageBloc(categoriesService, budgetsService);
    bloc.init(budget: widget.budget);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<BudgetEditPageBloc, BudgetEditPageState>(
      bloc: bloc,
      listener: (_, state) {
        final hasSucceeded =
            state.maybeWhen(success: (_, __, ___) => true, orElse: () => false);
        if (hasSucceeded) Navigator.pop(context);
      },
      builder: (_, state) {
        return state.when(
          loading: _buildLoading,
          content: _buildContent,
          success: _buildContent,
        );
      },
    ));
  }

  Widget _buildLoading(
      List<Category> categoryList, List<String> idList, BudgetForm form) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(
      List<Category> categoryList, List<String> idList, BudgetForm form) {
    return SafeArea(
      child: Scaffold(
        appBar: AppTopBar(title: '${isEditing ? 'Edit' : 'Plan your'}  budget'),
        body: ListView(
          padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 0),
          children: [
            _buildFirstOperation(form),
            _buildSecondOperation(categoryList, idList),
            idList.isNotEmpty
                ? _buildThirdOperation(categoryList, idList, form)
                : Container(),
            idList.isNotEmpty ? _buildUploadTextButton() : Container()
          ],
        ),
      ),
    );
  }

  _buildFirstOperation(BudgetForm form) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBudgetSection(
            'Duration', 'A duration within which your budget applies.'),
        SizedBox(height: 20.dh),
        _buildDurationActions(form),
      ],
    );
  }

  _buildSecondOperation(List<Category> categoryList, List<String> idList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.dh),
        _buildBudgetSection(
            isEditing
                ? 'Selected Category ( Unmodifiable )'
                : 'Choose Categories',
            '${isEditing ? 'A category' : 'Categories'} within which the selected duration applies. This step applies only to unbudgetted expenses.'),
        isEditing
            ? _buildCategory(categoryList.first, idList)
            : _buildCategories(categoryList, idList),
      ],
    );
  }

  _buildThirdOperation(
      List<Category> categoryList, List<String> idList, BudgetForm form) {
    final list = categoryList.where((e) => idList.contains(e.id)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.dh),
        _buildBudgetSection(
            isEditing ? 'Edit Amount' : 'Decide Amounts',
            isEditing
                ? 'Decide the amount for this category'
                : 'Decide amounts for each category you selected.'),
        _buildSelectedCategories(list, form),
      ],
    );
  }

  _buildSelectedCategories(List<Category> categoryList, BudgetForm form) {
    return Padding(
      padding: EdgeInsets.only(top: 10.dh),
      child: Column(
        children:
            categoryList.map((e) => _buildSelectedCategory(e, form)).toList(),
      ),
    );
  }

  Widget _buildSelectedCategory(Category category, BudgetForm form) {
    return Padding(
      padding: EdgeInsets.only(top: 8.dh, bottom: 8.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15.dw, bottom: 10.dh),
              child: AppText(category.title.toUpperCase(),
                  size: 14.dw,
                  color: AppColors.onBackground2)),
          AmountTextField(
              errors: form.errors,
              text: form.values[category.id]?.toString() ?? '',
              onChanged: (value) => bloc.updateAmount(category.id, value),
              errorName: category.id)
        ],
      ),
    );
  }

  _buildCategories(List<Category> categoryList, List<String> idList) {
    return Container(
      height: 360.dh,
      width: ScreenSizeConfig.getFullWidth,
      margin: EdgeInsets.only(top: 10.dh),
      decoration:
          BoxDecoration(borderRadius: borderRadius2, color: AppColors.surface),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        childAspectRatio: .7.dw,
        padding: EdgeInsets.only(top: 8.dw),
        children: categoryList.map((e) => _buildCategory(e, idList)).toList(),
      ),
    );
  }

  Widget _buildCategory(Category category, List<String> idList) {
    final isSelected = idList.contains(category.id);

    return GestureDetector(
        onTap: isEditing ? () {} : () => bloc.updateIdList(category.id),
        child: Container(
            margin: EdgeInsets.all(8.dw),
            padding: EdgeInsets.all(8.dw),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.0),
                borderRadius: borderRadius2,
                border: Border.all(
                  width: isSelected ? 1 : 0,
                  color: isSelected ? AppColors.accent : Colors.transparent,
                )),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(AppIcons.getIcon(category.codePoint),
                  color: isSelected
                      ? AppColors.onBackground
                      : AppColors.onBackground2),
              SizedBox(height: 8.dh),
              AppText(
                category.title,
                size: 13.dw,
                color: isSelected
                    ? AppColors.onBackground
                    : AppColors.onBackground2,
                maxLines: 1,
                alignment: TextAlign.center,
              )
            ])));
  }

  _buildDurationActions(BudgetForm form) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        _buildDurationOption('Monthly', Utils.getDaysInMonth(), form.duration)
      ])
    ]);
  }

  Widget _buildUploadTextButton() {
    return AppTextButton(
      text: isEditing ? 'Done Editing' : 'Add Budgets',
      isBolded: true,
      height: 50.dh,
      margin: EdgeInsets.only(top: 30.dh, bottom: 20.dh),
      borderColor: Colors.transparent,
      buttonColor: AppColors.primary,
      onPressed: isEditing ? bloc.edit : bloc.add,
    );
  }

  _buildDurationOption(String text, int duration, int selectedDuration) {
    final isSelected = duration == selectedDuration;
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(right: 20.dw),
      child: OptionCircle(
          onTap: (){},
          isSelected: isSelected,
          option: text),
    );
  }

  _buildBudgetSection(String title, String description) {
    return Padding(
        padding: EdgeInsets.only(top: 20.dh),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppText(title,
              color: AppColors.onBackground, size: 17.dw, family: kFontFam2),
          SizedBox(height: 5.dh),
          AppText(description,
              color: AppColors.onBackground2,
              size: 14.dw,
              alignment: TextAlign.start,
              maxLines: 10)
        ]));
  }
}
