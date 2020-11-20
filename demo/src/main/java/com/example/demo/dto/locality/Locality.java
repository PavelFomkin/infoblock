package com.example.demo.dto.locality;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Locality {

    private String id;
    private String name;
    @JsonProperty("is_user_location")
    private Boolean isUserLocation;
}
