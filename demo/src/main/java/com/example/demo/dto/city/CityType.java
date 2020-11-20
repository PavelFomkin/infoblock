package com.example.demo.dto.city;

import java.util.Optional;
import java.util.stream.Stream;

import com.fasterxml.jackson.annotation.JsonCreator;

public enum CityType {
    CITY,
    LOCALITY;

    @JsonCreator
    public static CityType getByName(String name) {
        final Optional<CityType> first = Stream.of(values()).filter(type -> type.name().equalsIgnoreCase(name)).findFirst();
        if (first.isPresent()) {
            return first.get();
        }
        throw new IllegalArgumentException(String.format("There is no City Type with name = '%s'", name));
    }
}
