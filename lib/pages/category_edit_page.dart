import '../source.dart';
import '../utils/icon_code_point_generator.dart';
import '../widgets/app_top_bar.dart';

class CategoryEditPage extends StatefulWidget {
  const CategoryEditPage([this.category, Key? key]) : super(key: key);

  final Category? category;

  @override
  _CategoryEditPageState createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage> {
  final controller = TextEditingController();
  final scrollController = ScrollController();
  late final CategoriesPageBloc bloc;

  @override
  void initState() {
    IconCodePointGenerator.generate();
    _initBloc();
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

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppTopBar(title: '${isEditing ? 'Edit' : 'New'} Category'),
        body: Padding(
            padding: EdgeInsets.fromLTRB(10.dw, 0, 10.dw, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildSectionTitle('Title', topOffset: 20.dh),
              _buildTextField(form),
              _buildSectionTitle(
                  isEditing ? 'Selected Type ( Unmodifiable )' : 'Type'),
              _buildOptions(form),
              _buildSectionTitle('Icon'),
              _buildCategoryIcons(form)
            ])),
        bottomNavigationBar: _buildButton(),
      ),
    );
  }

  _buildSectionTitle(String text, {double? topOffset}) {
    return Padding(
        padding: EdgeInsets.only(
            top: topOffset ?? 40.dh, bottom: 10.dh, left: 15.dw),
        child: AppText(text,
            size: 18.dw, color: AppColors.onBackground2, family: kFontFam2));
  }

  _buildTextField(CategoryForm form) {
    return AppTextField(
        errors: form.errors,
        text: form.title,
        onChanged: bloc.updateTitle,
        hintText: 'Type category title here',
        keyboardType: TextInputType.name,
        errorName: '');
  }

  _buildOptions(CategoryForm form) {
    return Padding(
      padding: EdgeInsets.only(left: 15.dw, top: 8.dh),
      child: Row(children: [
        _buildOption('Income', kIncome, form.type),
        SizedBox(width: 20.dw),
        _buildOption('Expense', kExpense, form.type)
      ]),
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

  _buildButton() {
    final isEditing = widget.category != null;

    return Container(
      height: 80.dh,
      padding: EdgeInsets.only(left: 15.dw, right: 15.dw, bottom: 10.dh),
      child: Column(children: [
        AppTextButton(
            onPressed: isEditing ? bloc.editCategory : bloc.addCategory,
            buttonColor: AppColors.primary,
            text: isEditing ? 'Edit' : 'Add',
            isBolded: true,
            height: 45.dh),
        if (isEditing) _buildDisclaimer(),
        SizedBox(height: 10.dh)
      ]),
    );
  }

  _buildDisclaimer() {
    return AppText(
        '** Editing the category changes the respective entries of this category in the records and budgets pages.',
        size: 15.dw,
        color: AppColors.accent);
  }

  _buildCategoryIcons(CategoryForm form) {
    final codePointList = IconCodePointGenerator.categoryIconsCodePointList;

    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
          height: 290.dh,
          decoration: BoxDecoration(
              borderRadius: borderRadius, color: AppColors.surface),
          child: Scrollbar(
            isAlwaysShown: true,
            controller: scrollController,
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
                            borderRadius: BorderRadius.all(Radius.circular(15.dw)),
                            border: Border.all(
                                width: isSelected ? 1.5 : 0,
                                color: isSelected
                                    ? AppColors.accent
                                    : Colors.transparent)),
                        child: Icon(
                          AppIcons.getIcon(codePoint),
                          color: isSelected
                              ? AppColors.onBackground
                              : AppColors.onBackground2,
                        )),
                  );
                }).toList()),
          )),
    );
  }

  _initBloc() {
    final categoryService =
        Provider.of<CategoriesService>(context, listen: false);
    final prefsService =
        Provider.of<PreferencesService>(context, listen: false);
    final recordsService = Provider.of<RecordsService>(context, listen: false);
    final budgetsService = Provider.of<BudgetsService>(context, listen: false);
    bloc = CategoriesPageBloc(
        categoryService, prefsService, recordsService, budgetsService);
    bloc.init(category: widget.category);
  }
}
