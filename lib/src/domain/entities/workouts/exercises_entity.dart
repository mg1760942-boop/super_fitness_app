class ExerciseEntity{
  final String? id;
  final String? exercise;
  final String? shortYoutubeDemonstration;
  final String? difficultyLevel;
  final String? targetMuscleGroup;
  final String? primeMoverMuscle;
  final String? primaryEquipment;
  final int? primaryItems;
  final int? secondaryItems;
  final String? shortYoutubeDemonstrationLink;
  final String? inDepthYoutubeExplanationLink;

  ExerciseEntity({
    this.id,
    this.exercise,
    this.shortYoutubeDemonstration,
    this.difficultyLevel,
    this.targetMuscleGroup,
    this.primeMoverMuscle,
    this.primaryEquipment,
    this.primaryItems,
    this.secondaryItems,
    this.shortYoutubeDemonstrationLink,
    this.inDepthYoutubeExplanationLink,
  });
}