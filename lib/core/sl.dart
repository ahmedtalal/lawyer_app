import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hokok/chat/domain/use_cases/subscribe_to_plan.dart';

import '../chat/data/data_source/chat_remote_datasource.dart';
import '../chat/data/repository/chats_repository.dart';
import '../chat/domain/repository/base_chat_repo.dart';
import '../chat/domain/use_cases/get_all_chats_usecase.dart';
import '../chat/domain/use_cases/get_all_messages.dart';
import '../chat/domain/use_cases/send_message_usecase.dart';
import 'app_interceptor.dart';
import 'dio_consumer.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async{
    sl.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
    sl.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      error: true,
      responseHeader: true,
    ));
    sl.registerLazySingleton<Dio>(() => Dio());
    sl.registerLazySingleton<DioConsumer>(() => DioConsumer(sl<Dio>()));

    // authSL();
    // generalProfile();


    sl.registerLazySingleton<ChatsRemoteDataSource>(
            () => ChatsRemoteDataSourceImpl(sl<DioConsumer>()));
    sl.registerLazySingleton<BaseChatsRepository>(
            () => ChatsRepositoryImpl(sl<ChatsRemoteDataSource>()));

    if (!GetIt.I.isRegistered<GetAllChatsUseCase>()) {
      sl.registerFactory(() => GetAllChatsUseCase(sl<BaseChatsRepository>()));
    }

    if (!GetIt.I.isRegistered<GetAllMessagesUseCase>()) {
      sl.registerFactory(() => GetAllMessagesUseCase(sl<BaseChatsRepository>()));
    }

    if (!GetIt.I.isRegistered<SendMessageUseCase>()) {
      sl.registerFactory(() => SendMessageUseCase(sl<BaseChatsRepository>()));
    }
    if (!GetIt.I.isRegistered<SubscribeToPlanUseCase>()) {
      sl.registerFactory(() => SubscribeToPlanUseCase(sl<BaseChatsRepository>()));
    }
  }

}
