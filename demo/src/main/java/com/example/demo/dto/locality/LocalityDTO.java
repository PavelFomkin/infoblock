package com.example.demo.dto.locality;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LocalityDTO {

    private String id;
    private String name;
    @JsonProperty("is_user_location")
    private Boolean isUserLocation;
}
