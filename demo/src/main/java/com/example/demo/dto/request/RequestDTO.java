package com.example.demo.dto.request;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RequestDTO {

    @Valid
    @JsonProperty("student")
    StudentDTO studentDTO;
    @NotNull
    String competency;
    String providerAddress;
    String regOperator;
    String studyGroup;
    Boolean isDistanceLearning;
}
