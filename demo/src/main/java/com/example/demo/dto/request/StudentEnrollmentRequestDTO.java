package com.example.demo.dto.request;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StudentEnrollmentRequestDTO {

    String id;
    @Valid
    StudentDTO student;
    @NotNull
    private String competency;
    private String provider;
    @JsonProperty("reg_operator")
    private String regOperator;
    private String studyGroup;
    @NotNull
    @JsonProperty("distance_learning")
    private Boolean distanceLearning;
}
