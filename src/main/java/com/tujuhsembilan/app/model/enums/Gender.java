package com.tujuhsembilan.app.model.enums;

public enum Gender {
    MALE('L'),
    FEMALE('P');

    private final Character value;

    Gender(Character value) {
        this.value = value;
    }

    public Character getValue() {
        return value;
    }
}