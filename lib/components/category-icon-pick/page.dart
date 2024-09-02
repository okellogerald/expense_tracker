import '../../pages/common_imports.dart';

class ExpenseCategoryIconSelectPage extends ConsumerStatefulWidget {
  final IconData? currentlySelectedIcon;
  const ExpenseCategoryIconSelectPage({this.currentlySelectedIcon, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpenseCategorySelectState();

  static const routeName = "/expense-category-select";

  static Future<IconData?> to([IconData? initialIcon]) =>
      router.push<IconData>(routeName, extra: initialIcon);

  static Widget builder(BuildContext c, GoRouterState state) {
    return ExpenseCategoryIconSelectPage(
      currentlySelectedIcon: state.extra as IconData?,
    );
  }
}

class _ExpenseCategorySelectState
    extends ConsumerState<ExpenseCategoryIconSelectPage> {
  int? index;

  @override
  void initState() {
    super.initState();

    if (widget.currentlySelectedIcon != null) {
      index = EXPENSE_ICONS.indexOf(widget.currentlySelectedIcon!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("Select Category"),
      ),
      bottomNavigationBar: BottomButton(
        onPress: next,
      ),
      body: GridView.builder(
        padding: kHorPadding + bottom(40) + top(20),
        itemCount: EXPENSE_ICONS.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (_, i) {
          final selected = index == i;

          if (selected) {
            return IconButton.filled(
              onPressed: () => select(i),
              icon: Icon(
                EXPENSE_ICONS[i],
                size: 30,
              ),
            );
          }

          return IconButton.outlined(
            onPressed: () => select(i),
            icon: Icon(
              EXPENSE_ICONS[i],
              size: 30,
            ),
          );
        },
      ),
    );
  }

  void select(int i) {
    setState(() {
      index = i;
    });
  }

  void next() {
    if (index != null) {
      router.pop(EXPENSE_ICONS[index!]);
    }
  }
}
