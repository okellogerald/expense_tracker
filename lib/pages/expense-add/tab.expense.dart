import '/pages/category-select/page.dart';

import '/features/manager.dart';
import '/models/expense_add_data.dart';
import '/models/realm/expense.category.dart';
import '/utils/validate_utils.dart';

import '../common_imports.dart';

class ExpenseAddTab extends ConsumerStatefulWidget {
  final VoidCallback onDone;
  const ExpenseAddTab({required this.onDone, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpenseAddPageState();
}

class _ExpenseAddPageState extends ConsumerState<ExpenseAddTab> {
  ExpenseCategory? category;

  final amountController = TextEditingController();
  final notesController = TextEditingController();

  DateTime date = DateTime.now();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: kHorPadding + top(),
            children: [
              OverflowBar(
                overflowSpacing: 15,
                children: [
                  AppSelectButton<ExpenseCategory>(
                    category,
                    title: "Category",
                    label: (g) => g.name,
                    onPress: selectCategory,
                    placeholder: "Select Category",
                  ),
                  SelectDateButton(
                    date,
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

    final data = ExpenseAddData(
      date: date,
      amount: amount,
      notes: notesController.compactText,
      category: category,
    );
    ref.read(expensesManagerProvider).addExpense(data);
    widget.onDone();
  }
}
