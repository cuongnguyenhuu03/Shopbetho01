package com.shopbetho.shop.entity;

import java.util.List;

import com.shopbetho.shop.contant.TypeCatalogueDetailEnum;
import com.shopbetho.shop.contant.catalogueEnum;

import jakarta.persistence.*;

@Entity
public class Product extends BaseEntity {

    @Column(columnDefinition = "LONGTEXT")
    private String name;
    @Column(unique = true)
    private String code;
    @Column(columnDefinition = "LONGTEXT")
    private String description;
    @Enumerated(EnumType.STRING)
    private TypeCatalogueDetailEnum catalogueDetailEnum;
    @Enumerated(EnumType.STRING)
    private catalogueEnum catalogue;
    private boolean isHighlight;
    private boolean isNew;
    private boolean isActive;

    public TypeCatalogueDetailEnum getCatalogueDetailEnum() {
        return catalogueDetailEnum;
    }

    public void setCatalogueDetailEnum(TypeCatalogueDetailEnum catalogueDetailEnum) {
        this.catalogueDetailEnum = catalogueDetailEnum;
    }

    private double price;

    @ElementCollection
    @CollectionTable(name = "product_size", joinColumns = @JoinColumn(name = "product_id"))
    @Column(name = "size")
    private List<String> sizes;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Color> colors;

    public Product(String name, String code, String description, catalogueEnum catalogue, boolean isHighlight, boolean isNew, boolean isActive, double price) {
        this.name = name;
        this.code = code;
        this.description = description;
        this.catalogue = catalogue;
        this.isHighlight = isHighlight;
        this.isNew = isNew;
        this.isActive = isActive;
        this.price = price;
    }

    public Product() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public catalogueEnum getCatalogue() {
        return catalogue;
    }

    public void setCatalogue(catalogueEnum catalogue) {
        this.catalogue = catalogue;
    }

    public boolean isHighlight() {
        return isHighlight;
    }

    public void setHighlight(boolean highlight) {
        isHighlight = highlight;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean aNew) {
        isNew = aNew;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<String> getSizes() {
        return sizes;
    }

    public void setSizes(List<String> sizes) {
        this.sizes = sizes;
    }

    public List<Color> getColors() {
        return colors;
    }

    public void setColors(List<Color> colors) {
        this.colors = colors;
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", description='" + description + '\'' +
                ", catalogue=" + catalogue +
                ", isHighlight=" + isHighlight +
                ", isNew=" + isNew +
                ", isActive=" + isActive +
                ", price=" + price +
//                ", sizes=" + sizes +
//                ", colors=" + colors +
                '}';
    }
}
