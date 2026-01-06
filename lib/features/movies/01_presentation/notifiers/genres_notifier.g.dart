// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GenresNotifier)
final genresProvider = GenresNotifierProvider._();

final class GenresNotifierProvider
    extends $NotifierProvider<GenresNotifier, AbstractState<List<Genre>>> {
  GenresNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'genresProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$genresNotifierHash();

  @$internal
  @override
  GenresNotifier create() => GenresNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AbstractState<List<Genre>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AbstractState<List<Genre>>>(value),
    );
  }
}

String _$genresNotifierHash() => r'6f31bfdd8c4241851f2b204df2f9b228f9a49bb6';

abstract class _$GenresNotifier extends $Notifier<AbstractState<List<Genre>>> {
  AbstractState<List<Genre>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AbstractState<List<Genre>>, AbstractState<List<Genre>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AbstractState<List<Genre>>,
                AbstractState<List<Genre>>
              >,
              AbstractState<List<Genre>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
