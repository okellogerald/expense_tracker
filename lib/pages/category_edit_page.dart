import '../source.dart';

class CategoryEditPage extends StatefulWidget {
  const CategoryEditPage(this.category, {Key? key}) : super(key: key);

  final Category? category;

  static void navigateTo(BuildContext context, {Category? category}) =>
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => CategoryEditPage(category)));

  @override
  _CategoryEditPageState createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage> {
  final controller = TextEditingController();
  late final CategoriesService categoryService;
  late final PreferencesService prefsService;
  late final GrossAmountsService grossAmountsService;
  late final BudgetsService budgetsService;
  late final RecordsService recordsService;
  late final CategoriesPageBloc bloc;
  final scrollController = ScrollController();

  static var themeProvider = ThemeProvider();
  static var appColors = AppColors('Light');

  @override
  void didChangeDependencies() {
    themeProvider = Provider.of<ThemeProvider>(context);
    appColors = AppColors(themeProvider.getCurrentTheme);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    categoryService = Provider.of<CategoriesService>(context, listen: false);
    prefsService = Provider.of<PreferencesService>(context, listen: false);
    recordsService = Provider.of<RecordsService>(context, listen: false);
    budgetsService = Provider.of<BudgetsService>(context, listen: false);
    bloc = CategoriesPageBloc(
      categoryService,
      prefsService,
      recordsService,
      budgetsService,
    );
    bloc.init(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesPageBloc, CategoriesPageState>(
        bloc: bloc,
        listener: (_, state) {
          final hasSucceeded =
              state.maybeWhen(success: (_, __) => true, orElse: () => false);
          if (hasSucceeded) Navigator.pop(context);
        },
        builder: (_, state) {
          return state.when(
              loading: _buildLoading, content: _buildBody, success: _buildBody);
        });
  }

  Widget _buildLoading(List<Category> categoryList, CategoryForm form) {
    return const CircularProgressIndicator();
  }

  Widget _buildBody(List<Category> categoryList, CategoryForm form) {
    final isEditing = widget.category != null;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.dw, 40.dw, 10.dw, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageTitle(),
            _buildSectionTitle('Title', topOffset: 20.dh),
            _buildTextField(form),
            _buildSectionTitle(
                isEditing ? 'Selected Type ( Unmodifiable )' : 'Type'),
            _buildOptions(form),
            _buildSectionTitle('Icon'),
            _buildCategoryIcons(form),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  _buildPageTitle() {
    final isEditing = widget.category != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          '${isEditing ? 'Edit' : 'New'} Category',
          size: 24.dw,
          color: appColors.textColor,
          family: kFontFam2,
        ),
        AppIconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icons.close,
          iconColor: Colors.white70,
        )
      ],
    );
  }

  _buildSectionTitle(String text, {double? topOffset}) {
    return Padding(
      padding: EdgeInsets.only(top: topOffset ?? 40.dh, bottom: 10.dh),
      child: AppText(
        text,
        size: 18.dw,
        color: appColors.textColor2,
      ),
    );
  }

  _buildTextField(CategoryForm form) {
    return AppTextField(
        errors: form.errors,
        text: form.title,
        onChanged: bloc.updateTitle,
        hintText: 'Type category title here',
        keyboardType: TextInputType.name);
  }

  _buildOptions(CategoryForm form) {
    return Row(
      children: [
        _buildOption('Income', kIncome, form.type),
        SizedBox(width: 20.dw),
        _buildOption('Expense', kExpense, form.type),
      ],
    );
  }

  _buildOption(String text, String type, String currentType) {
    final isSelected = currentType == type;
    final isEditing = widget.category != null;

    return OptionCircle(
        onTap: isEditing ? () {} : () => bloc.updateType(type.toLowerCase()),
        option: text,
        isSelected: isSelected);
  }

  _buildCategoryIcons(CategoryForm form) {
    final codePointList = IconCodePointGenerator.codePointList;

    return Container(
        color: appColors.backgroundColor2,
        height: 290.dh,
        child: GridView.count(
            crossAxisCount: 6,
            childAspectRatio: .75.dw,
            shrinkWrap: true,
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.dw),
            children: codePointList.map((e) {
              final formatted = '0xe' + e.toString();
              final codePoint = int.parse(formatted);
              final isSelected = form.codePoint == codePoint;

              return GestureDetector(
                onTap: () => bloc.updatecodePoint(codePoint),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.0),
                        border: Border.all(
                            width: isSelected ? 1.5 : 0,
                            color: isSelected
                                ? AppColors.accentColor
                                : Colors.transparent)),
                    child: Icon(
                      AppIcons.getIcon(codePoint),
                      color: isSelected
                          ? appColors.iconColor
                          : appColors.iconColor2,
                    )),
              );
            }).toList()));
  }

  _buildButton() {
    final isEditing = widget.category != null;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppTextButton(
            onPressed: () {
              isEditing ? bloc.editCategory() : bloc.addCategory();
            },
            buttonColor: appColors.primaryColor,
            margin: EdgeInsets.only(bottom: 10.dh),
            text: isEditing ? 'Edit' : 'Add',
            isBolded: true,
            height: 45.dh,
          ),
          if (isEditing) _buildDisclaimer(),
          SizedBox(height: 20.dh)
        ],
      ),
    );
  }

  _buildDisclaimer() {
    return AppText(
      '**Editing the category changes the respective entries of this category in the records and budgets pages.',
      size: 16.dw,
      color: AppColors.accentColor,
      family: kFontFam2,
    );
  }
}
