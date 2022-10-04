import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:get/get.dart';

class UserData extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var _session;

  final WalletConnect _connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: "SuperSticky",
      description: "Mobile Video Platform for Lens",
      url: "https://supersticky.io",
      icons: [
        "https://firebasestorage.googleapis.com/v0/b/supersticky.appspot.com/o/icon.png?alt=media&token=95af9c7e-72a0-45f2-9523-c932d45d52f8"
      ],
    ),
  );

  get session => _session;

  Future<dynamic> loginViaMM() async {
    if (!_connector.connected) {
      try {
        _session = await _connector.createSession(onDisplayUri: (uri) async {
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
      } catch (e) {
        rethrow;
      }
    }
  }

  void init() {
    _connector.on("connect", (session) {
      _session = session;
      update();
    });
    _connector.on("session_update", (session) {
      _session = session;
      update();
    });
    _connector.on("disconnect", (session) {
      _session = null;
      update();
    });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
