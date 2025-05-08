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
    <link rel="stylesheet" href="/css/footer.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <title>Quản lý bài viết</title>
    <style>
        .header {
            margin-top: 12%;
        }
    </style>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div class="header">
    <div class="container">
        <div class="header__1">
            <h1>Quản lý bài viết (Blog)</h1>

            <a href="/admin/blog/create" style="width: 200px; justify-self: flex-end;">
                <button class="header__1__btn" style="height: 100%">Thêm bài viết mới</button>
            </a>
        </div>
        <hr />
        <form action="/admin/blog/filterDashboardBlog">
            <div class="header__2">
                <input
                        type="text"
                        class="form-control p-3"
                        placeholder="Nhập bài viết bạn muốn tìm"
                        name="title"
                />
                <button type="submit" class="header__2__btn">Tìm kiếm</button>
            </div>
        </form>
    </div>
</div>

<main class="main">
    <div class="container">
        <div class="row main__navbar">
            <div class="col-sm-1 fw-bold">STT</div>
            <div class="col-sm-2 fw-bold">Tiêu đề bài viết</div>

            <div class="col-sm-4 fw-bold">Nội dung sơ lược</div>
            <div class="col-sm-2 fw-bold">Thời gian tạo</div>
            <div class="col-sm-1 fw-bold">Mã bài viết</div>
            <div class="col-sm-2 fw-bold">Hành động</div>
        </div>
        <hr />
        <c:choose>
            <c:when test="${blogs != null}">
                <c:forEach var="blogItem" items="${blogs}" varStatus="loop">
                    <div class="row">
                        <div class="col-sm-1">
                         <span class="main__navbar__product">STT</span>
                             ${loop.index}
                        </div>
                        <div class="col-sm-2">
                        <span class="main__navbar__product">Tiêu đề bài viết</span>
                            <p class="card-title" style="
                                    display: -webkit-box;
                                    -webkit-line-clamp: 3;
                                    -webkit-box-orient: vertical;
                                    overflow: hidden;">
                                    ${blogItem.title}
                            </p>
                            </div>

                        <div class="col-sm-4">
                        <span class="main__navbar__product">Nội dung sơ lược</span>
                            <div class="card-title" style="
                                        display: -webkit-box;
                                        -webkit-line-clamp: 3;
                                        -webkit-box-orient: vertical;
                                        overflow: hidden;">
                                        ${blogItem.content}
                             </div>

                        </div>
                        <div class="col-sm-2">
                         <span class="main__navbar__product">Thời gian tạo</span>
                        ${blogItem.getCreatedAt().toString().split("T")[1].substring(0,5)} ${blogItem.getCreatedAt().toString().split("T")[0]}
                        </div>
                        <div class="col-sm-1">
                               <span class="main__navbar__product">Mã bài viết</span>
                            ${blogItem.id}
                        </div>
                        <div class="col-sm-2">
                            <a href="/admin/blog/update/${blogItem.id}" style="display: inline-block">
                                <button class="btn btn-warning">Sửa</button>
                            </a>
                            <form action="/admin/blog/delete?id=${blogItem.id}" style="display: inline-block" method="post">
                                <button type="submit" class="btn btn-danger m-3">Xóa</button>
                            </form>
                        </div>
                    </div>

                    <hr />
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="row">
                    <div class="col-sm-1">0</div>
                    <div class="col-sm-2">Cách giặt đồ trẻ sơ sinh khi mới mua về siêu đơn giản</div>

                    <div class="col-sm-4">
                        Giặt và bảo quản như thế nào để quần áo của bé luôn mới, sạch sẽ sau
                        khi mua là điều khiến nhiều mẹ bỉm sữa lo lắng và thắc mắc. Trong
                        bài viết dưới đây, Nous sẽ chia sẻ với mẹ cách giặt đồ trẻ sơ sinh
                        mới mua về siêu đơn giản.
                    </div>
                    <div class="col-sm-2">20h03 27/8/2025</div>
                    <div class="col-sm-1">7878977</div>
                    <div class="col-sm-2">
                        <a href="/admin/blog/update/1" style="display: inline-block">
                            <button class="btn btn-warning">Sửa</button>
                        </a>
                        <a style="display: inline-block">
                            <button class="btn btn-danger m-3">Xóa</button>
                        </a>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="col-sm-1">1</div>
                    <div class="col-sm-2">Cách giặt đồ trẻ sơ sinh khi mới mua về siêu đơn giản</div>

                    <div class="col-sm-4">
                        Giặt và bảo quản như thế nào để quần áo của bé luôn mới, sạch sẽ sau
                        khi mua là điều khiến nhiều mẹ bỉm sữa lo lắng và thắc mắc. Trong
                        bài viết dưới đây, Nous sẽ chia sẻ với mẹ cách giặt đồ trẻ sơ sinh
                        mới mua về siêu đơn giản.
                    </div>
                    <div class="col-sm-2">20h03 27/8/2025</div>
                    <div class="col-sm-1">7878977</div>
                    <div class="col-sm-2">
                        <button class="btn btn-warning">Sửa</button>
                        <button class="btn btn-danger m-3">Xóa</button>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="col-sm-1">2</div>
                    <div class="col-sm-2">Cách giặt đồ trẻ sơ sinh khi mới mua về siêu đơn giản</div>

                    <div class="col-sm-4">
                        Giặt và bảo quản như thế nào để quần áo của bé luôn mới, sạch sẽ sau
                        khi mua là điều khiến nhiều mẹ bỉm sữa lo lắng và thắc mắc. Trong
                        bài viết dưới đây, Nous sẽ chia sẻ với mẹ cách giặt đồ trẻ sơ sinh
                        mới mua về siêu đơn giản.
                    </div>
                    <div class="col-sm-2">20h03 27/8/2025</div>
                    <div class="col-sm-1">7878977</div>
                    <div class="col-sm-2">
                        <button class="btn btn-warning">Sửa</button>
                        <button class="btn btn-danger m-3">Xóa</button>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="col-sm-1">3</div>
                    <div class="col-sm-2">Cách giặt đồ trẻ sơ sinh khi mới mua về siêu đơn giản</div>

                    <div class="col-sm-4">
                        Giặt và bảo quản như thế nào để quần áo của bé luôn mới, sạch sẽ sau
                        khi mua là điều khiến nhiều mẹ bỉm sữa lo lắng và thắc mắc. Trong
                        bài viết dưới đây, Nous sẽ chia sẻ với mẹ cách giặt đồ trẻ sơ sinh
                        mới mua về siêu đơn giản.
                    </div>
                    <div class="col-sm-2">20h03 27/8/2025</div>
                    <div class="col-sm-1">7878977</div>
                    <div class="col-sm-2">
                        <button class="btn btn-warning">Sửa</button>
                        <button class="btn btn-danger m-3">Xóa</button>
                    </div>
                </div>

                <hr />
                <div class="row">
                    <div class="col-sm-1">4</div>
                    <div class="col-sm-2">Cách giặt đồ trẻ sơ sinh khi mới mua về siêu đơn giản</div>

                    <div class="col-sm-4">
                        Giặt và bảo quản như thế nào để quần áo của bé luôn mới, sạch sẽ sau
                        khi mua là điều khiến nhiều mẹ bỉm sữa lo lắng và thắc mắc. Trong
                        bài viết dưới đây, Nous sẽ chia sẻ với mẹ cách giặt đồ trẻ sơ sinh
                        mới mua về siêu đơn giản.
                    </div>
                    <div class="col-sm-2">20h03 27/8/2025</div>
                    <div class="col-sm-1">7878977</div>
                    <div class="col-sm-2">
                        <button class="btn btn-warning">Sửa</button>
                        <button class="btn btn-danger m-3">Xóa</button>
                    </div>
                </div>

                <hr />

                <div class="row">
                    <div class="col-sm-1">5</div>
                    <div class="col-sm-2">Cách giặt đồ trẻ sơ sinh khi mới mua về siêu đơn giản</div>

                    <div class="col-sm-4">
                        Giặt và bảo quản như thế nào để quần áo của bé luôn mới, sạch sẽ sau
                        khi mua là điều khiến nhiều mẹ bỉm sữa lo lắng và thắc mắc. Trong
                        bài viết dưới đây, Nous sẽ chia sẻ với mẹ cách giặt đồ trẻ sơ sinh
                        mới mua về siêu đơn giản.
                    </div>
                    <div class="col-sm-2">20h03 27/8/2025</div>
                    <div class="col-sm-1">7878977</div>
                    <div class="col-sm-2">
                        <button class="btn btn-warning">Sửa</button>
                        <button class="btn btn-danger m-3">Xóa</button>
                    </div>
                </div>

                <hr />
            </c:otherwise>
        </c:choose>


    </div>
</main>


<jsp:include page="../../footer.jsp"/>

<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>
<script src="/js/dashboard_blog.js"></script>
</body>
</html>
