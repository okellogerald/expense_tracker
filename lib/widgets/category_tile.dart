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
      Key? key})
      : super(key: key);

  final Category category;
  final bool isSelected, isUndeletable;
  final VoidCallback editCallback, cancelCallback, deleteCallback;
  final ValueChanged<String> changeSelectedIdCallback;

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
          padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 6.5.dw),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.0),
              border: Border(
                top: isSelected ? _selectedBorder : _unSelectedBorder,
                bottom: isSelected ? _selectedBorder : _unSelectedBorder,
              )),
          child: Column(
            children: [
              Row(
                children: [
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
                      child: AppText(
                        widget.category.title,
                        size: 16.dw,
                        color: AppColors.onBackground2,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  !isSelected
                      ? AppIconButton(
                          onPressed: _onTap,
                          icon: Icons.more_horiz,
                          iconColor: AppColors.onBackground,
                          spreadRadius: 25.dw,
                        )
                      : Container(),
                ],
              ),
              _buildActionButtons(),
            ],
          )),
    );
  }

  _buildActionButtons() {
    return widget.isSelected
        ? Padding(
            padding: EdgeInsets.only(top: 10.dw),
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

  _onTap() {
    widget.changeSelectedIdCallback(widget.category.id);
  }

  static const _selectedBorder =
      BorderSide(width: 1.0, color: AppColors.divider);
  static const _unSelectedBorder =
      BorderSide(width: 0.0, color: Colors.transparent);
}
