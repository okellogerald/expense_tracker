import 'package:expense_tracker_v2/components/_common_imports.dart';
import 'package:expense_tracker_v2/features/manager.dart';
import 'package:expense_tracker_v2/models/expense_add_data.dart';
import 'package:expense_tracker_v2/models/realm/expense.category.dart';
import 'package:expense_tracker_v2/utils/validate_utils.dart';

import '../common_imports.dart';

class ExpenseAddPage extends ConsumerStatefulWidget {
  const ExpenseAddPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpenseAddPageState();

  static const routeName = "/expense-add";

  static void to() => router.push(routeName);

  /// if you knew how to come to this page, then you know how to leave it
  static void pop() => router.pop();

  static Widget builder(BuildContext c, GoRouterState state) {
    return const ExpenseAddPage();
  }
}

class _ExpenseAddPageState extends ConsumerState<ExpenseAddPage> {
  IconData? icon;
  ExpenseCategory? category;

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final notesController = TextEditingController();

  DateTime date = DateTime.now();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const AppText("Add Expense"),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: kHorPadding,
            children: [
              OverflowBar(
                overflowSpacing: 15,
                children: [
/*                   CategoryIconPickButton(
                    onChange: (category) {
                      icon = category;
                    },
                  ), */
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLabel("Category"),
                      if (category == null)
                        AppTextButton.text(
                          text: category?.name ?? "Click to select category",
                          style: const AppButtonStyle.outline(
                            width: double.maxFinite,
                          ),
                          onPressed: selectCategory,
                        )
                      else
                        AppTextButton(
                          onPressed: selectCategory,
                          style: const AppButtonStyle.outline(
                            width: double.maxFinite,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(category!.name),
                              if (category?.icon != null)
                                CircleAvatar(
                                  child: AppLucideIcon(category!.icon!),
                                ),
                            ],
                          ),
                        )
                    ],
                  ),
                  TemboTextField.labelled(
                    "Name",
                    controller: nameController,
                    validator: validateName,
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
    final categories = ref.read(expensesManagerProvider).getExpenseCategories();
    final c = await showOptionsDialog(
      context: context,
      options: categories,
      dropdownTitle: "Select Category",
      nameGetter: (e) => e.name,
    );

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
      icon: icon,
      amount: amount,
      name: nameController.compactText!,
      notes: notesController.compactText,
      category: category,
    );
    ref.read(expensesManagerProvider).addExpense(data);
    ExpenseAddPage.pop();
  }
}
