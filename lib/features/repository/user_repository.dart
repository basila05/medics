import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/doctormodel.dart';
import '../../models/medicinemodel.dart';
import '../../models/usersmodel1.dart';
import '../providers/firebase_providers.dart';

final AddingRepositoryProvider = Provider((ref) => AddingRepository(firestore: ref.watch(fireStoreProvider)));

class AddingRepository {
  final FirebaseFirestore _firestore;

  AddingRepository({required FirebaseFirestore firestore})
      :_firestore=firestore;

  CollectionReference get _users => _firestore.collection("users");

  streamData() {
    return _users.snapshots().map((event) =>
        event.docs.map((e) =>
            UsersModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

}

  ///doctor
  final DoctorRepositoryProvider = Provider((ref) => DoctorRepository(firestore: ref.watch(fireStoreProvider)));

  class DoctorRepository{
  final FirebaseFirestore _firestore;
  DoctorRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _doctors => _firestore.collection("doctors");

  add(name, spcl, location, id){
    DoctorModel docData = DoctorModel(
      name: name,
      spcl: spcl,
      location: location,
      id: '',
    );

    _doctors.add(docData.toMap()).then((value) {
      value.update(docData.copyWith(id: value.id).toMap());
    },);
  }

  deleteDoc(DoctorModel docDelete){
    _doctors.doc(docDelete.id).delete();
  }
  streamDoc(){
    return _doctors.snapshots().map((event) => event.docs.map((e) => DoctorModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }
  UpdateDoc(DoctorModel docedit){
    print(_doctors.doc(docedit.id));
    _doctors.doc(docedit.id).update(docedit.toMap()).then((value) {
    },);
  }

}

///medicine
final MedicineRepositoryProvider = Provider((ref) => MedicineRepository(firestore: ref.watch(fireStoreProvider)));

class MedicineRepository{
  final FirebaseFirestore _firestore;
  MedicineRepository({required FirebaseFirestore firestore}):_firestore=firestore;

  CollectionReference get _medicine => _firestore.collection("medicine");

  add(name, ml, rate, off, id){
    MedicineModel medData = MedicineModel(
        name: name,
        ml: ml,
        rate: rate,
        off: off,
        id: ''
    );

    _medicine.add(medData.toMap()).then((value) {
      value.update(medData.copyWith(id: value.id).toMap());
    },);
  }

  deleteMed(MedicineModel medDelete){
    _medicine.doc(medDelete.id).delete();
  }
  streamMed(){
    return _medicine.snapshots().map((event) => event.docs.map((e) => MedicineModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }
  UpdateMed(MedicineModel mededit){
    print(_medicine.doc(mededit.id));
    _medicine.doc(mededit.id).update(mededit.toMap()).then((value) {
    },);
  }

}