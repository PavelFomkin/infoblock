package com.example.demo.dto.education.organization;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class EducationalOrganization {

    private String id;
    private String name;
    private String email;
    private String city;
    private String region;
    private List<String> programs; // TODO: check it, not sure what should be here
    @JsonProperty("distance_learning")
    private Boolean distanceLearning;
    @JsonProperty("is_full")
    private Boolean isFull;
}
