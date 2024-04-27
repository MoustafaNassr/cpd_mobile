part of 'get_skills_cubit.dart';

@immutable
abstract class SkillsFetchState extends Equatable {}

class SkillsFetchInitial extends SkillsFetchState {
   @override
  List<Object> get props => [];

}

class SkillsFetchLoading extends SkillsFetchState {
   @override
  List<Object> get props => [];

}

class SkillsFetchSuccess extends SkillsFetchState {
  final List<SkillsModel> skills;
   SkillsFetchSuccess( this.skills);
  @override
  List<Object> get props => [skills];
}

class SkillsFetchFail extends SkillsFetchState {
 @override
  List<Object> get props => [];
}
