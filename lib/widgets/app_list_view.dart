import '../source.dart';

class AppListView extends StatelessWidget {
  const AppListView(
      {required this.appBarDisapperingWidget,
      required this.appBarRemainingWidget,
      required this.listWidget,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  final Widget Function(double) appBarDisapperingWidget;
  final Widget Function() appBarRemainingWidget;
  final Widget listWidget;
  final Color backgroundColor;

  static final scrollValueNotifier = ValueNotifier<double>(0.0);
  static final startValueNotifier = ValueNotifier<double>(0.0);
  static final endValueNotifier = ValueNotifier<double>(0.0);
  static final isScrollingUpwardsNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (ScrollNotification notification) {
          final scrollValue = notification.metrics.pixels.dh;

          scrollValueNotifier.value = scrollValue;
          if (notification is ScrollStartNotification) {
            startValueNotifier.value = scrollValue;
          }
          if (notification is ScrollUpdateNotification) {
            endValueNotifier.value = scrollValue;
            final startValue = startValueNotifier.value;
            if (scrollValue > startValue) {
              isScrollingUpwardsNotifier.value = true;
            } else {
              isScrollingUpwardsNotifier.value = false;
            }
          }

          return true;
        },
        child:
            Stack(fit: StackFit.expand, children: [listWidget, _buildTitle()]));
  }

  _buildTitle() {
    return Positioned(
        top: 0,
        child: ValueListenableBuilder<bool>(
            valueListenable: isScrollingUpwardsNotifier,
            builder: (context, isScrollingUpwards, snapshot) {
              return ValueListenableBuilder<double>(
                  valueListenable: scrollValueNotifier,
                  builder: (context, scrollValue, snapshot) {
                    final value = scrollValue <= 1
                        ? 25.dw
                        : isScrollingUpwards
                            ? 25 / scrollValue
                            : 25.dw;
                    return Material(
                        color: backgroundColor,
                        elevation: isScrollingUpwards ? 4 : 0,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(15.dw,
                                scrollValue > 25 ? 25.dh : 35.dh, 15.dw, 0),
                            width: ScreenSizeConfig.getFullWidth,
                            child: Column(children: [
                              appBarDisapperingWidget(value),
                              SizedBox(height: 10.dh),
                              appBarRemainingWidget()
                            ])));
                  });
            }));
  }
}
