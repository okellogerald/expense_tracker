import '/widgets/app_divider.dart';

import '../source.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile(
      {required this.category,
      required this.isSelected,
      required this.changeSelectedIdCallback,
      required this.deleteCallback,
      required this.isUndeletable,
      required this.cancelCallback,
      required this.editCallback,
      required this.showBottomBorder,
      required this.showTopBorder,
      super.key});

  final Category category;
  final bool isSelected, isUndeletable;
  final VoidCallback editCallback, cancelCallback, deleteCallback;
  final ValueChanged<String> changeSelectedIdCallback;
  final bool showTopBorder, showBottomBorder;

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected;

    return GestureDetector(
      onTap: _onTap,
      child: Container(
          //to make this whole container clickable
          color: Colors.white.withOpacity(.0),
          padding: EdgeInsets.only(bottom: 6.5.dw),
          child: Column(
            children: [
              _buildDivider(widget.isSelected && widget.showTopBorder),
              Padding(
                padding: EdgeInsets.only(left: 15.dw, right: 15.dw, top: 5.dh),
                child: Row(children: [
                  Icon(
                      widget.category.codePoint == -1
                          ? Icons.tag
                          : widget.category.getIcon,
                      size: 20.dw,
                      color: AppColors.onBackground),
                  SizedBox(width: 20.dw),
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(right: 15.dw),
                          child: AppText(widget.category.title,
                              size: bodyTextSize,
                              color: AppColors.onBackground2,
                              maxLines: 2))),
                  !isSelected
                      ? AppIconButton(
                          onPressed: _onTap,
                          icon: Icons.more_horiz,
                          iconColor: AppColors.onBackground,
                          spreadRadius: 25.dw)
                      : Container(),
                ]),
              ),
              _buildActionButtons(),
              _buildDivider(widget.isSelected && widget.showBottomBorder),
            ],
          )),
    );
  }

  _buildActionButtons() {
    return widget.isSelected
        ? Padding(
            padding: EdgeInsets.only(
                top: 10.dw, left: 15.dw, right: 15.dw, bottom: 5.dh),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildTextButton('Edit', widget.editCallback),
                widget.isUndeletable
                    ? Container()
                    : _buildTextButton('Delete', widget.deleteCallback),
                _buildTextButton('Close', widget.cancelCallback)
              ],
            ),
          )
        : Container();
  }

  _buildTextButton(String text, Function onPressed) {
    return AppTextButton(
        text: text,
        margin: EdgeInsets.only(left: 20.dw),
        borderColor: Colors.transparent,
        textColor: AppColors.primary,
        onPressed: () => onPressed());
  }

  _onTap() => widget.changeSelectedIdCallback(widget.category.id);

  _buildDivider(bool showDivider) => showDivider
      ? AppDivider(
          color: AppColors.divider.withOpacity(.5),
          margin: EdgeInsets.symmetric(horizontal: 5.dw))
      : Container();
}
