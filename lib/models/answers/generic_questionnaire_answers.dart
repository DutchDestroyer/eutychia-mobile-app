import 'package:Eutychia/models/answers/base_questionnaire_answer.dart';
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';

import 'generic_questionnaire_answer.dart';

class GenericQuestionnaireAnswers extends BaseQuestionnaireAnswer {
  final List<GenericQuestionnaireAnswer> answers;

  GenericQuestionnaireAnswers(this.answers, QuestionnaireType questionnaireType)
      : super(questionnaireType);
}
