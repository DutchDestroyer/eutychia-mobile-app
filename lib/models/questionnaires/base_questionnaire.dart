abstract class BaseQuestionnaire {
  final String title;
  final String description;
  final bool displayAnswers;
  final String finalRemark;

  BaseQuestionnaire(
      this.title, this.description, this.displayAnswers, this.finalRemark);
}
