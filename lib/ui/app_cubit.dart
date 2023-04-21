import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/topic_local/topic_local.dart';
import 'package:mubaha/ui/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  void updateTopic(TopicLocal? topicLocal) {
    emit(state.copyWith(topicLocal: topicLocal));
  }

  void init() {
    //CacheManager.instance.init();
  }
}
