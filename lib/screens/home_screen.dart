import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/playlist_tile.dart';
import '../components/gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0.0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const _ScreenHeading(),
                const SizedBox(height: 32.0),
                _PlaylistTiles(),
                const SizedBox(height: 14.0),
                const _ScreenEngagement(),
                const SizedBox(height: 40.0),
                const _EngagementButton(),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        callback: (index) {
          setState(() => _currentTab = index);
        },
        currentTabIndex: _currentTab,
      ),
    );
  }
}

class _ScreenHeading extends StatelessWidget {
  const _ScreenHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context).textTheme.headline1;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(
          'Trending Today ',
          style: style,
          gradient: const LinearGradient(
            colors: [
              AppColors.orange,
              AppColors.headingGradientRed,
            ],
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Text('🔥', style: style),
            Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: AppColors.orange.withOpacity(0.4),
                    blurRadius: 14.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ScreenEngagement extends StatelessWidget {
  const _ScreenEngagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/footer_animation.gif'),
        ),
        Text(
          'Check back soon for new clips and creator content.',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8.0),
        Text(
          'In the meantime join our discord.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class _EngagementButton extends StatelessWidget {
  const _EngagementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56.0),
        gradient: const LinearGradient(
          colors: [
            AppColors.orange,
            Color.fromRGBO(57, 41, 4, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56.0),
          color: Colors.black,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(56.0),
            padding: const EdgeInsets.all(0.0),
            primary: AppColors.orange.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(56.0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56.0),
              gradient: const LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.05, 1],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 56.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white.withOpacity(0.045),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/discord.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  const SizedBox(width: 9.0),
                  const Text(
                    'Join Metaview Discord',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistTiles extends StatelessWidget {
  _PlaylistTiles({Key? key}) : super(key: key);

  final List<PlaylistTile> tiles = const [
    PlaylistTile(
      name: 'FGC Rumble',
      videosTotal: 18,
      videosNew: 18,
      videosWatched: 0,
      imageSrc: 'assets/images/fgc_rumble.png',
      mainColor: AppColors.purple,
      dropShadowColor: AppColors.purpleShadow,
    ),
    PlaylistTile(
      name: 'Smash Stockpile',
      videosTotal: 30,
      videosNew: 10,
      videosWatched: 15,
      imageSrc: 'assets/images/smash_stockpile.png',
      mainColor: AppColors.orange,
      dropShadowColor: AppColors.orangeShadow,
    ),
    PlaylistTile(
      name: 'Valorant Volume',
      videosTotal: 21,
      videosNew: 21,
      videosWatched: 21,
      imageSrc: 'assets/images/valorant_volume.png',
      mainColor: AppColors.red,
      dropShadowColor: AppColors.redShadow,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tiles.map((tile) {
        return Column(
          children: [
            tile,
            const SizedBox(height: 32.0),
          ],
        );
      }).toList(),
    );
  }
}
