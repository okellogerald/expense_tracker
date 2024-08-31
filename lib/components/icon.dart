import '_common_imports.dart';

class LucideIconData extends IconData {
  const LucideIconData(super.codePoint)
      : super(
          fontFamily: 'Lucide',
          fontPackage: 'lucide_icons',
        );
}

class AppLucideIcon extends StatelessWidget {
  final int codepoint;
  const AppLucideIcon(
    this.codepoint, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(LucideIconData(codepoint));
  }
}
