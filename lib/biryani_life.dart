import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'widgets.dart';
import 'tabdata.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class SliversExample extends StatefulWidget {
  @override
  _SliversExampleState createState() => _SliversExampleState();
}

class _SliversExampleState extends State<SliversExample>
    with TickerProviderStateMixin {
  final menuKey = GlobalKey();
  final mostsellingKey = GlobalKey();
  final starterKey = GlobalKey();
  final biryaniKey = GlobalKey();
  final dessertKey = GlobalKey();
  final sliverListtKey = GlobalKey();
  late RenderBox overRender;
  late RenderBox revRender;
  late RenderBox menuRender;
  late RenderBox contactRender;
  late RenderBox sliverRender;
  late ScrollController scrollController;
  late TabController _tabController;
  late TabController _topTabController;
  late double menuHeight;
  late double mostsellingHeight;
  late double starterHeight;
  late double biryaniHeight;
  late double dessertHeight;
  late abovetabbar abovetabbars;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _tabController = TabController(length: 4, vsync: this);
    _topTabController = TabController(length: 4, vsync: this);
    addScrollControllerListener();
  }

  void addScrollControllerListener() {
    scrollController.addListener(() {
      if (menuKey.currentContext != null) {
        menuHeight = menuKey.currentContext!.size!.height;
      }
      if (mostsellingKey.currentContext != null) {
        mostsellingHeight = mostsellingKey.currentContext!.size!.height;
      }
      if (starterKey.currentContext != null) {
        starterHeight = starterKey.currentContext!.size!.height;
      }
      if (biryaniKey.currentContext != null) {
        biryaniHeight = biryaniKey.currentContext!.size!.height;
      }
      if (dessertKey.currentContext != null) {
        biryaniHeight = dessertKey.currentContext!.size!.height;
      }
      if (scrollController.offset > menuHeight + 200 &&
          scrollController.offset < mostsellingHeight + menuHeight + 200) {
      } else {}
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (scrollController.offset > 0 &&
            scrollController.offset < menuHeight + 200) {
          _tabController.animateTo(0);
        } else if (scrollController.offset > menuHeight + 200 &&
            scrollController.offset < mostsellingHeight + menuHeight + 200) {
          _tabController.animateTo(1);
        } else if (scrollController.offset >
                mostsellingHeight + menuHeight + 200 &&
            scrollController.offset <
                mostsellingHeight + menuHeight + starterHeight + 200) {
          _tabController.animateTo(2);
        } else if (scrollController.offset >
                mostsellingHeight + menuHeight + starterHeight + 200 &&
            scrollController.offset <=
                mostsellingHeight +
                    menuHeight +
                    starterHeight +
                    biryaniHeight +
                    200) {
          _tabController.animateTo(3);
        } else if (scrollController.offset >
                mostsellingHeight +
                    menuHeight +
                    starterHeight +
                    biryaniHeight +
                    200 &&
            scrollController.offset <=
                mostsellingHeight +
                    menuHeight +
                    starterHeight +
                    biryaniHeight +
                    dessertHeight +
                    200) {
          _tabController.animateTo(4);
        } else {}
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (scrollController.offset < menuHeight) {
          _tabController.animateTo(0);
        } else if (scrollController.offset > menuHeight &&
            scrollController.offset < mostsellingHeight + menuHeight) {
          _tabController.animateTo(1);
        } else if (scrollController.offset > mostsellingHeight + menuHeight &&
            scrollController.offset <
                mostsellingHeight + menuHeight + starterHeight) {
          _tabController.animateTo(2);
        } else if (scrollController.offset >
                mostsellingHeight + menuHeight + starterHeight &&
            scrollController.offset <
                mostsellingHeight +
                    menuHeight +
                    starterHeight +
                    biryaniHeight) {
          _tabController.animateTo(3);
        } else if (scrollController.offset >
                mostsellingHeight +
                    menuHeight +
                    starterHeight +
                    biryaniHeight &&
            scrollController.offset <
                mostsellingHeight +
                    menuHeight +
                    starterHeight +
                    biryaniHeight +
                    dessertHeight) {
          _tabController.animateTo(4);
        } else {}
      }
    });
  }

  void tabBarOnTap(val) {
    switch (val) {
      case 0:
        {
          if (menuKey.currentContext == null) {
            scrollController.position
                .ensureVisible(
              starterKey.currentContext!.findRenderObject()!,
              alignment:
                  0.0, // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 200),
            )
                .then((value) {
              scrollController.position
                  .ensureVisible(
                starterKey.currentContext!.findRenderObject()!,
                alignment:
                    0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  mostsellingKey.currentContext!.findRenderObject()!,
                  alignment:
                      0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    menuKey.currentContext!.findRenderObject()!,
                    alignment:
                        0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            });
          } else {
            scrollController.position.ensureVisible(
              menuKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
      case 1:
        {
          if (mostsellingKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                menuKey.currentContext!.findRenderObject()!,
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  menuKey.currentContext!.findRenderObject()!,
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    mostsellingKey.currentContext!.findRenderObject()!,
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            } else {
              scrollController.position
                  .ensureVisible(
                starterKey.currentContext!.findRenderObject()!,
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  starterKey.currentContext!.findRenderObject()!,
                  alignment: 0.0,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    mostsellingKey.currentContext!.findRenderObject()!,
                    alignment: 0.5,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position.ensureVisible(
                      mostsellingKey.currentContext!.findRenderObject()!,
                      alignment: 0.0,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    );
                  });
                });
              });
            }
          } else {
            scrollController.position.ensureVisible(
              mostsellingKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 400),
            );
          }
        }
        break;
      case 2:
        {
          if (starterKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                menuKey.currentContext!.findRenderObject()!,
                alignment: 0.0,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  menuKey.currentContext!.findRenderObject()!,
                  alignment: 0.5,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    mostsellingKey.currentContext!.findRenderObject()!,
                    alignment: 0.0,
                    // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position
                        .ensureVisible(
                      mostsellingKey.currentContext!.findRenderObject()!,
                      alignment: 0.5,
                      // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController.position.ensureVisible(
                        starterKey.currentContext!.findRenderObject()!,
                        alignment: 0.2,
                        // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      );
                    });
                  });
                });
              });
            } else if (_tabController.previousIndex == 1) {
              scrollController.position
                  .ensureVisible(
                mostsellingKey.currentContext!.findRenderObject()!,
                alignment: 0.5,
                // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position.ensureVisible(
                  starterKey.currentContext!.findRenderObject()!,
                  alignment: 0.2,
                  // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                );
              });
            }
          } else {
            scrollController.position.ensureVisible(
              starterKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 600),
            );
          }
        }
        break;
      case 3:
        {
          if (biryaniKey.currentContext == null) {
            if (_tabController.previousIndex == 0) {
              scrollController.position
                  .ensureVisible(
                menuKey.currentContext!.findRenderObject()!,
                alignment:
                    0.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  menuKey.currentContext!.findRenderObject()!,
                  alignment:
                      0.5, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position
                      .ensureVisible(
                    mostsellingKey.currentContext!.findRenderObject()!,
                    alignment:
                        0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  )
                      .then((value) {
                    scrollController.position
                        .ensureVisible(
                      mostsellingKey.currentContext!.findRenderObject()!,
                      alignment:
                          0.5, // How far into view the item should be scrolled (between 0 and 1).
                      duration: const Duration(milliseconds: 200),
                    )
                        .then((value) {
                      scrollController.position
                          .ensureVisible(
                        starterKey.currentContext!.findRenderObject()!,
                        alignment:
                            0.0, // How far into view the item should be scrolled (between 0 and 1).
                        duration: const Duration(milliseconds: 200),
                      )
                          .then((value) {
                        scrollController.position
                            .ensureVisible(
                          starterKey.currentContext!.findRenderObject()!,
                          alignment:
                              0.5, // How far into view the item should be scrolled (between 0 and 1).
                          duration: const Duration(milliseconds: 200),
                        )
                            .then((value) {
                          scrollController.position.ensureVisible(
                            biryaniKey.currentContext!.findRenderObject()!,
                            alignment:
                                0.0, // How far into view the item should be scrolled (between 0 and 1).
                            duration: const Duration(milliseconds: 200),
                          );
                        });
                      });
                    });
                  });
                });
              });
            } else {
              scrollController.position
                  .ensureVisible(
                mostsellingKey.currentContext!.findRenderObject()!,
                alignment:
                    1.0, // How far into view the item should be scrolled (between 0 and 1).
                duration: const Duration(milliseconds: 200),
              )
                  .then((value) {
                scrollController.position
                    .ensureVisible(
                  starterKey.currentContext!.findRenderObject()!,
                  alignment:
                      0.0, // How far into view the item should be scrolled (between 0 and 1).
                  duration: const Duration(milliseconds: 200),
                )
                    .then((value) {
                  scrollController.position.ensureVisible(
                    biryaniKey.currentContext!.findRenderObject()!,
                    alignment:
                        0.0, // How far into view the item should be scrolled (between 0 and 1).
                    duration: const Duration(milliseconds: 200),
                  );
                });
              });
            }
          } else {
            scrollController.position.ensureVisible(
              biryaniKey.currentContext!.findRenderObject()!,
              alignment: 0.0,
              // How far into view the item should be scrolled (between 0 and 1).
              duration: const Duration(milliseconds: 800),
            );
          }
        }
        break;
    }
  }

  SliverPersistentHeader makeTabBarHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 50.0,
        maxHeight: 50.0,
        child: Container(
          color: Colors.white,
          child: TabBar(
            onTap: (val) {
              tabBarOnTap(val);
            },
            unselectedLabelColor: Colors.grey.shade700,
            indicatorColor: Colors.orange,
            isScrollable: true,
            indicatorWeight: 2.0,
            labelColor: Colors.orange,
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.menu),
              ),
              Tab(
                child: Text(
                  " Most Sellings",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  "Starter",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Tab(
                child: Text(
                  "Biryani",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _topTabController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title: const Text(
          'The Biryani Life',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Image.asset(
                            'assets/biryani.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const abovetabbar(),
                      ]),
                  height: data.size.height / 2,
                )
              ],
            ),
          ),
          makeTabBarHeader(),
          SliverList(
            key: sliverListtKey,
            delegate: SliverChildListDelegate(
              [
                Container(
                  key: menuKey,
                  child: Tab1(
                    title: 'Menu',
                  ),
                ),
                Container(
                  key: mostsellingKey,
                  child: Tab1(
                    title: 'Most Selling',
                  ),
                ),
                Container(
                  key: starterKey,
                  child: Tab1(
                    title: 'Starter',
                  ),
                ),
                Container(
                  key: biryaniKey,
                  child: Tab1(
                    title: 'Biryani',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
