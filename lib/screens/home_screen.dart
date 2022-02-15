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
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                _ScreenHeading(),
                SizedBox(height: 32),
                _PlaylistTiles(),
                SizedBox(height: 14),
                _ScreenEngagement(),
                SizedBox(height: 40),
                _EngagementButton(),
                SizedBox(height: 12),
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
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: AppColors.orange.withOpacity(0.4),
                blurRadius: 14,
              ),
            ],
          ),
          child: Text('🔥', style: style),
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
        const SizedBox(height: 8),
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
        borderRadius: BorderRadius.circular(56),
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
          borderRadius: BorderRadius.circular(56),
          color: Colors.black,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            padding: const EdgeInsets.all(0),
            primary: AppColors.orange.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(56),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56),
              gradient: const LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.05, 1],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(56),
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
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 9),
                  const Text(
                    'Join Metaview Discord',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
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
  const _PlaylistTiles({Key? key}) : super(key: key);

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
            const SizedBox(height: 32),
          ],
        );
      }).toList(),
    );
  }
}
