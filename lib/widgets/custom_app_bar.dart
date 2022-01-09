import '../source.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.child, Key? key}) : super(key: key);

  final Widget Function(bool, double) child;
  static final scrollValueNotifier = ValueNotifier<double>(0.0);
  static final startValueNotifier = ValueNotifier<double>(0.0);
  static final endValueNotifier = ValueNotifier<double>(0.0);
  static final isScrollingUpwardsNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        scrollValueNotifier.value = notification.metrics.pixels.dh;
        if (notification is ScrollStartNotification) {
          startValueNotifier.value = notification.metrics.pixels.dh;
        }
        if (notification is ScrollUpdateNotification) {
          final scrollValue = notification.metrics.pixels.dh;
          endValueNotifier.value = scrollValue;
          final startValue = startValueNotifier.value;
          if (scrollValue > startValue) {
            isScrollingUpwardsNotifier.value = true;
          } else {
            isScrollingUpwardsNotifier.value = false;
          }
        }

        log(scrollValueNotifier.value.toString());

        return true;
      },
      child: child(isScrollingUpwardsNotifier.value, scrollValueNotifier.value),
    );
  }
}
