package com.example.demo.dto.education.competence;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EducationCompetenceDTO {

    private String id;
    private String image;
    private String name;
    private EducationCompetenceCategoryDTO category;
    private String description;
    @JsonProperty("is_available")
    private Boolean isAvailable;
    @JsonProperty("is_custom")
    private Boolean isCustom;
    @JsonProperty("is_selected")
    private Boolean isSelected;
    @JsonProperty("quiz_available")
    private Boolean quizAvailable;
    @JsonProperty("quiz_status")
    private String quizStatus;
    @JsonProperty("quiz_points")
    private Integer quizPoints;
    @JsonProperty("quiz_number_of_questions")
    private Integer quizNumberOfQuestions;
    @JsonProperty("distance_learning")
    private Boolean distanceLearning;
}
