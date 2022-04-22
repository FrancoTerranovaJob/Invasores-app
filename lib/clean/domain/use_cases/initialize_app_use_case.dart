import 'package:kiwi/kiwi.dart';
import 'package:urbe_solution/clean/domain/repository/i_repository.dart';

class InitializeAppUseCase {
  final repository = KiwiContainer().resolve<IRepository>();
  Future<bool> call() async {
    return repository.initializeApp();
  }
}
