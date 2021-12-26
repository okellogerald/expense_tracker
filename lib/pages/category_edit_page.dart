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
  late final CategoriesPageBloc bloc;
  final scrollController = ScrollController();

  @override
  void initState() {
    categoryService = Provider.of<CategoriesService>(context, listen: false);
    prefsService = Provider.of<PreferencesService>(context, listen: false);
    bloc = CategoriesPageBloc(categoryService, prefsService);
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

  Widget _buildLoading(List<Category> categoryList, Supplements supplements) {
    return const CircularProgressIndicator();
  }

  Widget _buildBody(List<Category> categoryList, Supplements supplements) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.dw, 40.dw, 10.dw, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageTitle(),
            _buildSectionTitle('Title', topOffset: 20.dh),
            _buildTextField(supplements),
            _buildSectionTitle('Type'),
            _buildOptions(supplements),
            _buildSectionTitle('Icon'),
            _buildCategoryIcons(supplements),
            _buildButton()
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
        AppText('${isEditing ? 'Edit' : 'New'} Category',
            size: 24.dw, color: AppColors.textColor),
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
      padding: EdgeInsets.only(top: topOffset ?? 60.dh, bottom: 5.dh),
      child: AppText(text, size: 18.dw, color: AppColors.textColor2),
    );
  }

  _buildTextField(Supplements supplements) {
    return AppTextField(
        errors: supplements.errors,
        text: supplements.title,
        onChanged: bloc.updateTitle,
        hintText: 'Type category title here',
        keyboardType: TextInputType.name);
  }

  _buildOptions(Supplements supplements) {
    return Row(
      children: [
        _buildOption('Income', kIncome, supplements.type),
        SizedBox(width: 20.dw),
        _buildOption('Expense', kExpense, supplements.type),
      ],
    );
  }

  _buildOption(String text, String type, String currentType) {
    final isSelected = currentType == type;

    return OptionCircle(
        onTap: () => bloc.updateType(type.toLowerCase()),
        option: text,
        isSelected: isSelected);
  }

  _buildCategoryIcons(Supplements supplements) {
    final codePointList = IconCodePointGenerator.codePointList;

    return Container(
        color: Colors.white.withOpacity(.8),
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
              final isSelected = supplements.codePoint == codePoint;

              return GestureDetector(
                onTap: () => bloc.updatecodePoint(codePoint),
                child: Container(
                    color:
                        isSelected ? AppColors.accentColor : Colors.transparent,
                    child: Icon(
                      AppIcons.getIcon(codePoint),
                      color: isSelected ? Colors.white : Colors.black,
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
            buttonColor: AppColors.primaryColor,
            margin: EdgeInsets.only(bottom: 20.dh),
            text: isEditing ? 'Edit' : 'Add',
            isBolded: true,
            height: 45.dh,
          ),
        ],
      ),
    );
  }
}
