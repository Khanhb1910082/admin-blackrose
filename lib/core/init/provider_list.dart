import 'package:blackrose_admin_panel/providers/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//import '../navigation/navigation_service.dart';

class ApplicationProvider {
  // static ApplicationProvider? _instance;
  // static ApplicationProvider get instance {
  //   _instance ??= ApplicationProvider._init();
  //   return _instance!;
  // }

  // ApplicationProvider._init();

  // List<SingleChildWidget> singleItems = [];
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => MenuProvider(),
    ),

    //  Provider.value(value: NavigationService.instance)
  ];
  // List<SingleChildWidget> uiChangesItems = [];
}
