import 'package:cl_dart_extensions/cl_dart_extensions.dart';
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
                FutureBuilder(
                  future: getDartExtensionsVersion(),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting ||
                        !snapShot.hasData) {
                      return const SizedBox.shrink();
                    }
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Package: Extensions: ${snapShot.data!}'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
