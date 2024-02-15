// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i9;
import '../../../application/fast%20laughs/fast_laughs_bloc.dart' as _i10;
import '../../../application/hot%20&%20new/hot_and_new_bloc.dart' as _i11;
import '../../../application/search/search_bloc.dart' as _i12;
import '../../../infrastrcture/downloads/downloads_repository.dart' as _i6;
import '../../../infrastrcture/hot%20and%20new/hot_and_new_imp.dart' as _i4;
import '../../../infrastrcture/search/search_impl.dart' as _i8;
import '../../downloads/i_download_repo.dart' as _i5;
import '../../new%20&%20hot/hot_and_service.dart' as _i3;
import '../../search/search_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplementation());
  gh.lazySingleton<_i5.IdownloadsRepo>(() => _i6.DownloadRepository());
  gh.lazySingleton<_i7.SearchService>(() => _i8.SearchImpl());
  gh.factory<_i9.DownloadsBloc>(
      () => _i9.DownloadsBloc(get<_i5.IdownloadsRepo>()));
  gh.factory<_i10.FastLaughsBloc>(
      () => _i10.FastLaughsBloc(get<_i5.IdownloadsRepo>()));
  gh.factory<_i11.HotAndNewBloc>(
      () => _i11.HotAndNewBloc(get<_i3.HotAndNewService>()));
  gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
        get<_i5.IdownloadsRepo>(),
        get<_i7.SearchService>(),
      ));
  return get;
}
