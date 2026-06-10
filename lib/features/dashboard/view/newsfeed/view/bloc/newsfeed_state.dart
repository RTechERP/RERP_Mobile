part of 'newsfeed_bloc.dart';

@CopyWith()
class NewsfeedState extends BaseBlocState {
  final List<NewsletterItem> newsfeeds;

  const NewsfeedState({
    required super.status,
    super.message,
    this.newsfeeds = const [],
  });

  factory NewsfeedState.init() => const NewsfeedState(
        status: BaseStateStatus.init,
        newsfeeds: [],
      );

  @override
  List get props => [status, message, newsfeeds];
}
