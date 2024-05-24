import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medics/models/doctormodel.dart';
import '../../features/repository/user_repository.dart';
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

  addDoctorData(name, location, spcl, id){
    _doctorRepository.add(name, location, spcl, id);
  }
  Stream StreamDoctorData(){
    return _doctorRepository.streamDoc();
  }
  deleteData(DoctorModel docDelete){
    _doctorRepository.deleteDoc(docDelete);
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

  addMedicineData(name, rate, ml, off, id){
    _medicineRepository.add(name, rate, ml, off, id);
  }
  Stream StreamMedicineData(){
    return _medicineRepository.streamMed();
  }
  deleteData(MedicineModel medDelete){
    _medicineRepository.deleteMed(medDelete);
  }
  updateData(MedicineModel medUpdate){
    _medicineRepository.UpdateMed(medUpdate);
  }

}