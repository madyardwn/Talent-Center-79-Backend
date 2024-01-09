package com.tujuhsembilan.app.model.converters;

import com.tujuhsembilan.app.model.enums.Gender;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import java.util.Arrays;
import java.util.Objects;

@Converter
public class GenderConverter implements AttributeConverter<Gender, Character> {
    @Override
    public Character convertToDatabaseColumn(Gender gender) {
        return gender.getValue();
    }

    @Override
    public Gender convertToEntityAttribute(Character gender) {
        return Arrays
                .stream(Gender.values())
                .filter(s -> Objects.equals(s.getValue(), gender))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
