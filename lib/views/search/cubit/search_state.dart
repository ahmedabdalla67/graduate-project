part of 'search_cubit.dart';

abstract class SearchStates {}

final class SearchInitialState extends SearchStates {}

final class SearchLoadingState extends SearchStates {}

final class SearchSuccessState extends SearchStates {}

final class SearchFailureState extends SearchStates {}
