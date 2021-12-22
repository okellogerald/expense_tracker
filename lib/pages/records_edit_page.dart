import '../source.dart';

class RecordsEditPage extends StatefulWidget {
  const RecordsEditPage(this.record, {Key? key}) : super(key: key);

  final Record? record;

  static void navigateTo(BuildContext context, {Record? record}) =>
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => RecordsEditPage(record)));

  @override
  _RecordsEditPageState createState() => _RecordsEditPageState();
}

class _RecordsEditPageState extends State<RecordsEditPage> {
  late final RecordsPageBloc bloc;
  late final RecordsService recordsService;
  late final CategoriesService categoriesService;
  final controller = TextEditingController();

  @override
  void initState() {
    recordsService = Provider.of<RecordsService>(context, listen: false);
    categoriesService = Provider.of<CategoriesService>(context, listen: false);
    bloc = RecordsPageBloc(recordsService, categoriesService);
    bloc.init(record: widget.record);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordsPageBloc, RecordsPageState>(
        bloc: bloc,
        listener: (_, state) {
          final hasSucceeded =
              state.maybeWhen(success: (_, __) => true, orElse: () => false);
          if (hasSucceeded) Navigator.pop(context);
        },
        builder: (_, state) {
          return state.when(
            loading: _buildLoading,
            content: _buildContent,
            success: _buildContent,
          );
        });
  }

  Widget _buildLoading(
      List<Record> recordsList, RecordsPageSupplements supplements) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(
      List<Record> recordsList, RecordsPageSupplements supplements) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40.dw, left: 15.dw, right: 15.dw),
          height: ScreenSizeConfig.getDeviceSize.height,
          width: ScreenSizeConfig.getDeviceSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageTitle(),
              _buildSectionTitle('Choose Category',
                  topOffset: 20.dh, withButton: true),
              _buildOptions(supplements),
              _buildCategoriesList(supplements),
              _buildSectionTitle('Amount Used', topOffset: 20.dh),
              _buildAmountTextField(supplements),
              _buildSectionTitle('Notes'),
              _buildNotesTextField(supplements),
              _buildButton()
            ],
          ),
        ),
      ),
    );
  }

  _buildPageTitle() {
    final isEditing = widget.record != null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText('${isEditing ? 'Edit' : 'New'} Record',
            size: 24.dw, color: AppColors.textColor),
        AppIconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icons.close,
          iconColor: Colors.white70,
        )
      ],
    );
  }

  _buildSectionTitle(String text,
      {double? topOffset, bool withButton = false}) {
    final _text = AppText(text, size: 18.dw, color: AppColors.textColor2);
    return Padding(
      padding: EdgeInsets.only(top: topOffset ?? 60.dh, bottom: 5.dh),
      child: withButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _text,
                AppTextButton(
                    text: 'Add Category',
                    useButtonSizeOnly: false,
                    textColor: AppColors.primaryColor,
                    onPressed: () => CategoryEditPage.navigateTo(context))
              ],
            )
          : _text,
    );
  }

  _buildOptions(RecordsPageSupplements supplements) {
    return Row(
      children: [
        _buildOption('Income', supplements.type, kIncome),
        SizedBox(width: 30.dw),
        _buildOption('Expense', supplements.type, kExpense),
      ],
    );
  }

  _buildCategoriesList(RecordsPageSupplements supplements) {
    final selectedType = supplements.type;
    final categories =
        supplements.categoryList.where((e) => e.type == selectedType);
    final hasErrors = supplements.errors.containsKey('category');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160.dh,
          width: ScreenSizeConfig.getDeviceSize.width,
          margin: EdgeInsets.only(top: 20.dh, bottom: hasErrors ? 0 : 40.dh),
          color: Colors.white54,
          child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 0.7.dw,
              crossAxisSpacing: 5.dw,
              mainAxisSpacing: 10.dw,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(10.dw, 10.dw, 10.dw, 10.dw),
              children: categories
                  .map(
                      (e) => _buildCategory(e, e.id == supplements.category.id))
                  .toList()),
        ),
        hasErrors
            ? Padding(
                padding: EdgeInsets.only(bottom: 40.dh, top: 10.dh),
                child: AppText(
                  supplements.errors['category'],
                  family: kFontFam2,
                  size: 16.dw,
                  color: AppColors.errorColor,
                ),
              )
            : Container()
      ],
    );
  }

  Widget _buildCategory(Category category, bool isSelected) {
    return GestureDetector(
      onTap: () => bloc.updateCategory(category),
      child: Container(
          color:
              isSelected ? AppColors.accentColor : Colors.white.withOpacity(.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(category.codePoint == -1 ? Icons.tag : category.getIcon,
                  color: isSelected ? Colors.white : Colors.black),
              SizedBox(height: 10.dh),
              AppText(
                category.title,
                color: isSelected ? Colors.white : Colors.black,
                family: kFontFam2,
                size: 14.dw,
              )
            ],
          )),
    );
  }

  _buildAmountTextField(RecordsPageSupplements supplements) {
    return AppTextField(
      onChanged: bloc.updateAmount,
      text: widget.record?.amount.toString(),
      errors: supplements.errors,
      hintText: '0',
      letterSpacing: 1.4,
      keyboardType: TextInputType.number,
    );
  }

  _buildNotesTextField(RecordsPageSupplements supplements) {
    return AppTextField(
      errors: const {},
      text: supplements.notes,
      onChanged: bloc.updateNotes,
      hintText: 'Add short notes for this record here.',
      keyboardType: TextInputType.name,
    );
  }

  _buildButton() {
    final isAdding = widget.record == null;

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppTextButton(
          onPressed: isAdding ? bloc.add : bloc.edit,
          text: isAdding ? 'Add' : 'Edit',
          padding: EdgeInsets.symmetric(vertical: 10.dw),
          margin: EdgeInsets.only(bottom: 30.dh),
          fontSize: 15.dw,
          isBolded: true,
          buttonColor: AppColors.primaryColor,
        ),
      ],
    ));
  }

  _buildOption(String text, String currentType, String type) {
    final isSelected = currentType == type;

    return GestureDetector(
      onTap: () => bloc.updateType(type.toLowerCase()),
      child: Container(
        color: Colors.white.withOpacity(.0),
        padding: EdgeInsets.only(top: 8.dh),
        child: Row(children: [
          Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white70),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(3.dw),
              child: _buildCircle(
                  isSelected ? AppColors.accentColor : AppColors.textColor2)),
          SizedBox(width: 15.dw),
          AppText(text, size: 14.dw, family: kFontFam2)
        ]),
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
        height: 11.dw,
        width: 11.dw,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ));
  }
}
