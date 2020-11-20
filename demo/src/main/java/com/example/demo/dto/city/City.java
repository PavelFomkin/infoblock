package com.example.demo.dto.city;

import lombok.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class City {

    private String id;
    private District region;
    private String name;
    private CityType type;
}