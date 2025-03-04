import 'package:cl_dart_extensions/cl_dart_extensions.dart';
import 'package:cl_services/cl_services.dart';
import 'package:cl_store/cl_store.dart';
import 'package:cl_store_local/cl_store_local.dart';
import 'package:cl_store_server/cl_store_server.dart';
import 'package:cl_widgets/cl_widgets.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep It',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                Text(
                  'Keep It, A Colan App',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                for (final entry in {
                  'Extension': getDartExtensionsVersion,
                  'Store': getStoreVersion,
                  'Local Store': getLocalStoreVersion,
                  'Server Store': getServerStoreVersion,
                  'services': getServicesVersion,
                  'widgets': getWidgetsVersion,
                }.entries)
                  PackageVersion(
                    name: entry.key,
                    getVersion: entry.value,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PackageVersion extends StatelessWidget {
  const PackageVersion({
    required this.name,
    required this.getVersion,
    super.key,
  });
  final String name;
  final Future<String> Function() getVersion;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVersion(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting ||
            !snapShot.hasData) {
          return const SizedBox.shrink();
        }
        return ListTile(
          title: Text('Package: $name: ${snapShot.data!}'),
        );
      },
    );
  }
}
