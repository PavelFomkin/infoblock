package com.example.demo.dto.city;

import lombok.*;

@Data
@NoArgsConstructor
public class CityDTO {

    private String id;
    private DistrictDTO region;
    private String name;
    private CityTypeDTO type;
}