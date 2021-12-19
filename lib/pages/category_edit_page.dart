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
  late final CategoryService service;
  late final CategoryPageBloc bloc;
  final scrollController = ScrollController();

  @override
  void initState() {
    service = Provider.of<CategoryService>(context, listen: false);
    bloc = CategoryPageBloc(service);
    bloc.init(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryPageBloc, CategoryPageState>(
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
      body: ListView(
        padding: EdgeInsets.fromLTRB(10.dw, 40.dw, 10.dw, 0),
        children: [
          _buildPageTitle(),
          _buildSectionTitle('Title', topOffset: 20.dh),
          _buildTextField(supplements),
          _buildSectionTitle('Type'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOption('Income', kIncome, supplements),
              _buildOption('Expense', kExpense, supplements),
            ],
          ),
          _buildSectionTitle('Icon'),
          _buildCategoryIcons(supplements),
          _buildButton()
        ],
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
    controller.text = supplements.title;
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
    final hasError = supplements.errors.isNotEmpty;
    final border = hasError ? errorBorder : _inputBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.dh,
          child: TextField(
              controller: controller,
              onChanged: bloc.updateTitle,
              textCapitalization: TextCapitalization.words,
              style: const TextStyle(
                  color: AppColors.textColor, fontFamily: 'Regular'),
              cursorColor: AppColors.textColor,
              decoration: InputDecoration(
                  hintText: 'e.g Rent',
                  hintStyle: const TextStyle(
                      color: Colors.black54, fontFamily: 'Regular'),
                  fillColor: Colors.white.withOpacity(.25),
                  filled: true,
                  isDense: true,
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                  contentPadding:
                      EdgeInsets.only(left: 10.dw, top: 12.dw, bottom: 8.dw))),
        ),
        hasError
            ? Padding(
                padding: EdgeInsets.only(top: 8.dw),
                child: AppText(
                  supplements.errors['title'],
                  color: AppColors.errorColor,
                  family: 'Regular',
                  size: 16.dw,
                ),
              )
            : Container()
      ],
    );
  }

  _buildOption(String text, String type, Supplements supplements) {
    final isSelected = supplements.type == type;

    return GestureDetector(
      onTap: () => bloc.updateType(type),
      child: Container(
          height: 50.dh,
          width: 185.dw,
          color: isSelected ? AppColors.accentColor : Colors.transparent,
          alignment: Alignment.center,
          child: AppText(text.toUpperCase(),
              size: 16.dw,
              family: 'Regular',
              color: isSelected ? AppColors.textColor : AppColors.textColor2)),
    );
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
                      AppIcons.fromCodePoint(codePoint),
                      color: isSelected ? Colors.white : Colors.black,
                    )),
              );
            }).toList()));
  }

  _buildButton() {
    final isEditing = widget.category != null;

    return AppTextButton(
      onPressed: () {
        isEditing ? bloc.editCategory() : bloc.addCategory();
      },
      buttonColor: AppColors.primaryColor,
      margin: EdgeInsets.only(top: 70.dh),
      text: isEditing ? 'Edit' : 'Add',
      height: 45.dh,
    );
  }

  final _inputBorder = const UnderlineInputBorder(
      borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      borderRadius: BorderRadius.zero);

  final errorBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(width: 1.2, color: Colors.white70));
}
