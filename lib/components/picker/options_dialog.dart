import 'dart:async';

import '../../constants/themes/color_scheme.dart';
import '../_common_imports.dart';
import '../form/text_field.dart';

Future<T?> showOptionsDialog<T>({
  required BuildContext context,
  required List<T> options,
  required String dropdownTitle,
  T? currentValue,
  bool canSearch = false,
  required String Function(T option) nameGetter,
}) async {
  return await showDialog<T>(
    context: context,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: OptionsDialog(
        options: options,
        dropdownTitle: dropdownTitle,
        currentValue: currentValue,
        nameGetter: nameGetter,
        canSearch: canSearch,
      ),
    ),
  );
}

class OptionsDialog<T> extends StatefulWidget {
  final T? currentValue;
  final List<T> options;
  final String dropdownTitle;
  final bool canSearch;
  final String Function(T option) nameGetter;

  const OptionsDialog({
    super.key,
    required this.options,
    required this.dropdownTitle,
    required this.currentValue,
    this.canSearch = false,
    required this.nameGetter,
  });

  @override
  State<OptionsDialog<T>> createState() => _OptionsDialogState<T>();
}

class _OptionsDialogState<T> extends State<OptionsDialog<T>>
    with AfterLayoutMixin {
  final controller = TextEditingController();
  List<T> options = [];
  final scrollController = ScrollController();
  T? current;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}

  @override
  void initState() {
    super.initState();
    if (widget.options.isNotEmpty) {
      options = List.from(widget.options);
      current = widget.currentValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontal() + vertical(30),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight:
                context.viewportHeight - context.viewPadding.vertical - 30),
        child: buildOnData(),
      ),
    );
  }

  Widget buildOnData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.dropdownTitle,
          style: context.textTheme.titleLarge,
        ),
        if (widget.canSearch)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TemboTextField(
              controller: controller,
              hint: "Search",
              onChanged: (value) {
                options = widget.options
                    .where((e) => widget
                        .nameGetter(e)
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .whereType<T>()
                    .toList();
                setState(() {});
              },
            ),
          ),
        const SizedBox(height: 20),
        Flexible(
          child: Scrollbar(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return buildOption(options[index]);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemCount: options.length,
            ),
          ),
        )
      ],
    );
  }

  Widget buildOption(T option) {
    final isSelected = option == current;
    final name = widget.nameGetter(option);

    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () async {
            pop() => Navigator.pop(context, option);
            current = option;
            setState(() {});
            await Future.delayed(const Duration(milliseconds: 500));
            pop();
          },
          child: AnimatedContainer(
            margin: kHorPadding / 2,
            height: 40,
            decoration: BoxDecoration(
                color: isSelected ? context.colorScheme.primary : null,
                borderRadius: BorderRadius.circular(20)),
            duration: const Duration(milliseconds: 300),
            child: Row(
              children: [
                const SizedBox(width: 20),
                if (controller.text.isNotEmpty && !isSelected)
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(fontSize: 20),
                    children: getSpans(widget.nameGetter(option)),
                  ))
                else
                  Expanded(
                    child: AppText(
                      name,
                      style: TextStyle(
                        color: isSelected
                            ? context.colorScheme.onPrimary
                            : context.colorScheme.onSurface.withOpacity(.87),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<TextSpan> getSpans(String option) {
    final search = controller.text.trim().toLowerCase();
    final matches = search.allMatches(option.toLowerCase()).toList();
    final spans = <TextSpan>[];

    final style = context.textTheme.labelLarge
        ?.copyWith(color: getTemboColorScheme().onBackground);

    if (matches.isEmpty) {
      spans.add(
        TextSpan(text: option, style: style),
      );
    } else {
      for (var i = 0; i < matches.length; i++) {
        final strStart = i == 0 ? 0 : matches[i - 1].end;
        final match = matches[i];
        spans.add(
          TextSpan(
            text: option.substring(
              strStart,
              match.start,
            ),
            style: style,
          ),
        );
        spans.add(
          TextSpan(
            text: option.substring(
              match.start,
              match.end,
            ),
            style: style?.copyWith(color: Colors.blue),
          ),
        );
      }
      spans.add(
        TextSpan(text: option.substring(matches.last.end), style: style),
      );
    }
    return spans;
  }
}
