part of 'get_data_bloc.dart';

sealed class GetDataEvent extends Equatable {
  const GetDataEvent();

  @override
  List<Object> get props => [];
}

class ClickhelloEvent extends GetDataEvent {}

class TowEvent extends GetDataEvent {}
