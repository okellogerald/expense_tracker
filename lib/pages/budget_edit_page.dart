import '../source.dart';

class BudgetEditPage extends StatefulWidget {
  const BudgetEditPage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const BudgetEditPage()));

  @override
  _BudgetEditPageState createState() => _BudgetEditPageState();
}

class _BudgetEditPageState extends State<BudgetEditPage> {
  late final BudgetEditPageBloc bloc;
  late final CategoriesService categoriesService;
  late final BudgetsService budgetsService;

  @override
  void initState() {
    categoriesService = Provider.of<CategoriesService>(context, listen: false);
    budgetsService = Provider.of<BudgetsService>(context, listen: false);
    bloc = BudgetEditPageBloc(categoriesService, budgetsService);
    bloc.init();
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
    return ListView(
      padding: EdgeInsets.fromLTRB(15.dw, 30.dh, 15.dw, 20.dh),
      children: [
        _buildTitle(),
        _buildFirstOperation(form),
        _buildSecondOperation(categoryList, idList),
        idList.isNotEmpty
            ? _buildThirdOperation(categoryList, idList, form)
            : Container(),
        idList.isNotEmpty ? _buildUploadTextButton('Add Budgets') : Container()
      ],
    );
  }

  _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('Plan your budget', size: 23.dw),
        AppIconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icons.close,
          iconColor: Colors.white70,
        )
      ],
    );
  }

  _buildFirstOperation(BudgetForm form) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBudgetSection('Choose Duration',
            'A duration within which you want to plan your budget.'),
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
        _buildBudgetSection('Choose Categories',
            'Categories within which the selected duration applies.'),
        _buildCategories(categoryList, idList),
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
            'Decide Amounts', 'Decide amounts for each category you selected.'),
        _buildSelectedCategories(list, form),
      ],
    );
  }

  _buildSelectedCategories(List<Category> categoryList, BudgetForm form) {
    return Column(
      children:
          categoryList.map((e) => _buildSelectedCategory(e, form)).toList(),
    );
  }

  Widget _buildSelectedCategory(Category category, BudgetForm form) {
    return Padding(
      padding: EdgeInsets.only(top: 8.dh, bottom: 8.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            category.title,
            size: 16.dw,
            color: AppColors.textColor,
            family: kFontFam2,
          ),
          SizedBox(height: 5.dh),
          AppTextField(
            errors: form.errors,
            text: form.values[category.id]?.toString() ?? '',
            onChanged: (value) => bloc.updateAmount(category.id, value),
            hintText: '0',
            keyboardType: TextInputType.number,
            errorName: category.id,
          )
        ],
      ),
    );
  }

  _buildCategories(List<Category> categoryList, List<String> idList) {
    return SizedBox(
      height: 360.dh,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        childAspectRatio: .7.dw,
        padding: EdgeInsets.only(top: 10.dh),
        children: categoryList.map((e) => _buildCategory(e, idList)).toList(),
      ),
    );
  }

  Widget _buildCategory(Category category, List<String> idList) {
    final isSelected = idList.contains(category.id);

    return GestureDetector(
      onTap: () => bloc.updateIdList(category.id),
      child: Container(
        margin: EdgeInsets.all(8.dw),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.0),
            border: Border.all(
              color: isSelected ? AppColors.accentColor : Colors.transparent,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(AppIcons.getIcon(category.codePoint), color: Colors.white54),
            SizedBox(height: 10.dh),
            AppText(
              category.title,
              size: 15.dw,
              color: AppColors.textColor2,
              family: kFontFam2,
            ),
          ],
        ),
      ),
    );
  }

  _buildDurationActions(BudgetForm form) {
    return Row(
      children: [
        _buildDurationOption('Daily', 1, form.duration),
        _buildDurationOption('Weekly', 7, form.duration),
        _buildDurationOption('Monthly', Utils.getDaysInMonth(), form.duration),
        _buildCustomDurationButton(),
      ],
    );
  }

  _buildCustomDurationButton() {
    return Expanded(
        child: AppTextButton(
            text: 'Custom Duration ?',
            alignment: Alignment.centerRight,
            borderColor: Colors.transparent,
            textColor: AppColors.primaryColor,
            useButtonSizeOnly: false,
            onPressed: () => BudgetEditPage.navigateTo(context)));
  }

  Widget _buildUploadTextButton(String text) {
    return AppTextButton(
      text: text,
      height: 40.dh,
      margin: EdgeInsets.only(top: 30.dh),
      borderColor: Colors.transparent,
      buttonColor: AppColors.primaryColor,
      onPressed: bloc.uploadBudgets,
    );
  }

  _buildDurationOption(String text, int duration, int selectedDuration) {
    final isSelected = duration == selectedDuration;
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(right: 20.dw),
      child: OptionCircle(
          onTap: () => bloc.updateDuration(duration),
          isSelected: isSelected,
          option: text),
    );
  }

  _buildBudgetSection(
    String title,
    String description,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: 20.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title,
            color: AppColors.textColor,
            size: 17.dw,
          ),
          AppText(
            description,
            color: AppColors.textColor2,
            size: 16.dw,
            family: kFontFam2,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
