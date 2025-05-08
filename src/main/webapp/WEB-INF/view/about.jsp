<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.shopbetho.shop.entity.FormatUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link
            rel="stylesheet"
            href="/bootstrap/css/bootstrap.css"
    />
    <link
            rel="stylesheet"
            href="/bootstrap/css/bootstrap.min.css"
    />
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"/>
    <script src="https://unpkg.com/scrollreveal"></script>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="style/about.css" />
    <title>About</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<main class="about__main p-4">
    <div class="container" style="margin-top: 150px">
        <div class="row about__main__mota d-flex align-items-center">
            <div class="col-md-6">
                <img style="width: 100%; height: 500px; object-fit: cover" src="/images/dee42cf38b7f34216d6e.jpg" />
            </div>

            <div class="col-md-6">
                <p>
                    <span class="fw-bold"> SHOP BÉ THƠ </span>khởi nghiệp từ năm 2012, với mong muốn đem đến những
                    sản phẩm thời trang mềm mại, dễ thương cho bé. Tại Bé Thơ, ba mẹ
                    có thể lựa chọn đồ cho cả bé nhỏ sơ sinh đến bé lớn từ 1-15 tuổi,
                    với đủ chủng loại như quần áo sơ sinh Nous, váy đầm, set đồ bộ đi
                    chơi, đồ bơi cho bé… Ba mẹ có thể mua hàng online và offline tại
                    cửa hàng
                </p>
            </div>
        </div>

        <div class="row about__main__action"  style="margin-top: 20px;">
            <div class="col-md-4">
                <h1>Hotline</h1>
                <p class="fw-bold">
                    0916 991 839
                <hr class="fw-bold">
                </p>
            </div>
            <div class="col-md-4">
                <h1>Địa chỉ</h1>
                <p>62/15 Lý Chính Thắng, phường Võ Thị Sáu, quận 3, TPHCM</p>
            </div>
            <div class="col-md-4">
                <h1>Zalo</h1>
                <p>0916 991 839</p>
            </div>
        </div>

        <div class="row d-flex justify-content-center">
            <button style="width: 100px; padding: 10px; border-radius: 10px" class="about__main__action__btn">Liên hệ</button>
        </div>
    </div>
</main>
</body>
</html>
