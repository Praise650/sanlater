import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanlater/ui/layout/drawer/drawer_view_model.dart';
import 'package:sanlater/util/assets.dart';
import 'package:sanlater/util/colors.dart';
import 'package:sanlater/util/text_styles.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Drawer(
          child: Consumer<DrawerModelData>(builder: (context, snapshot, child) {
            return Container(
              height: MediaQuery.of(context).size.height,
              color: App.appPrimary,
              padding: const EdgeInsets.only(left: 25.0, top: 77),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AssetsImages.sanlaterlogo2,
                      height: 100, width: 60),
                  Padding(
                    padding: const EdgeInsets.only(top: 77.0),
                    child: Column(
                      children: List.generate(
                          snapshot.taskCount,
                          (index) => GestureDetector(
                                onTap: () {
                                    snapshot.updateIndex(context, index);
                                },
                                child: Container(
                                  color: snapshot.selectedndex == index
                                      ? App.selectedDrawerTile
                                      : Colors.transparent,
                                  child: ListTile(
                                    contentPadding: EdgeInsets.only(left: 22),
                                    leading: Icon(
                                        snapshot
                                            .drawerViewModel[index].iconData,
                                        color: App.appWhite),
                                    title: Text(
                                        snapshot
                                            .drawerViewModel[index].activities,
                                        style: sizeEighteenNormal),
                                  ),
                                ),
                              )),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 86.0, left: 15),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 29,
              width: 29,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  shape: BoxShape.rectangle,
                  color: Colors.red),
              child: Icon(Icons.close, color: App.appWhite),
            ),
          ),
        )
      ],
    );
  }
}
