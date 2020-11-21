package com.example.demo.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RequestDTO {

    @JsonProperty("student")
    StudentDTO studentDTO;
    String competency;
    String providerAddress;
    String regOperator;
    String studyGroup;
    Boolean isDistanceLearning;
}
