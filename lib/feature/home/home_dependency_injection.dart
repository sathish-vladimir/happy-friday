import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/source/home_remote_source.dart';
import 'data/source/home_local_source.dart';
import 'data/repo/home_repository.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final homeRemoteSourceProvider = Provider<HomeRemoteSource>((ref) {
  return HomeRemoteSource(ref.watch(firestoreProvider));
});

final homeLocalSourceProvider = Provider<HomeLocalSource>((ref) => HomeLocalSource());

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository(ref.watch(homeRemoteSourceProvider), ref.watch(homeLocalSourceProvider));
});
