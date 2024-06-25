import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/ambulanceModel.dart';
import '../../models/doctormodel.dart';
import '../../models/hospitalModel.dart';
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

  add(DoctorModel docData){
    _doctors.add(docData.toMap()).then((value) {
      value.update(docData.copyWith(id: value.id).toMap());
    },);
  }

  deleteDoc(String id){
    _doctors.doc(id).delete();
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

  add(MedicineModel medData){
    _medicine.add(medData.toMap()).then((value) {
      value.update(medData.copyWith(id: value.id).toMap());
    },);
  }

  deleteMed(String id){
    _medicine.doc(id).delete();
  }
  streamMed(){
    return _medicine.snapshots().map((event) => event.docs.map((e) => MedicineModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }
  UpdateMed(MedicineModel mededit){
    _medicine.doc(mededit.id).update(mededit.toMap());
  }

}

///hospital

final HsptlRepositoryProvider = Provider((ref) => HsptlRepository(firestore: ref.watch(fireStoreProvider)));

class HsptlRepository {
  final FirebaseFirestore _firestore;

  HsptlRepository({required FirebaseFirestore firestore})
      :_firestore=firestore;

  CollectionReference get _hsptl => _firestore.collection("hsptl");

  add(HsptlModel hsptlData) {
    _hsptl.add(hsptlData.toMap()).then((value) {
      value.update(hsptlData.copyWith(id: value.id).toMap());
    },);
  }

  deleteHsptl(HsptlModel hsptlDelete) {
    _hsptl.doc(hsptlDelete.id).delete();
  }

  streamHsptl() {
    return _hsptl.snapshots().map((event) =>
        event.docs.map((e) =>
            HsptlModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

  UpdateHsptl(HsptlModel hsptledit) {
    print(_hsptl.doc(hsptledit.id));
    _hsptl.doc(hsptledit.id).update(hsptledit.toMap()).then((value) {},);
  }

}

///ambulance

final AmbulanceRepositoryProvider = Provider((ref) => AmbulanceRepository(firestore: ref.watch(fireStoreProvider)));

class AmbulanceRepository {
  final FirebaseFirestore _firestore;

  AmbulanceRepository({required FirebaseFirestore firestore})
      :_firestore=firestore;
  CollectionReference get _ambulance => _firestore.collection("ambulance");

  add(AmbulanceModel ambulanceData) {
    _ambulance.add(ambulanceData.toMap()).then((value) {
      value.update(ambulanceData.copyWith(id: value.id).toMap());
    },);
  }

  deleteAmbulance(AmbulanceModel ambulanceDelete) {
    _ambulance.doc(ambulanceDelete.id).delete();
  }

  streamAmbulance() {
    return _ambulance.snapshots().map((event) =>
        event.docs.map((e) =>
            AmbulanceModel.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

  UpdateAmbulance(AmbulanceModel ambulanceedit) {
    print(_ambulance.doc(ambulanceedit.id));
    _ambulance.doc(ambulanceedit.id).update(ambulanceedit.toMap()).then((value) {},);
  }

}