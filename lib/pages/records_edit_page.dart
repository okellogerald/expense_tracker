import 'package:budgetting_app/blocs/record_edit_page_bloc.dart';

import '../source.dart';
import '../theme/app_ui_constant_styles.dart';

class RecordsEditPage extends StatefulWidget {
  final Record? record;
  const RecordsEditPage({this.record, Key? key}) : super(key: key);

  @override
  _RecordsEditPageState createState() => _RecordsEditPageState();
}

class _RecordsEditPageState extends State<RecordsEditPage> {
  late final RecordEditPageBloc bloc;
  final controller = TextEditingController();

  @override
  void initState() {
    _initBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordEditPageBloc, RecordEditPageState>(
        bloc: bloc,
        listener: (_, state) {
          final hasSucceeded = state.maybeWhen(
              success: (_, __, ___) => true, orElse: () => false);
          if (hasSucceeded) Navigator.pop(context);
        },
        builder: (_, state) {
          return state.when(
              loading: _buildLoading,
              content: _buildContent,
              success: _buildContent);
        });
  }

  Widget _buildLoading(List<Category> categoryList, Category category,
          RecordEditPageForm form) =>
      const AppLoadingIndicator();

  Widget _buildContent(
      List<Category> categoryList, Category category, RecordEditPageForm form) {
    final isEditing = widget.record != null;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(top: 40.dw, left: 15.dw, right: 15.dw),
                height: ScreenSizeConfig.getFullHeight,
                width: ScreenSizeConfig.getFullWidth,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPageTitle(),
                      _buildSectionTitle(
                          isEditing
                              ? 'Selected Category ( Unmodifiable )'
                              : 'Choose Category',
                          topOffset: 20.dh,
                          withButton: !isEditing),
                      _buildOptions(category),
                      _buildCategoriesList(categoryList, category, form),
                      _buildSectionTitle('Amount', topOffset: 20.dh),
                      _buildAmountTextField(form),
                      _buildSectionTitle('Notes'),
                      _buildNotesTextField(form.notes),
                      _buildButton()
                    ]))));
  }

  _buildPageTitle() {
    final isEditing = widget.record != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          '${isEditing ? 'Edit' : 'New'} Record',
          size: 24.dw,
          color: AppColors.onBackground,
          family: kFontFam2,
        ),
        AppIconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icons.close,
          iconColor: AppColors.onBackground,
        )
      ],
    );
  }

  _buildSectionTitle(String text,
      {double? topOffset, bool withButton = false}) {
    final _text = AppText(text, size: 18.dw, color: AppColors.onBackground2);
    return Padding(
      padding: EdgeInsets.only(top: topOffset ?? 60.dh, bottom: 5.dh),
      child: withButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _text,
                AppTextButton(
                    text: 'Add Category',
                    textColor: AppColors.primary,
                    onPressed: () => CategoryEditPage.navigateTo(context))
              ],
            )
          : _text,
    );
  }

  _buildOptions(Category category) {
    final type = category.type;

    return Padding(
      padding: EdgeInsets.only(top: 10.dh),
      child: Row(
        children: [
          _buildOption('Income', type, kIncome),
          SizedBox(width: 30.dw),
          _buildOption('Expense', type, kExpense),
        ],
      ),
    );
  }

  _buildCategoriesList(
      List<Category> categoryList, Category category, RecordEditPageForm form) {
    final selectedType = category.type;
    final categories = categoryList.where((e) => e.type == selectedType);
    final hasErrors = form.errors.containsKey('category');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 170.dh,
          width: ScreenSizeConfig.getFullWidth,
          decoration: BoxDecoration(
              color: AppColors.surface, borderRadius: borderRadius),
          margin: EdgeInsets.only(top: 20.dh, bottom: hasErrors ? 0 : 40.dh),
          child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 0.7.dw,
              crossAxisSpacing: 5.dw,
              mainAxisSpacing: 10.dw,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(10.dw, 10.dw, 10.dw, 10.dw),
              children: categories
                  .map((e) => _buildCategory(e, e.id == category.id))
                  .toList()),
        ),
        hasErrors
            ? Padding(
                padding: EdgeInsets.only(bottom: 40.dh, top: 10.dh),
                child: AppText(
                  form.errors['category'],
                  family: kFontFam2,
                  size: 16.dw,
                  color: AppColors.error,
                ),
              )
            : Container()
      ],
    );
  }

  Widget _buildCategory(Category category, bool isSelected) {
    final isEditing = widget.record != null;

    return GestureDetector(
        onTap: isEditing ? () {} : () => bloc.updateCategory(category),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.0),
                borderRadius: borderRadius,
                border: Border.all(
                    width: isSelected ? 1 : 0,
                    color: isSelected ? AppColors.accent : Colors.transparent)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(category.codePoint == -1 ? Icons.tag : category.getIcon,
                  color: isSelected
                      ? AppColors.onBackground
                      : AppColors.onBackground2),
              SizedBox(height: 10.dh),
              AppText(category.title,
                  color: isSelected
                      ? AppColors.onBackground
                      : AppColors.onBackground2,
                  size: 14.dw,
                  maxLines: 2,
                  alignment: TextAlign.center)
            ])));
  }

  _buildAmountTextField(RecordEditPageForm form) {
    return AppTextField(
        onChanged: bloc.updateAmount,
        text: form.amount.toString(),
        errors: form.errors,
        hintText: '0',
        letterSpacing: 1.4,
        keyboardType: TextInputType.number,
        errorName: 'amount');
  }

  _buildNotesTextField(String notes) {
    return AppTextField(
        errors: const {},
        text: notes,
        onChanged: bloc.updateNotes,
        hintText: 'Add short notes for this record here.',
        keyboardType: TextInputType.name,
        errorName: '');
  }

  _buildButton() {
    final isAdding = widget.record == null;

    return Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      AppTextButton(
          onPressed: isAdding ? bloc.add : bloc.edit,
          text: isAdding ? 'ADD' : 'EDIT',
          height: buttonHeight,
          margin: EdgeInsets.only(bottom: 30.dh),
          fontSize: 15.dw,
          isBolded: true,
          buttonColor: AppColors.onBackground)
    ]));
  }

  _buildOption(String text, String currentType, String type) {
    final isSelected = currentType == type;
    final isEditing = widget.record != null;

    return OptionCircle(
        onTap: isEditing ? () {} : () => bloc.updateType(type),
        isSelected: isSelected,
        option: text);
  }

  _initBloc() {
    final recordsService = Provider.of<RecordsService>(context, listen: false);
    final categoriesService =
        Provider.of<CategoriesService>(context, listen: false);
    final grossAmountsService =
        Provider.of<GrossAmountsService>(context, listen: false);
    bloc = RecordEditPageBloc(
        recordsService, categoriesService, grossAmountsService);
    bloc.init(record: widget.record);
  }
}
