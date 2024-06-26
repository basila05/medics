import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medics/models/doctormodel.dart';
import '../../features/repository/user_repository.dart';
import '../../models/ambulanceModel.dart';
import '../../models/hospitalModel.dart';
import '../../models/medicinemodel.dart';
import '../../models/usersmodel1.dart';


final AddingControllerProvider = Provider((ref) => AddingController(addingRepository: ref.watch(AddingRepositoryProvider)));
final StreamDataProvider = StreamProvider((ref) => ref.watch(AddingControllerProvider).StreamUserData());

class AddingController {
  final AddingRepository _addingRepository;

  AddingController({required AddingRepository addingRepository})
      : _addingRepository= addingRepository;

  Stream StreamUserData() {
    return _addingRepository.streamData();
  }
}

  ///doctor
  final DoctorControllerProvider = Provider((ref) => DoctorController(doctorRepository: ref.watch(DoctorRepositoryProvider)));
  final StreamDocProvider = StreamProvider((ref) => ref.watch(DoctorControllerProvider).StreamDoctorData());

  class DoctorController{
  final DoctorRepository _doctorRepository;
  DoctorController({required DoctorRepository doctorRepository}): _doctorRepository= doctorRepository;

  addDoctorData(DoctorModel docData){
    _doctorRepository.add(docData);
  }
  Stream StreamDoctorData(){
    return _doctorRepository.streamDoc();
  }
  deleteData(String id){
    _doctorRepository.deleteDoc(id);
  }
  updateData(DoctorModel docUpdate){
    _doctorRepository.UpdateDoc(docUpdate);
  }

}


///medicine
final MedicineControllerProvider = Provider((ref) => MedicineController(medicineRepository: ref.watch(MedicineRepositoryProvider)));
final StreamMedProvider = StreamProvider((ref) => ref.watch(MedicineControllerProvider).StreamMedicineData());

class MedicineController{
  final MedicineRepository _medicineRepository;
  MedicineController({required MedicineRepository medicineRepository}): _medicineRepository= medicineRepository;

  addMedicineData(MedicineModel medAdd){
    _medicineRepository.add(medAdd);
  }
  Stream StreamMedicineData(){
    return _medicineRepository.streamMed();
  }
  delete(String id){
    _medicineRepository.deleteMed(id);
  }
  updateData(MedicineModel medUpdate){
    _medicineRepository.UpdateMed(medUpdate);
  }

}

///hospital
final HsptlControllerProvider = Provider((ref) => HsptlController(hsptlRepository: ref.watch(HsptlRepositoryProvider)));
final StreamHsptlProvider = StreamProvider((ref) => ref.watch(HsptlControllerProvider).StreamHsptlData());

class HsptlController {
  final HsptlRepository _hsptlRepository;

  HsptlController({required HsptlRepository hsptlRepository})
      : _hsptlRepository= hsptlRepository;

  addHsptlData(HsptlModel hsptlAdd) {
    _hsptlRepository.add(hsptlAdd);
  }

  Stream StreamHsptlData() {
    return _hsptlRepository.streamHsptl();
  }

  deleteData(HsptlModel hsptlDelete) {
    _hsptlRepository.deleteHsptl(hsptlDelete);
  }

  updateData(HsptlModel hsptlUpdate) {
    _hsptlRepository.UpdateHsptl(hsptlUpdate);
  }

}

///ambulance
final AmbulanceControllerProvider = Provider((ref) => AmbulanceController(ambulanceRepository: ref.watch(AmbulanceRepositoryProvider)));
final StreamAmbulanceProvider = StreamProvider((ref) => ref.watch(AmbulanceControllerProvider).StreamAmbulanceData());

class AmbulanceController {
  final AmbulanceRepository _ambulanceRepository;

  AmbulanceController({required AmbulanceRepository ambulanceRepository})
      : _ambulanceRepository= ambulanceRepository;

  addAmbulanceData(AmbulanceModel ambulanceAdd) {
    _ambulanceRepository.add(ambulanceAdd);
  }

  Stream StreamAmbulanceData() {
    return _ambulanceRepository.streamAmbulance();
  }

  deleteData(AmbulanceModel ambulanceDelete) {
    _ambulanceRepository.deleteAmbulance(ambulanceDelete);
  }

  updateData(AmbulanceModel ambulanceUpdate) {
    _ambulanceRepository.UpdateAmbulance(ambulanceUpdate);
  }
}