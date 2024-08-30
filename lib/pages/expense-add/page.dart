import 'package:expense_tracker_v2/components/_common_imports.dart';
import 'package:expense_tracker_v2/components/date_picker.dart';
import 'package:expense_tracker_v2/components/form/source.dart';
import 'package:expense_tracker_v2/components/picker/picker_button.dart';
import 'package:expense_tracker_v2/components/text_button.dart';

import '../../components/category-icon-pick/button.dart';
import '../common_imports.dart';

class ExpenseAddPage extends ConsumerStatefulWidget {
  const ExpenseAddPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpenseAddPageState();

  static const routeName = "/expense-add";

  static void to() => router.pushReplacement(routeName);

  static Widget builder(BuildContext c, GoRouterState state) {
    return const ExpenseAddPage();
  }
}

class _ExpenseAddPageState extends ConsumerState<ExpenseAddPage> {
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FocusWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const AppText("Add Expense"),
        ),
        body: ListView(
          padding: kHorPadding,
          children: [
            OverflowBar(
              overflowSpacing: 15,
              children: [
                CategoryIconPickButton(
                  placeholderText: "Select Expense Category",
                  onChange: (category) {
                    icon = category;
                  },
                ),
                TemboTextField.labelled(
                  "Name",
                ),
                TemboTextField.labelled(
                  "Amount",
                  formatters: [
                    TZSCurrencyFormatter(0),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppLabel("Date Paid"),
                    TemboDatePicker(
                      date: DateTime.now(),
                      onSelected: (_) {},
                    ),
                  ],
                ),
                TemboTextField.labelled(
                  "Notes",
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: const BottomButton(),
      ),
    );
  }
}
