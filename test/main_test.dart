import 'features/home/bloc/home_bloc_test.dart' as home_bloc_test;
import 'features/home/repositories/home_repository_test.dart'
    as home_repository_test;
import 'features/home/ui/widgets/mobile/home_page_test.dart' as home_page_test;

void main() {
  // bloc's
  home_bloc_test.main();

  // repo's
  home_repository_test.main();

  // ui
  home_page_test.main();
}
