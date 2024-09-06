import '../../pages/common_imports.dart';

class ExpenseCategoryIconSelectPage extends ConsumerStatefulWidget {
  final IconData? currentlySelectedIcon;
  const ExpenseCategoryIconSelectPage({this.currentlySelectedIcon, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExpenseCategorySelectState();

  static const routeName = "/category-icon-select";

  static Future<IconData?> to([IconData? initialIcon]) =>
      router.push<IconData>(routeName, extra: initialIcon);

  static void pop([IconData? icon]) => router.pop(icon);

  static Widget builder(BuildContext c, GoRouterState state) {
    return ExpenseCategoryIconSelectPage(
      currentlySelectedIcon: state.extra as IconData?,
    );
  }
}

class _ExpenseCategorySelectState
    extends ConsumerState<ExpenseCategoryIconSelectPage> {
  IconData? icon;

  @override
  void initState() {
    super.initState();

    icon = widget.currentlySelectedIcon;
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
      body: ListView.separated(
        padding: top(),
        separatorBuilder: (context, index) => vSpace(),
        itemCount: CATEGORIEZED_EXPENSE_ICONS.length,
        itemBuilder: (context, j) {
          final item = CATEGORIEZED_EXPENSE_ICONS[j];
          final icons = item.value;
          return Column(
            children: [
              AppLabel(item.key),
              GridView.builder(
                padding: kHorPadding + bottom(40) + top(20),
                itemCount: icons.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (_, i) {
                  final selected = icon == icons[i];

                  if (selected) {
                    return IconButton.filled(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              context.colorScheme.secondaryContainer)),
                      onPressed: () => select(icons[i]),
                      icon: Icon(
                        icons[i],
                        size: 30,
                      ),
                    );
                  }

                  return IconButton.outlined(
                    onPressed: () => select(icons[i]),
                    icon: Icon(
                      icons[i],
                      size: 30,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void select(IconData i) {
    setState(() {
      icon = i;
    });
  }

  void next() {
    if (icon != null) {
      ExpenseCategoryIconSelectPage.pop(icon);
    }
  }
}
