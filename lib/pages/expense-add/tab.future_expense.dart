import 'package:expense_tracker_v2/pages/category-select/page.dart';

import '/features/manager.dart';
import '/models/expense_add_data.dart';
import '/models/realm/expense.category.dart';
import '/utils/validate_utils.dart';

import '../common_imports.dart';

class FutureExpenseAddTab extends ConsumerStatefulWidget {
  final VoidCallback onDone;
  const FutureExpenseAddTab({required this.onDone, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<FutureExpenseAddTab> {
  ExpenseCategory? category;

  final amountController = TextEditingController();
  final notesController = TextEditingController();

  DateTime date = DateTime.now().add(const Duration(days: 1));

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
                  TemboTextField.labelled(
                    "Amount",
                    controller: amountController,
                    formatters: const [
                      TZSCurrencyFormatter(0),
                    ],
                    validator: validateAmount,
                  ),
                  SelectDateButton(
                    date,
                    onSelect: (d) => setState(() => date = d),
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
    final c = await CategorySelectPage.to();

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
