<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
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
            rel="stylesheet"
    />
    <link rel="stylesheet" href="/admin/css/homeStyle.css" />
    <title>Trang chủ Admin</title>
</head>
<body>
<div class="container">
    <div class="welcome__admin">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-6">
                        <img style="width: 70%;" src="/images/dee42cf38b7f34216d6e.jpg">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <h1>Hello, Shop Bé Thơ</h1>
                        <p>
                            Xin chào, quản trị viên! Rất vui được gặp lại bạn. Trang quản
                            trị này là trung tâm điều hành website, nơi bạn có thể theo
                            dõi và quản lý mọi hoạt động. Chúc bạn một ngày làm việc năng
                            suất!
                        </p>

                        <div class="welcome__admin__btn">
                            <a href="/admin/product/dashboardProduct" class="welcome__admin__btn__product">
                                <button class="text_button">
                                    Quản lý sản phẩm
                                </button>
                            </a>
                            <a href="/admin/blog/dashboard" class="welcome__admin__btn__product">
                                <button class="text_button">
                                    Quản lý bài viết
                                </button>
                            </a>
                            <a href="/admin/banner/create" class="welcome__admin__btn__blog">
                            <button class="text_button">
                                Quản lý Banner trang chủ
                            </button>

                            </a>
                            <a href="admin/collection/create" class="welcome__admin__btn__blog">
                                <button class="text_button">
                                    Quản lý bộ sưu tập trang chủ
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 welcome__admin__banner">
                <img
                        style="width: 100%"
                        src="https://png.pngtree.com/png-vector/20230830/ourmid/pngtree-3d-character-modeling-digital-marketing-online-shop-admin-illustration-png-image_9190030.png"
                />
                <div class="welcome__admin__btn__exit">
                    <a href="/admin/login">
                        <button class="btn btn-danger">
                            Exit
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
