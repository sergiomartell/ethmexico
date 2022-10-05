import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sticky/pages/pages.dart';

class LensClient extends StatelessWidget {
  const LensClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink('https://api.lens.dev/');

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
    return GraphQLProvider(
      client: client,
      child: const QueryWrap(),
    );
  }
}
