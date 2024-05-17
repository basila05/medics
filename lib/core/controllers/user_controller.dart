import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/repository/user_repository.dart';
import '../../models/usersmodel1.dart';


final AddingControllerProvider = Provider((ref) => AddingController(addingRepository: ref.watch(AddingRepositoryProvider)));
final StreamDataProvider = StreamProvider((ref) => ref.watch(AddingControllerProvider).streamUserData());

class AddingController{
  final AddingRepository _addingRepository;
  AddingController({required AddingRepository addingRepository}): _addingRepository= addingRepository;

  Stream streamUserData(){
    return _addingRepository.streamData();
  }

}