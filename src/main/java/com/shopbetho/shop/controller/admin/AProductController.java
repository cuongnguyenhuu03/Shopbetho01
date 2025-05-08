package com.shopbetho.shop.controller.admin;

import com.shopbetho.shop.contant.TypeCatalogueDetailEnum;
import com.shopbetho.shop.contant.catalogueEnum;
import com.shopbetho.shop.entity.AccountAdmin;
import com.shopbetho.shop.entity.Color;
import com.shopbetho.shop.entity.Product;
import com.shopbetho.shop.service.CloudinaryService;
import com.shopbetho.shop.service.EmailService;
import com.shopbetho.shop.service.ProductService;
import com.shopbetho.shop.service.UploadService;

import jakarta.servlet.http.HttpSession;
import org.hibernate.engine.jdbc.Size;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.catalog.Catalog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class AProductController {

    @Autowired
    private UploadService uploadService;

    @Autowired
    private CloudinaryService cloudinaryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private EmailService emailService;

    @GetMapping("/admin/product")
    public String getDashboardPage(HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        return "admin/product/showPage";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        return "admin/product/createPage";
    }

    @GetMapping("/admin/product/dashboardProduct")
    public String getCreatePage(Model model, @RequestParam(defaultValue = "1", name = "page") int page,
            HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }

        Pageable pageable = PageRequest.of(page - 1, 2);

        List<Product> products = this.productService.fetchAll();
        List<Product> productHighLights = this.productService.findAllIsHighLightTrue();

        model.addAttribute("products", products);
        model.addAttribute("productHighLights", productHighLights);
        return "admin/dashboard/dashboardProduct";
    }

    @GetMapping("/admin/product/filterDashboardProduct")
    public String filterDashboardProduct(Model model, @RequestParam(name = "name") String name, HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }

        List<Product> products = this.productService.searchByName(name);
        List<Product> productHighLights = this.productService.findAllIsHighLightTrue();

        model.addAttribute("products", products);
        model.addAttribute("productHighLights", productHighLights);
        return "admin/dashboard/dashboardProduct";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdatePage(
            @PathVariable("id") Long id,
            Model model, HttpSession session) {
        AccountAdmin admin = (AccountAdmin) session.getAttribute("loggedInAdmin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        model.addAttribute("product", productService.fetchById(id));
        return "admin/product/updatePage";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(
            @RequestParam("name") String name,
            @RequestParam("code") String code,
            @RequestParam("description") String description,
            @RequestParam("catalogue") String catalogue,
            @RequestParam("typeCatalogueDetail") String catalogueDetailEnum,
            @RequestParam(defaultValue = "false", name = "isHighlight") boolean isHighlight,
            @RequestParam(defaultValue = "false", name = "isNew") boolean isNew,
            @RequestParam(defaultValue = "true", name = "isActive") boolean isActive,
            @RequestParam("price") double price,
            @RequestParam("sizes") List<String> sizes,
            @RequestParam("numberColor") int numberColor,
            @RequestParam("avatarColors") List<MultipartFile> avatarColors,
            @RequestParam("colorNames") List<String> colorNames,
            @RequestParam Map<String, MultipartFile> fileMap,
            Model model) throws IOException {
        if (name.isEmpty() || code.isEmpty() || description.isEmpty() || catalogue.isEmpty() || sizes.isEmpty()
                || numberColor <= 0) {
            model.addAttribute("error", "Please fill in all required fields.");
            return "admin/product/createPage";
        }
        if (avatarColors.size() != numberColor || colorNames.size() != numberColor) {
            model.addAttribute("error", "Number of colors and their details do not match.");
            return "admin/product/createPage";
        }
        if (price <= 0) {
            model.addAttribute("error", "Price must be greater than 0.");
            return "admin/product/createPage";
        }
        System.out.println(catalogueDetailEnum);
        Product product = new Product();
        product.setName(name);
        product.setCode(code);
        product.setDescription(description.trim());
        product.setCatalogue(catalogueEnum.valueOf(catalogue));
        product.setCatalogueDetailEnum(TypeCatalogueDetailEnum.valueOf(catalogueDetailEnum));
        product.setHighlight(isHighlight);
        product.setNew(isNew);
        product.setActive(isActive);
        product.setPrice(price);
        product.setSizes(sizes);
        List<Color> colorEntities = new ArrayList<>();
        for (int i = 0; i < numberColor; i++) {
            Color color = new Color();
            color.setName(colorNames.get(i));
            String urlAvt = uploadService.store(avatarColors.get(i), "file");
            color.setAvtColor(urlAvt);
            color.setProduct(product);

            List<String> imageUrls = new ArrayList<>();
            for (int j = 0; j < 4; j++) {
                String key = "colorImages[" + i + "][" + j + "]";
                MultipartFile image = fileMap.get(key);

                if (image != null && !image.isEmpty()) {
                    imageUrls.add(uploadService.store(image, "file"));
                }
            }
            color.setImageUrl(imageUrls);
            colorEntities.add(color);
        }
        product.setColors(colorEntities);

        productService.createProduct(product);
        return "redirect:/admin/product/dashboardProduct";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(
            @RequestParam("id") Long id,
            @RequestParam("name") String name,
            @RequestParam("code") String code,
            @RequestParam("description") String description,
            @RequestParam("catalogue") String catalogue,
            @RequestParam("typeCatalogueDetail") String catalogueDetailEnum,
            @RequestParam(defaultValue = "true", name = "isHighlight") boolean isHighlight,
            @RequestParam(defaultValue = "true", name = "isNew") boolean isNew,
            @RequestParam(defaultValue = "true", name = "isActive") boolean isActive,
            @RequestParam("price") double price,
            @RequestParam("sizes") List<String> sizes,
            @RequestParam("numberColor") int numberColor,
            @RequestParam("avatarColors") List<MultipartFile> avatarColors,
            @RequestParam("colorNames") List<String> colorNames,
            @RequestParam("colorIds") List<Long> colorIds,
            @RequestParam Map<String, MultipartFile> fileMap,
            Model model) throws IOException {
        if (id == null || name.isEmpty() || code.isEmpty() || description.isEmpty() || catalogue.isEmpty()
                || sizes.isEmpty() || numberColor <= 0) {
            model.addAttribute("error", "Please fill in all required fields.");
            return "redirect:/admin/product/updatePage";
        }
        if (avatarColors.size() != numberColor || colorNames.size() != numberColor || colorIds.size() != numberColor) {
            model.addAttribute("error", "Number of colors and their details do not match.");
            return "redirect:/admin/product/updatePage";
        }
        if (price <= 0) {
            model.addAttribute("error", "Price must be greater than 0.");
            return "redirect:/admin/product/updatePage";
        }

        Product product = productService.fetchById(id);
        product.setId(id);
        product.setName(name);
        product.setCode(code);
        product.setDescription(description.trim());
        product.setCatalogue(catalogueEnum.valueOf(catalogue));
        product.setCatalogueDetailEnum(TypeCatalogueDetailEnum.valueOf(catalogueDetailEnum));
        product.setHighlight(isHighlight);
        product.setNew(isNew);
        product.setActive(isActive);
        product.setPrice(price);
        product.setSizes(sizes);

        List<Color> existingColors = product.getColors();
        List<Color> updatedColors = new ArrayList<>();

        // XÓA những Color cũ không còn tồn tại trong danh sách colorIds gửi từ form
        List<Long> colorIdsToKeep = colorIds.stream().filter(idVal -> idVal != null && idVal > 0).toList();
        existingColors.removeIf(color -> {
            boolean toRemove = !colorIdsToKeep.contains(color.getId());
            if (toRemove) {
                color.setProduct(null); // nếu bạn dùng orphanRemoval = true
            }
            return toRemove;
        });

        for (int i = 0; i < numberColor; i++) {
            Long colorId = colorIds.get(i);
            String colorName = colorNames.get(i);
            MultipartFile avatar = avatarColors.get(i);

            Color color;
            if (colorId != null && colorId > 0) {
                // Cập nhật Color cũ
                color = existingColors.stream()
                        .filter(c -> c.getId().equals(colorId))
                        .findFirst()
                        .orElse(new Color());
            } else {
                // Thêm Color mới
                color = new Color();
                color.setImageUrl(new ArrayList<>());
            }

            color.setName(colorName);
            if (avatar != null && !avatar.isEmpty()) {
                String urlAvt = uploadService.store(avatar, "file");
                if (urlAvt != null && !urlAvt.isEmpty()) {
                    color.setAvtColor(urlAvt);
                }
            }

            List<String> imageUrls = color.getImageUrl();
            if (imageUrls == null || imageUrls.size() == 0) {
                imageUrls = new ArrayList<>();
            }
            for (int j = 0; j < 4; j++) {
                String key = "colorImages[" + i + "][" + j + "]";
                MultipartFile image = fileMap.get(key);

                if (image != null && !image.isEmpty()) {
                    String imageUrl = uploadService.store(image, "file");
                    if (imageUrl != null && !imageUrl.isEmpty()) {
                        if (imageUrls.size() <= j) {
                            imageUrls.add(imageUrl);
                        } else {
                            imageUrls.set(j, imageUrl);
                        }
                    }
                }
            }
            color.setImageUrl(imageUrls);
            color.setProduct(product);

            updatedColors.add(color);
        }

        product.setColors(updatedColors);
        productService.updateProduct(product);
        return "redirect:/admin/product/dashboardProduct";
    }

    @PostMapping("/admin/product/order")
    public String orderProduct(
            @RequestParam("productId") Long productId,
            @RequestParam("productName") String productName,
            @RequestParam("total") int total,
            @RequestParam("price") double price,
            @RequestParam("color") String color,
            @RequestParam("size") String size,
            @RequestParam("nameCustomer") String nameCustomer,
            @RequestParam("sdt") String sdt,
            @RequestParam("address") String address,
            @RequestParam("emailAdmin") String emailAdmin,
            Model model) {
        // Validate input data
        if (productId == null || productName.isEmpty() || total <= 0 || price <= 0 || color.isEmpty() || size.isEmpty()
                || nameCustomer.isEmpty() || sdt.isEmpty() || address.isEmpty() || emailAdmin.isEmpty()) {
            model.addAttribute("error", "Please fill in all required fields.");
            return "redirect:/";
        }
        String messageSendEmail = "Product ID: " + productId + "\n" +
                "Product Name: " + productName + "\n" +
                "Total: " + total + "\n" +
                "Color: " + color + "\n" +
                "Size: " + size + "\n" +
                "Customer Name: " + nameCustomer + "\n" +
                "Phone Number: " + sdt + "\n" +
                "Address: " + address;
        // Send email to admin
        System.out.println("EmailAdmin " + emailAdmin);
        emailService.sendOrder(emailAdmin, messageSendEmail);
        model.addAttribute("success", "Order placed successfully. We will contact you soon.");
        // Redirect to a success page or show a success message
        return "redirect:/";
    }

    @PostMapping("/admin/product/delete")
    public String deleteProductByPost(@RequestParam("id") Long id, Model model) {
        try {
            productService.deleteProductById(id);
            return "redirect:/admin/product/dashboardProduct";
        } catch (RuntimeException e) {
            model.addAttribute("Err", "Product not found");
            return "redirect:/admin/product/dashboardProduct";
        }
    }

    @GetMapping("/admin/product/countProductHighLight")
    @ResponseBody
    public Long countProductHighLight() {
        return productService.countProductHighLight();
    }

    @GetMapping("/admin/product/countProductHighLightAndIdNot")
    @ResponseBody
    public Long countProductHighLightAndIdNot(@RequestParam("id") Long id) {
        return productService.countByIsHighlightTrueAndIdNot(id);
    }
}
