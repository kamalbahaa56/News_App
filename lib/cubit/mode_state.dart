part of 'mode_cubit.dart';

@immutable
sealed class ModeState {}

final class ModeInitial extends ModeState {}
class ChangeModeAppState extends ModeState {}
