import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('''
{
"Provider" : ${provider.name ?? provider.runtimeType} is initialized,
"Value Exposed" : "$value
}

''');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    print('''
{
"Provider" : ${provider.name ?? provider.runtimeType} disposed,
}

''');
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
"Provider" : ${provider.name ?? provider.runtimeType} is updated,
"Previous Value" : "$previousValue
"Next Value" : "$newValue
}

''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
