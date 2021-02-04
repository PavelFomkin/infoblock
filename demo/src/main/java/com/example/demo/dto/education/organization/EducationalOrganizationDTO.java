package com.example.demo.dto.education.organization;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EducationalOrganizationDTO {

    private String id;
    private String providerId;
    private String name;
    private String address;
    private String email;
    private String phoneNumber;
    @JsonProperty("distance_learning")
    private Boolean distanceLearning;
}
