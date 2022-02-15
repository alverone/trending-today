import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/svg.dart';

import '../theme/colors.dart';

class PlaylistTile extends StatelessWidget {
  final String name;
  final int videosTotal;
  final int videosWatched;
  final int videosNew;
  final String imageSrc;
  final Color mainColor;
  final Color dropShadowColor;

  const PlaylistTile({
    Key? key,
    required this.name,
    required this.videosTotal,
    required this.videosWatched,
    required this.videosNew,
    required this.imageSrc,
    required this.mainColor,
    required this.dropShadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _GradientBorder(
      mainColor: mainColor,
      dropShadowColor: dropShadowColor,
      child: _InnerShadow(
        mainColor: mainColor,
        child: _InnerBlur(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image(
                      image: AssetImage(imageSrc),
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: -32,
                    child: _PlayButton(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Column(
                    children: [
                      _TileText(
                        name: name,
                        videosNew: videosNew,
                        videosTotal: videosTotal,
                        videosWatched: videosWatched,
                      ),
                      const SizedBox(height: 16),
                      _PlaylistProgressionBar(
                        watched: videosWatched,
                        total: videosTotal,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradientBorder extends StatelessWidget {
  final Widget child;
  final Color dropShadowColor;
  final Color mainColor;

  const _GradientBorder({
    Key? key,
    required this.child,
    required this.mainColor,
    required this.dropShadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          colors: [
            Colors.white24,
            Color.fromRGBO(40, 38, 44, 0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: dropShadowColor.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(-8, -8),
          ),
        ],
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: RadialGradient(
            center: Alignment.topLeft,
            colors: [
              mainColor.withOpacity(0.15),
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(1),
        child: child,
      ),
    );
  }
}

class _InnerShadow extends StatelessWidget {
  final Widget child;
  final Color mainColor;

  const _InnerShadow({
    Key? key,
    required this.child,
    required this.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Theme.of(context).backgroundColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1.5,
            colors: [
              mainColor.withOpacity(0.65),
              Colors.transparent,
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const RadialGradient(
              radius: 16,
              colors: [
                Colors.transparent,
                Colors.white10,
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _InnerBlur extends StatelessWidget {
  final Widget child;

  const _InnerBlur({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 100,
          sigmaY: 100,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white.withOpacity(0.075),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _TileText extends StatelessWidget {
  final String name;
  final int videosWatched;
  final int videosTotal;
  final int videosNew;

  const _TileText({
    Key? key,
    required this.name,
    required this.videosWatched,
    required this.videosTotal,
    required this.videosNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subtextStyle = Theme.of(context).textTheme.bodyText2;
    final greySubtextVideos = subtextStyle?.copyWith(color: AppColors.subtext);
    final greySubtextNumbers =
        subtextStyle?.copyWith(color: AppColors.subtextCount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '+$videosNew New Videos',
              style: (videosWatched == videosTotal)
                  ? greySubtextVideos
                  : subtextStyle,
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.fromLTRB(0, 3, 3, 1),
                  child: SvgPicture.asset(
                    'assets/images/eye_icon.svg',
                    color: (videosWatched == 0)
                        ? AppColors.orange
                        : AppColors.subtextCount,
                  ),
                ),
                Text(
                  '$videosWatched/$videosTotal',
                  style:
                      (videosWatched == 0) ? subtextStyle : greySubtextNumbers,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  _PlayButton({Key? key}) : super(key: key);

  final BorderRadius _radius = BorderRadius.circular(100);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 64,
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: _radius,
          gradient: RadialGradient(
            radius: 3,
            colors: [
              Colors.transparent,
              Colors.white.withOpacity(0.15),
            ],
            stops: const [0, 0.88],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 12),
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: _radius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white10,
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: _radius,
                  gradient: RadialGradient(
                    radius: 1,
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.15),
                    ],
                    stops: const [0.0, 0.5],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: _radius,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white30,
                        blurRadius: 8,
                        offset: Offset(-2, 2),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/images/play-button.svg',
                    width: 20,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistProgressionBar extends StatelessWidget {
  final int watched;
  final int total;
  late final Color gradientColor;
  late final Color shadowColor;

  _PlaylistProgressionBar({
    Key? key,
    required this.watched,
    required this.total,
  }) : super(key: key) {
    if (watched == total) {
      gradientColor = AppColors.orange;
    } else {
      gradientColor = Colors.white;
    }

    if (watched != 0 && watched != total) {
      shadowColor = Colors.white.withOpacity(0.24);
    } else {
      shadowColor = Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        heightFactor: 1,
        widthFactor: watched / total,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(
                  colors: [
                    AppColors.orange,
                    gradientColor,
                  ],
                  stops: const [0.95, 1],
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    color: AppColors.playlistProgressBarShadow,
                    blurRadius: 7,
                  ),
                ],
              ),
            ),
            Positioned(
              right: -7,
              bottom: -10,
              child: Container(
                width: 16,
                height: 24,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 9,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
