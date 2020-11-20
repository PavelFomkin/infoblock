package com.example.demo.dto.city;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class District {

    private String id;
    @JsonProperty("digital_platform_id")
    private String digitalPlatformId;
    private Integer code;
    private String name;
    private String district;
}
