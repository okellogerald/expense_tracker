import '../source.dart';

enum AddCategoryWidgetPosition { top, bottom }

class AddCategoryWidget extends StatefulWidget {
  const AddCategoryWidget(
      {required this.onPressed,
      required this.whereToShowCallback,
      required this.position,
      super.key});

  final VoidCallback onPressed;
  final void Function(AddCategoryWidgetPosition) whereToShowCallback;
  final AddCategoryWidgetPosition position;

  @override
  State<AddCategoryWidget> createState() => _AddCategoryWidgetState();
}

class _AddCategoryWidgetState extends State<AddCategoryWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final isAtTheTop = widget.position == AddCategoryWidgetPosition.top;

    return Container(
      decoration:
          BoxDecoration(color: AppColors.surface, borderRadius: borderRadius2),
      margin: EdgeInsets.only(
          bottom: isAtTheTop ? 40.dh : 10.dh, top: isAtTheTop ? 10.dh : 40.dh),
      padding: EdgeInsets.only(left: 17.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.dh),
          AppText('You can always add your custom category',
              size: bodyTextSize, color: AppColors.onBackground),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextButton(
                onPressed: widget.onPressed,
                margin: EdgeInsets.only(top: 10.dh, bottom: 15.dh),
                width: 200.dw,
                height: 40.dw,
                text: 'Add Category',
                buttonColor: AppColors.primary,
                isBolded: true,
              ),
              !isTapped
                  ? AppIconButton(
                      onPressed: () => setState(() {
                        isTapped = true;
                      }),
                      icon: Icons.more_horiz_outlined,
                      iconColor: AppColors.onBackground,
                      margin: EdgeInsets.only(right: 15.dw),
                    )
                  : Container()
            ],
          ),
          isTapped
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppTextButton(
                      onPressed: () => setState(() {
                        final position = isAtTheTop
                            ? AddCategoryWidgetPosition.bottom
                            : AddCategoryWidgetPosition.top;
                        isTapped = !isTapped;
                        widget.whereToShowCallback(position);
                      }),
                      text:
                          'Show widget at the ${isAtTheTop ? 'bottom' : 'top'}',
                      textColor: AppColors.primary,
                      margin: EdgeInsets.only(bottom: 15.dh, right: 15.dw),
                    ),
                    AppTextButton(
                      onPressed: () => setState(() {
                        isTapped = !isTapped;
                      }),
                      text: 'Cancel',
                      textColor: AppColors.primary,
                      margin: EdgeInsets.only(bottom: 15.dh, right: 15.dw),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
