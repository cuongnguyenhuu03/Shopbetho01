package com.shopbetho.shop.contant;

public enum TypeCatalogueDetailEnum {
    QUANAO("QUANAO"),
    KHAN("KHAN"),
    BAOTAY("BAOTAY"),
    CHANMU("CHANMU"),
    BETRAI("BETRAI"),
    BEGAI("BEGAI"),
    DAU("DAU"),
    KEPCAI("KEPCAI");
    private String value;
    TypeCatalogueDetailEnum(String value) {
        this.value = value;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
