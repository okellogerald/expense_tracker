import '../source.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const SettingsPage()));

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingsPageBloc bloc;
  late final UserService userService;

  @override
  void initState() {
    userService = UserService();
    bloc = SettingsPageBloc(userService);
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: BlocBuilder<SettingsPageBloc, SettingsPageState>(
            bloc: bloc,
            builder: (_, state) {
              return state.when(loading: _buildLoading, content: _buildContent);
            }));
  }

  Widget _buildLoading(User user) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(User user) {
    return ListView(
      padding: EdgeInsets.fromLTRB(15.dw, 10.dw, 15.dw, 0),
      children: [
        _buildUserAccount(user),
      ],
    );
  }

  _buildUserAccount(User user) {
    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 10.dh),
      margin: EdgeInsets.only(bottom: 10.dh),
      child: Row(
        children: [
          user.photoUrl.isEmpty
              ? CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.dw,
                  child: Icon(Icons.person, size: 30.dw),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(user.photoUrl),
                  radius: 30.dw,
                ),
          SizedBox(width: 25.dw),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(user.displayName, size: 16.dw, family: kFontFam2),
              AppTextButton(
                onPressed: () {},
                text: 'Go to account settings',
                textColor: AppColors.primary,
                margin: EdgeInsets.only(top: 5.dh),
                alignment: Alignment.centerLeft,
                width: 170.dw,
              ),
            ],
          ))
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: AppText('Preferences',
          size: 24.dw, family: kFontFam2, color: AppColors.onBackground),
      elevation: 0,
      backgroundColor: AppColors.background,
      leading: AppIconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icons.arrow_back,
        iconColor: AppColors.onBackground,
      ),
    );
  }
}
