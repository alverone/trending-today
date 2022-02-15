import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';

import '../theme/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentTabIndex;
  final Function(int) callback;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentTabIndex,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88.0,
      width: double.infinity,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.black.withOpacity(0.9),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Stack(
              children: [
                BottomNavigationBar(
                  elevation: 0.0,
                  backgroundColor: Colors.black.withOpacity(0.9),
                  type: BottomNavigationBarType.shifting,
                  onTap: callback,
                  currentIndex: currentTabIndex,
                  selectedLabelStyle: const TextStyle(
                    fontSize: 10.0,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: AppColors.orange,
                  ),
                  selectedItemColor: AppColors.orange,
                  unselectedLabelStyle: const TextStyle(fontSize: 8.0),
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: _TabIcon(
                        iconSource: 'assets/images/tab_hot.svg',
                        iconActiveSource: 'assets/images/tab_hot_active.svg',
                        index: currentTabIndex,
                        match: 0,
                        type: ImageType.svg,
                      ),
                      label: 'Hot',
                    ),
                    BottomNavigationBarItem(
                      icon: _TabIcon(
                        iconSource: 'assets/images/tab_discover.svg',
                        iconActiveSource:
                            'assets/images/tab_discover_active.svg',
                        index: currentTabIndex,
                        match: 1,
                        type: ImageType.svg,
                      ),
                      label: 'Discover',
                    ),
                    BottomNavigationBarItem(
                      icon: _TabIcon(
                        iconSource: 'assets/images/tab_home.svg',
                        iconActiveSource: 'assets/images/tab_home_active.svg',
                        index: currentTabIndex,
                        match: 2,
                        type: ImageType.svg,
                      ),
                      label: 'Watch',
                    ),
                    BottomNavigationBarItem(
                      icon: _TabIcon(
                        iconSource: 'assets/images/tab_inbox.svg',
                        iconActiveSource: 'assets/images/tab_inbox_active.svg',
                        index: currentTabIndex,
                        match: 3,
                        type: ImageType.svg,
                      ),
                      label: 'Inbox',
                    ),
                    BottomNavigationBarItem(
                      icon: _TabIcon(
                        iconSource: 'assets/images/tab_profile.png',
                        iconActiveSource:
                            'assets/images/tab_profile_active.png',
                        index: currentTabIndex,
                        match: 4,
                        type: ImageType.png,
                      ),
                      label: 'Profile',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabIcon extends StatelessWidget {
  final int index;
  final int match;
  final String iconSource;
  final String iconActiveSource;
  final ImageType type;

  const _TabIcon({
    Key? key,
    required this.index,
    required this.iconSource,
    required this.match,
    required this.iconActiveSource,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasMatched = (index == match);
    final Color navigationShadow =
        hasMatched ? AppColors.navigationShadow : Colors.transparent;

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 20.0,
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: navigationShadow,
              )
            ],
          ),
        ),
        _Icon(
          match: hasMatched,
          iconActiveSource: iconActiveSource,
          iconSource: iconSource,
          type: type,
        ),
        Positioned(
          top: 40.0,
          child: Container(
            width: 160.0,
            height: 160.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 24.0,
                  color: hasMatched
                      ? AppColors.orange.withOpacity(0.17)
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  final bool match;
  final ImageType type;
  final String iconSource;
  final String iconActiveSource;

  const _Icon({
    Key? key,
    required this.match,
    required this.type,
    required this.iconActiveSource,
    required this.iconSource,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == ImageType.svg) {
      return Column(
        children: [
          SvgPicture.asset(
            match ? iconActiveSource : iconSource,
            width: 24.0,
            height: 24.0,
          ),
          const SizedBox(height: 2.0),
        ],
      );
    } else {
      return Column(
        children: [
          Image(
            image: AssetImage(
              match ? iconActiveSource : iconSource,
            ),
            width: 24.0,
            height: 24.0,
          ),
          const SizedBox(height: 2.0),
        ],
      );
    }
  }
}

enum ImageType {
  png,
  svg,
}
