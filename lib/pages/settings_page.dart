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
    userService = Provider.of<UserService>(context, listen: false);
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
        _buildCurrencyIcons(),
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
          CircleAvatar(
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

  _buildCurrencyIcons() {
    final codePointList = IconCodePointGenerator.categoryIconscodePointList;

    return Container(
        color: AppColors.surface,
        height: 290.dh,
        child: GridView.count(
            crossAxisCount: 6,
            childAspectRatio: .75.dw,
            shrinkWrap: true,
            //: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.dw),
            children: codePointList.map((e) {
              final formatted = '0xe' + e.toString();
              final codePoint = int.parse(formatted);
              const isSelected = true;

              return GestureDetector(
                // onTap: () => bloc.updatecodePoint(codePoint),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.0),
                        border: Border.all(
                            width: isSelected ? 1.5 : 0,
                            color: isSelected
                                ? AppColors.accent
                                : Colors.transparent)),
                    child: Icon(
                      AppIcons.getIcon(codePoint),
                      color: isSelected
                          ? AppColors.onBackground
                          : AppColors.onBackground2,
                    )),
              );
            }).toList()));
  }
}
