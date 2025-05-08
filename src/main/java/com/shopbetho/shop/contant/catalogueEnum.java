package com.shopbetho.shop.contant;

public enum catalogueEnum {
    DOSOSINH("DOSOSINH"),
    SETDO("SETDO"),
    DOBOI("DOBOI"),
    AOQUAN("AOQUAN"),
    PHUKIEN("PHUKIEN");
    private String value;
    catalogueEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
