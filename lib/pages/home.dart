import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sticky/models/lens_profile.dart';
import 'package:sticky/pages/pages.dart';
import 'package:sticky/services/queries.dart';
import 'package:sticky/utils/utils.dart';
import 'package:sticky/widgets/widgets.dart';
import 'package:sticky/models/models.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:graphql/client.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.videos}) : super(key: key);

  final List<LensPublications> videos;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* Methods and Functions

  late final SwipableStackController _controller;
  final Queries _query = Queries();

  final _link = HttpLink('https://api.lens.dev/');

  void _listenController() => setState(() {});

  var _session, _uri, _signature;
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'My App',
          description: 'An app for testing metamask capabilities',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  loginUsingMetamask() async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });

        print(session.accounts[0]);
        print(session.chainId);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }

  singMessageWithMetamask(BuildContext context, String message) async {
    if (connector.connected) {
      try {
        print('Message recieved');
        print(message);

        EthereumWalletConnectProvider provider =
            EthereumWalletConnectProvider(connector);
        launchUrlString(_uri, mode: LaunchMode.externalApplication);

        var signature = await provider.personalSign(
            message: message, address: _session.accounts[0], password: '');

        print(signature);
        setState(() {
          _signature = signature;
        });
      } catch (exp) {
        print('Error while signing transaction');
        print(exp);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
        (session) => setState(() {
              _session = _session;
            }));
    connector.on(
        'session_update',
        (payload) => setState(() {
              _session = payload;
              print(_session.accounts[0]);
              print(_session.chainId);
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              _session = null;
            }));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          _buildAvatar(context),
        ],
      ),
      drawer: _drawer(),
      extendBodyBehindAppBar: true,
      body: OrientationBuilder(
        builder: ((context, orientation) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/back.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: _buildSwiper(orientation),
          );
        }),
      ),
    );
  }

//* Widget Builds

  Padding _buildSwiper(Orientation orientation) {
    return Padding(
      padding: orientation == Orientation.landscape
          ? const EdgeInsets.all(10)
          : const EdgeInsets.symmetric(horizontal: 5, vertical: 40),
      child: SwipableStack(
        detectableSwipeDirections: const {
          SwipeDirection.right,
          SwipeDirection.left,
          SwipeDirection.up
        },
        controller: _controller,
        stackClipBehaviour: Clip.none,
        onSwipeCompleted: (index, direction) {
          if (kDebugMode) {
            print('$index, $direction');
            if (direction == SwipeDirection.right) {
              // Hit Lens API to lik
              //_controllerConf.play();
            } else if (direction == SwipeDirection.left) {
              // Internal Algo
            } else if (direction == SwipeDirection.up) {
              // Hit Lens API Follow
            } else if (direction == SwipeDirection.down) {
              // Do something
            }
          }
        },
        horizontalSwipeThreshold: 0.5,
        verticalSwipeThreshold: 0.4,
        builder: (context, properties) {
          final itemIndex = properties.index % widget.videos.length;
          return StickyCard(
            content: widget.videos[itemIndex],
          );
        },
      ),
    );
  }

  Padding _buildAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        },
        child: const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primary,
          backgroundImage: AssetImage("assets/images/majorTom.png"),
        ),
      ),
    );
  }

  _drawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset("assets/images/menuHeader.png"),
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.wallet),
            title: Text(
              'Connect Wallet',
              style: AppStyles.menu,
            ),
            onTap: () async {
              // Update the state of the app.
              // ...

              await loginUsingMetamask();
              final GraphQLClient _client =
                  GraphQLClient(link: _link, cache: GraphQLCache());
              final QueryOptions _options = QueryOptions(
                  document: gql(_query.fetchDefaultProfile()),
                  variables: {
                    'request': {'ethereumAddress': _session.accounts[0]}
                  });

              final QueryResult _result = await _client.query(_options);
              if (_result.hasException) {
                print(_result.exception.toString());
              }

              final profileId = (_result.data?['defaultProfile']['id']);
              print(profileId);

              final QueryOptions profileOptions = QueryOptions(
                  document: gql(_query.fetchProfile()),
                  variables: {
                    'request': {'profileId': profileId}
                  });

              final QueryResult result = await _client.query(profileOptions);
              if (result.hasException) {
                print(_result.exception.toString());
              }

              final _profile = result.data?['profile'];
              print(_profile);

              LensProfile profile = LensProfile.fromJson(_profile);
              print(profile.handle);
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.qrcode),
            title: Text(
              'Access Code',
              style: AppStyles.menu,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.gear),
            title: Text(
              'Settings',
              style: AppStyles.menu,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.wallet),
            title: Text(
              'FAQ',
              style: AppStyles.menu,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
