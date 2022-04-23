import 'package:budgetting_app/blocs/record_edit_page_bloc.dart';
import 'package:budgetting_app/utils/navigation_logic.dart';
import 'package:budgetting_app/widgets/amount_text_field.dart';
import 'package:budgetting_app/widgets/app_top_bar.dart';
import '../source.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppTopBar(title: '${isEditing ? 'Edit' : 'New'} Record'),
        body: SingleChildScrollView(
          child: Padding(
              padding:
                  EdgeInsets.only(left: 15.dw, right: 15.dw, bottom: 20.dh),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(
                        isEditing
                            ? 'Selected Category ( Unmodifiable )'
                            : 'Choose Category',
                        topOffset: 20.dh,
                        withButton: !isEditing),
                    _buildOptions(category),
                    _buildCategoriesList(categoryList, category, form),
                    _buildSectionTitle('Amount',
                        topOffset: 20.dh, leftOffset: 15.dw),
                    _buildAmountTextField(form),
                    _buildSectionTitle('Notes', leftOffset: 15.dw),
                    _buildNotesTextField(form.notes),
                  ])),
        ),
        bottomNavigationBar: _buildButton(),
      ),
    );
  }

  _buildSectionTitle(String text,
      {double? topOffset, bool withButton = false, double? leftOffset}) {
    final _text = AppText(
      text,
      size: 18.dw,
      color: AppColors.onBackground2,
      family: kFontFam2,
    );
    return Padding(
      padding: EdgeInsets.only(
          top: topOffset ?? 60.dh, bottom: 5.dh, left: leftOffset ?? 0),
      child: withButton
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _text,
              AppTextButton(
                  text: 'Add Category',
                  textColor: AppColors.primary,
                  onPressed: () => push(const CategoryEditPage()))
            ])
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
                padding:
                    EdgeInsets.only(bottom: 40.dh, top: 10.dh, left: 15.dw),
                child: AppText(
                  form.errors['category'],
                  family: kFontFam,
                  size: 15.dw,
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
    return AmountTextField(
        onChanged: bloc.updateAmount,
        text: form.amount.toString(),
        errors: form.errors,
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

    return AppTextButton(
        onPressed: isAdding ? bloc.add : bloc.edit,
        text: isAdding ? 'ADD' : 'EDIT',
        height: buttonHeight,
        margin: EdgeInsets.only(bottom: 15.dh, left: 15.dw, right: 15.dw),
        fontSize: 15.dw,
        isBolded: true,
        buttonColor: AppColors.primary);
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
