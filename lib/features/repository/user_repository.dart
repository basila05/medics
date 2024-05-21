import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/usersmodel1.dart';
import '../providers/firebase_providers.dart';

final AddingRepositoryProvider = Provider((ref) => AddingRepository(firestore: ref.watch(fireStoreProvider)));

class AddingRepository{
  final FirebaseFirestore _firestore;
  AddingRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _users => _firestore.collection("users");


  streamData(){
    return _users.snapshots().map((event) => event.docs.map((e) => UsersModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

}