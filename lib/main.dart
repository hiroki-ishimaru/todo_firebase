import 'package:flutter/material.dart';
import 'package:todo_firebase/view/todo_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// A Counter example implemented with riverpod

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo w/firebase',
      home: TodoScreen()
    );
  }
}

/// Providers are declared globally and specifies how to create a state
final counterProvider = StateProvider((ref) => 0);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        // You could also use the hook "useProvider" if you uses flutter_hooks
        child: Consumer(builder: (context, watch, _) {
          final count = watch(counterProvider).state;
          return Text('$count');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () => context.read(counterProvider).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}