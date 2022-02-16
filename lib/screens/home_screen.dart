import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';

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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 6),
            child: Column(
              children: <Widget>[
                _ScreenHeading(),
                SizedBox(height: 32),
                PlaylistTile(
                  name: 'FGC Rumble',
                  videosTotal: 18,
                  videosNew: 18,
                  videosWatched: 0,
                  imageSrc: 'assets/images/fgc_rumble.png',
                  mainColor: AppColors.purple,
                  dropShadowColor: AppColors.purpleShadow,
                ),
                SizedBox(height: 32),
                PlaylistTile(
                  name: 'Smash Stockpile',
                  videosTotal: 30,
                  videosNew: 10,
                  videosWatched: 15,
                  imageSrc: 'assets/images/smash_stockpile.png',
                  mainColor: AppColors.orange,
                  dropShadowColor: AppColors.orangeShadow,
                ),
                SizedBox(height: 32),
                PlaylistTile(
                  name: 'Valorant Volume',
                  videosTotal: 21,
                  videosNew: 21,
                  videosWatched: 21,
                  imageSrc: 'assets/images/valorant_volume.png',
                  mainColor: AppColors.red,
                  dropShadowColor: AppColors.redShadow,
                ),
                SizedBox(height: 46),
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
  late final MediaQueryData mediaQuery;
  late final double textScaleSize;

  _ScreenHeading({Key? key}) : super(key: key) {
    mediaQuery = MediaQueryData.fromWindow(window);
    final double scaleFactor = mediaQuery.textScaleFactor;

    if (scaleFactor <= 1.25) {
      textScaleSize = scaleFactor;
    } else if (scaleFactor > 1.25) {
      textScaleSize = 1.25;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = Theme.of(context).textTheme.headline1;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GradientText(
          'Trending Today ',
          style: style,
          textScaleFactor: textScaleSize,
          gradient: const LinearGradient(
            colors: [
              AppColors.orange,
              AppColors.headingGradientRed,
            ],
          ),
        ),
        Container(
          height: 43 * textScaleSize,
          width: 26 * textScaleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(4, 8),
                color: AppColors.orange.withOpacity(0.4),
                blurRadius: 14,
              ),
            ],
          ),
          child: Text(
            '🔥',
            textScaleFactor: textScaleSize,
            style: style,
          ),
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
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              constraints: BoxConstraints(maxWidth: double.infinity),
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
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
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
