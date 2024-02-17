// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i11;
import '../../../application/fast%20laughs/fast_laughs_bloc.dart' as _i12;
import '../../../application/Home/home_bloc.dart' as _i13;
import '../../../application/hot%20&%20new/hot_and_new_bloc.dart' as _i14;
import '../../../application/search/search_bloc.dart' as _i15;
import '../../../infrastrcture/downloads/downloads_repository.dart' as _i8;
import '../../../infrastrcture/home/home_impl.dart' as _i4;
import '../../../infrastrcture/hot%20and%20new/hot_and_new_imp.dart' as _i6;
import '../../../infrastrcture/search/search_impl.dart' as _i10;
import '../../downloads/i_download_repo.dart' as _i7;
import '../../home/home_service.dart' as _i3;
import '../../new%20&%20hot/hot_and_service.dart' as _i5;
import '../../search/search_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HomeService>(() => _i4.HomeImplimentation());
  gh.lazySingleton<_i5.HotAndNewService>(() => _i6.HotAndNewImplementation());
  gh.lazySingleton<_i7.IdownloadsRepo>(() => _i8.DownloadRepository());
  gh.lazySingleton<_i9.SearchService>(() => _i10.SearchImpl());
  gh.factory<_i11.DownloadsBloc>(
      () => _i11.DownloadsBloc(get<_i7.IdownloadsRepo>()));
  gh.factory<_i12.FastLaughsBloc>(
      () => _i12.FastLaughsBloc(get<_i7.IdownloadsRepo>()));
  gh.factory<_i13.HomeBloc>(() => _i13.HomeBloc(get<_i3.HomeService>()));
  gh.factory<_i14.HotAndNewBloc>(
      () => _i14.HotAndNewBloc(get<_i5.HotAndNewService>()));
  gh.factory<_i15.SearchBloc>(() => _i15.SearchBloc(
        get<_i7.IdownloadsRepo>(),
        get<_i9.SearchService>(),
      ));
  return get;
}
