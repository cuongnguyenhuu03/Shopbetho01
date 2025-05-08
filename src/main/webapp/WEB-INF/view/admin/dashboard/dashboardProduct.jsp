<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    <link rel="stylesheet" href="/admin/css/dashboardProduct.css" />
    <title>Quản lý sản phẩm</title>

</head>
<body>
<jsp:include page="../../header.jsp"/>
<header class="headerProduct">
    <div class="container">
        <div class="header__1">
            <h1>Quản lý sản phẩm</h1>

                <button class="header__1__btn">
                    <a class="text__btn__header_1" href="/admin/product/create">Thêm sản phẩm mới</a>
                </button>

        </div>
        <hr />
        <form class="w-100" action="/admin/product/filterDashboardProduct">
        <div class="header__2">
            <input
                    type="text"
                    class="form-control p-3"
                    name="name"
                    placeholder="Nhập sản phẩm bạn muốn tìm"
            />
            <button type="submit" class="header__2__btn">Tìm kiếm</button>
        </form>
        </div>
    </div>
</header>

<main class="main">
    <div class="container main__product__total">
        <div class="row main__navbar">
            <div class="col-sm-1 fw-bold">STT</div>
            <div class="col-sm-2 fw-bold">Tên sản phẩm</div>
            <div class="col-sm-1 fw-bold">Giá sản phẩm</div>
            <div class="col-sm-3 fw-bold">Mô tả sản phẩm</div>
            <div class="col-sm-2 fw-bold">Thời gian tạo</div>
            <div class="col-sm-1 fw-bold">Mã sản phẩm</div>
            <div class="col-sm-2 fw-bold">Hành động</div>
        </div>
        <hr />

        <c:choose>
            <c:when test="${products != null}">
                <c:forEach var="product" items="${products}" varStatus="loop">
                    <div class="row">
                        <div class="col-sm-1">
                            <span class="main__navbar__product">STT</span>
                            ${loop.index}
                        </div>
                        <div class="col-sm-2">
                            <span class="main__navbar__product">Tên sản phẩm</span>
                            <p class="card-title" style="
                                display: -webkit-box;
                                -webkit-line-clamp: 3;
                                -webkit-box-orient: vertical;
                                overflow: hidden;">
                                ${product.name}
                            </p>
                        </div>
                        <div class="col-sm-1">
                            <span class="main__navbar__product">Giá sản phẩm</span>
                             ${product.price} vnđ
                        </div>
                        <div class="col-sm-3">
                                    <span class="main__navbar__product">Mô tả sản phẩm</span>
                                  <p class="card-title" style="
                                        display: -webkit-box;
                                        -webkit-line-clamp: 3;
                                        -webkit-box-orient: vertical;
                                         overflow: hidden;">
                                            ${product.description}
                                  </p>

                        </div>
                        <div class="col-sm-2">
                            <span class="main__navbar__product">Thời gian tạo</span>
                             ${product.getCreatedAt().toString().split("T")[1].substring(0,5)} ${product.getCreatedAt().toString().split("T")[0]}
                        </div>
                        <div class="col-sm-1">
                            <span class="main__navbar__product">Mã sản phẩm</span>
                             ${product.id}
                        </div>
                        <div class="col-sm-2">
                            <a href="/admin/product/update/${product.id}" style="display: inline-block">
                                <button class="btn btn-warning">Sửa</button>
                            </a>
                            <form action="/admin/product/delete?id=${product.id}" style="display: inline-block" method="post">
                                <button class="btn btn-danger m-3">Xóa</button>
                            </form>
                        </div>
                    </div>
                    <hr />
                </c:forEach>
            </c:when>
            <c:otherwise>
                <span>Không có sản phẩm nổi bật nào</span>
            </c:otherwise>
        </c:choose>

    </div>

    <div class="container main__outstanding">
        <h1 class="fw-bold m-5">Quản lý sản phẩm nổi bật</h1>

        <div class="row main__navbar">
            <div class="col-sm-1 fw-bold">STT</div>
            <div class="col-sm-2 fw-bold">Tên sản phẩm</div>
            <div class="col-sm-1 fw-bold">Giá sản phẩm</div>
            <div class="col-sm-3 fw-bold">Mô tả sản phẩm</div>
            <div class="col-sm-2 fw-bold">Thời gian tạo</div>
            <div class="col-sm-1 fw-bold">Mã sản phẩm</div>
            <div class="col-sm-2 fw-bold">Hành động</div>
        </div>
        <hr />
        <c:choose>
            <c:when test="${productHighLights != null && productHighLights.size() > 0}">
                <c:forEach var="prodHighLightItem" items="${productHighLights}" varStatus="loop">
                    <div class="row">

                        <div class="col-sm-1">
                             <span class="main__navbar__product">STT</span>
                            ${loop.index}
                        </div>
                        <div class="col-sm-2">
                           <span class="main__navbar__product">Tên sản phẩm</span>
                        <p class="card-title" style="
                                                                          display: -webkit-box;
                                                                          -webkit-line-clamp: 3;
                                                                          -webkit-box-orient: vertical;
                                                                          overflow: hidden;">
                                                                          ${prodHighLightItem.name}
                                                                          </p>

                        </div>

                        <div class="col-sm-1">
                        <span class="main__navbar__product">Giá sản phẩm</span>
                            ${prodHighLightItem.price} vnđ
                        </div>
                        <div class="col-sm-3">
                            <span class="main__navbar__product">Mô tả sản phẩm</span>
                            <p class="card-title" style="
                                                                              display: -webkit-box;
                                                                              -webkit-line-clamp: 3;
                                                                              -webkit-box-orient: vertical;
                                                                              overflow: hidden;">
                                                                             ${prodHighLightItem.description}
                                                                              </p>

                        </div>
                        <div class="col-sm-2">
                        <span class="main__navbar__product">Thời gian tạo</span>
                        ${prodHighLightItem.getCreatedAt().toString().split("T")[1].substring(0,5)} ${prodHighLightItem.getCreatedAt().toString().split("T")[0]}
                        </div>
                        <div class="col-sm-1">
                             <span class="main__navbar__product">Mã sản phẩm</span>
                            ${prodHighLightItem.id}
                        </div>
                        <div class="col-sm-2">
                            <a href="/admin/product/update/${prodHighLightItem.id}" style="display: inline-block">
                                <button class="btn btn-warning">Sửa</button>
                            </a>
                            <form action="/admin/product/delete?id=${prodHighLightItem.id}" style="display: inline-block" method="post">
                                <button class="btn btn-danger m-3">Xóa</button>
                            </form>
                        </div>
                    </div>

                    <hr />
                </c:forEach>
            </c:when>
            <c:otherwise>
                <span>Không có sản phẩm nổi bật</span>
            </c:otherwise>
        </c:choose>
    </div>
</main>



<jsp:include page="../../footer.jsp"/>

<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>
<script src="/js/dashboard_product.js"></script>
</body>
</html>
