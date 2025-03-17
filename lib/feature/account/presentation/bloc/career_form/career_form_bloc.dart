import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/entity/career/career_content/career_content_value.dart';
import 'package:withu/feature/account/domain/entity/career/career_entity/career_entity.dart';
import 'package:withu/feature/account/domain/entity/career/career_value/career_date_value.dart';
import 'package:withu/feature/account/domain/entity/name/name_value.dart';
import 'package:withu/feature/common/domain/entity/company_name/company_name_value.dart';

part 'career_form_event.dart';

part 'career_form_state.dart';

part 'career_form_bloc.freezed.dart';

part 'career_form_bloc_handler.dart';

typedef CareerFormBlocProvider = BlocProvider<CareerFormBloc>;

typedef CareerFormBlocBuilder = BlocBuilder<CareerFormBloc, CareerFormState>;

typedef CareerFormBlocConsumer = BlocConsumer<CareerFormBloc, CareerFormState>;

typedef CareerFormBlocListener = BlocListener<CareerFormBloc, CareerFormState>;

class CareerFormBloc extends Bloc<CareerFormEvent, CareerFormState> {
  CareerFormBloc() : super(CareerFormState(status: BaseBlocStatus.initial())) {
    on<CareerFormInitialized>(_onCareerFormInitialized);
    on<CareerFormNameInputted>(_onCareerFormNameInputted);
    on<CareerFormContentInputted>(_onCareerFormContentInputted);
    on<CareerFormCompanyInputted>(_onCareerFormCompanyInputted);
    on<CareerFormStartDateChanged>(_onCareerFormStartDateChanged);
    on<CareerFormEndDateChanged>(_onCareerFormEndDateChanged);
    on<CareerFormUpdated>(_onCareerFormUpdated);
    on<CareerFormDeleted>(_onCareerFormDeleted);
  }
}
