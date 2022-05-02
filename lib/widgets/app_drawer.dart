import 'package:budgetting_app/providers/user_details_provider.dart';
import 'package:budgetting_app/source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_divider.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUserAccount(),
        AppTextButton(onPressed: () {})],
    );
  }

  _buildUserAccount() {
    //~ avoiding null-check errors during sign out
    final user = ref.watch(signedInUserProvider) ?? const User();

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 10.dh),
        margin: EdgeInsets.only(bottom: 10.dh),
        decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(15.dw)),
        child: Column(children: [
          Row(children: [
            user.photoUrl.isEmpty
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.dw,
                    child: Icon(Icons.person, size: 30.dw),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(user.photoUrl),
                    radius: 30.dw),
            SizedBox(width: 25.dw),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  AppText(user.displayName, size: 16.dw),
                  SizedBox(height: 5.dh),
                  AppText('Currency: ${user.currency}', size: 14.dw)
                ]))
          ]),
          AppDivider(margin: EdgeInsets.symmetric(vertical: 10.dh)),
          AppTextButton(
              onPressed: () {},
              text: 'Account Settings',
              textColor: AppColors.primary,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5.dh))
        ]));
  }
}
