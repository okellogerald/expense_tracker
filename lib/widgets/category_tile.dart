import '../source.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile(
      {required this.category,
      required this.isSelected,
      required this.changeSelectedIdCallback,
      required this.deleteCallback,
      required this.cancelCallback,
      required this.editCallback,
      Key? key})
      : super(key: key);

  final Category category;
  final bool isSelected;
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
          padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 10.dw),
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
                      color: Colors.white70),
                  SizedBox(width: 20.dw),
                  AppText(
                    widget.category.title,
                    size: 16.dw,
                    color: AppColors.textColor2,
                    family: 'Regular',
                  ),
                  const Spacer(),
                  !isSelected
                      ? AppIconButton(
                          onPressed: _onTap,
                          icon: Icons.more_horiz,
                          iconColor: Colors.white70,
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
                _buildTextButton('Remove', widget.deleteCallback),
                _buildTextButton('Cancel', widget.cancelCallback)
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
        textColor: AppColors.primaryColor,
        useButtonSizeOnly: false,
        onPressed: () => onPressed());
  }

  _onTap() {
    widget.changeSelectedIdCallback(widget.category.id);
  }

  static const _selectedBorder = BorderSide(width: 1.0, color: Colors.white70);
  static const _unSelectedBorder =
      BorderSide(width: 0.0, color: Colors.transparent);
}
