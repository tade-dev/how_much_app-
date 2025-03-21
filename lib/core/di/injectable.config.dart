// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:how_much_app/core/api/api.dart' as _i4;
import 'package:how_much_app/core/routes/routes.dart' as _i3;
import 'package:how_much_app/features/auth/cubit/forgotpassword/forgot_password_cubit.dart'
    as _i19;
import 'package:how_much_app/features/auth/cubit/login/login_cubit.dart'
    as _i21;
import 'package:how_much_app/features/auth/cubit/register/register_cubit.dart'
    as _i24;
import 'package:how_much_app/features/auth/cubit/verification/verifcation_cubit.dart'
    as _i25;
import 'package:how_much_app/features/auth/data/datasource/auth_s.dart' as _i6;
import 'package:how_much_app/features/auth/data/datasource/auth_services.dart'
    as _i5;
import 'package:how_much_app/features/auth/data/repository/auth_impl.dart'
    as _i12;
import 'package:how_much_app/features/auth/domain/repositories/auth_r.dart'
    as _i11;
import 'package:how_much_app/features/auth/domain/usecases/auth_u.dart' as _i13;
import 'package:how_much_app/features/profile/cubit/profile_cubit.dart' as _i23;
import 'package:how_much_app/features/profile/data/datasource/profile_s.dart'
    as _i10;
import 'package:how_much_app/features/profile/data/datasource/profile_service.dart'
    as _i9;
import 'package:how_much_app/features/profile/data/repository/profile_impl.dart'
    as _i17;
import 'package:how_much_app/features/profile/domain/repositories/profile_r.dart'
    as _i16;
import 'package:how_much_app/features/profile/domain/usecase/profile_u.dart'
    as _i18;
import 'package:how_much_app/features/proposals/cubit/pricing_cubit.dart'
    as _i22;
import 'package:how_much_app/features/proposals/data/datasource/pricing_s.dart'
    as _i8;
import 'package:how_much_app/features/proposals/data/datasource/pricing_service.dart'
    as _i7;
import 'package:how_much_app/features/proposals/data/repository/pricing_impl.dart'
    as _i15;
import 'package:how_much_app/features/proposals/domain/repositories/pricing_r.dart'
    as _i14;
import 'package:how_much_app/features/proposals/domain/usecases/pricing_u.dart'
    as _i20;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.$AppRouter>(() => _i3.$AppRouter());
    gh.lazySingleton<_i4.Api>(() => _i4.Api());
    gh.factory<_i5.AuthServices>(
      () => _i6.AuthSource(api: gh<_i4.Api>()),
      instanceName: 'authsource',
    );
    gh.factory<_i7.PricingService>(
      () => _i8.PricingSource(api: gh<_i4.Api>()),
      instanceName: 'pricingsource',
    );
    gh.factory<_i9.ProfileService>(
      () => _i10.ProfileSource(api: gh<_i4.Api>()),
      instanceName: 'profilesource',
    );
    gh.factory<_i11.AuthRepository>(
      () => _i12.AuthImpl(gh<_i5.AuthServices>(instanceName: 'authsource')),
      instanceName: 'AuthRepository',
    );
    gh.factory<_i13.ForgotPasswordUseCase>(() => _i13.ForgotPasswordUseCase(
        gh<_i11.AuthRepository>(instanceName: 'AuthRepository')));
    gh.factory<_i13.LoginUserUseCase>(() => _i13.LoginUserUseCase(
        gh<_i11.AuthRepository>(instanceName: 'AuthRepository')));
    gh.factory<_i14.PricingRepository>(
      () => _i15.PricingImpl(
          gh<_i7.PricingService>(instanceName: 'pricingsource')),
      instanceName: 'PricingRepository',
    );
    gh.factory<_i16.ProfileRepository>(
      () => _i17.ProfileImpl(
          gh<_i9.ProfileService>(instanceName: 'profilesource')),
      instanceName: 'ProfileRepository',
    );
    gh.factory<_i13.RegisterUserUseCase>(() => _i13.RegisterUserUseCase(
        gh<_i11.AuthRepository>(instanceName: 'AuthRepository')));
    gh.factory<_i13.ResendCodeUseCase>(() => _i13.ResendCodeUseCase(
        gh<_i11.AuthRepository>(instanceName: 'AuthRepository')));
    gh.factory<_i13.ResetPasswordUseCase>(() => _i13.ResetPasswordUseCase(
        gh<_i11.AuthRepository>(instanceName: 'AuthRepository')));
    gh.factory<_i18.SetProfileUsecase>(() => _i18.SetProfileUsecase(
        gh<_i16.ProfileRepository>(instanceName: 'ProfileRepository')));
    gh.factory<_i13.UpdatePasswordUseCase>(() => _i13.UpdatePasswordUseCase(
        gh<_i11.AuthRepository>(instanceName: 'AuthRepository')));
    gh.factory<_i18.UploadImageUsecase>(() => _i18.UploadImageUsecase(
        gh<_i16.ProfileRepository>(instanceName: 'ProfileRepository')));
    gh.factory<_i13.VerifyEmailUseCase>(() => _i13.VerifyEmailUseCase(
        gh<_i11.AuthRepository>(instanceName: 'AuthRepository')));
    gh.factory<_i18.DeleteAccountUsecase>(() => _i18.DeleteAccountUsecase(
        gh<_i16.ProfileRepository>(instanceName: 'ProfileRepository')));
    gh.factory<_i19.ForgotPasswordCubit>(() => _i19.ForgotPasswordCubit(
          gh<_i13.ForgotPasswordUseCase>(),
          gh<_i13.ResetPasswordUseCase>(),
          gh<_i13.UpdatePasswordUseCase>(),
        ));
    gh.factory<_i20.GeneratePricingUsecase>(() => _i20.GeneratePricingUsecase(
        gh<_i14.PricingRepository>(instanceName: 'PricingRepository')));
    gh.factory<_i20.GetAllPricingUsecase>(() => _i20.GetAllPricingUsecase(
        gh<_i14.PricingRepository>(instanceName: 'PricingRepository')));
    gh.factory<_i18.GetProfileUsecase>(() => _i18.GetProfileUsecase(
        gh<_i16.ProfileRepository>(instanceName: 'ProfileRepository')));
    gh.factory<_i21.LoginCubit>(
        () => _i21.LoginCubit(gh<_i13.LoginUserUseCase>()));
    gh.factory<_i22.PricingCubit>(() => _i22.PricingCubit(
          generatePricingUsecase: gh<_i20.GeneratePricingUsecase>(),
          getAllPricingUsecase: gh<_i20.GetAllPricingUsecase>(),
        ));
    gh.factory<_i23.ProfileCubit>(() => _i23.ProfileCubit(
          gh<_i18.DeleteAccountUsecase>(),
          gh<_i18.UploadImageUsecase>(),
          gh<_i18.GetProfileUsecase>(),
          gh<_i18.SetProfileUsecase>(),
        ));
    gh.factory<_i24.RegisterCubit>(
        () => _i24.RegisterCubit(gh<_i13.RegisterUserUseCase>()));
    gh.factory<_i25.VerifcationCubit>(
        () => _i25.VerifcationCubit(gh<_i13.VerifyEmailUseCase>()));
    return this;
  }
}
