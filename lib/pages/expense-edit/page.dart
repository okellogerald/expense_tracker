import '/navigation/main-page/page.dart';

import '/pages/category-select/page.dart';

import '/models/expense_add_data.dart';
import '/models/realm/expense.category.dart';

import '/features/expenses/manager.dart';
import '/utils/validate_utils.dart';

import '../common_imports.dart';

class ExpenseEditPage extends ConsumerStatefulWidget {
  final Expense expense;
  const ExpenseEditPage(this.expense, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();

  static const routeName = "/expense-edit";

  static Future<Expense?> to(Expense e) =>
      router.push<Expense>(routeName, extra: e);

  static void pop([Expense? c]) => router.pop(c);

  static String redirect(BuildContext c, GoRouterState state) {
    try {
      final _ = state.extra as Expense;
      return routeName;
    } catch (_) {
      return MainPage.routeName;
    }
  }

  static Widget builder(BuildContext c, GoRouterState state) {
    return ExpenseEditPage(state.extra as Expense);
  }
}

class _State extends ConsumerState<ExpenseEditPage> {
  late ExpenseCategory category;
  DateTime date = DateTime.now();

  final amountController = TextEditingController();
  final notesController = TextEditingController();
  final titleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final expense = widget.expense;
    category = expense.category!;
    date = expense.date;
    amountController.text = expense.amount.toInt().toString();
    notesController.text = expense.notes ?? "";
    titleController.text = expense.title ?? "";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      child: Scaffold(
        appBar: AppBar(title: const AppText("Edit Expense")),
        body: Form(
          key: formKey,
          child: ListView(
            padding: kHorPadding + top(),
            children: [
              OverflowBar(
                overflowSpacing: 15,
                children: [
                  TemboTextField.labelled(
                    "Title",
                    controller: titleController,
                    validator: (e) => validateName(e, optional: true),
                  ),
                  AppSelectButton<ExpenseCategory>(
                    category,
                    title: "Category",
                    label: (g) => g.name,
                    onPress: selectCategory,
                    placeholder: "Select Category",
                  ),
                  SelectDateButton(
                    date,
                    active: false,
                    onSelect: (d) => setState(() => date = d),
                  ),
                  TemboTextField.labelled(
                    "Amount",
                    controller: amountController,
                    formatters: const [
                      TZSCurrencyFormatter(0),
                    ],
                    validator: validateAmount,
                  ),
                  TemboTextField.labelled(
                    "Notes",
                    controller: notesController,
                    validator: (e) => validateName(e, optional: true),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomButton(
          onPress: save,
        ),
      ),
    );
  }

  void selectCategory() async {
    final c = await CategorySelectPage.to(category);

    if (c != null) {
      setState(() {
        category = c;
      });
    }
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void save() {
    final valid = validate();
    if (!valid) return;

    final amount = getAmountFrom(amountController);
    if (amount == null || amount < 500) return;

    final data = ExpenseEditData(
      amount: amount,
      notes: notesController.compactText,
      title: titleController.compactText,
      category: category,
    );

    final current = widget.expense;
    final e = ref.read(expensesManagerProvider).editExpense(current, data);
    ExpenseEditPage.pop(e);
  }
}
