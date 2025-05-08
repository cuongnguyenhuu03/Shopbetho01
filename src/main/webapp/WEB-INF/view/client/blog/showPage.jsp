<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách bài viết</title>
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
    <link rel="stylesheet" href="/admin/css/blog_list.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/footer.css" />
</head>
<body>
<jsp:include page="../../header.jsp"/>
<main class="main">
    <div class="container">
        <div class="row">

        <c:choose>
            <c:when test="${blogs != null}">
                <c:forEach var="blogItem" items="${blogs}">
            <div class="col-lg-4">
                    <div class="card">
                        <img
                                src="/upload/file/${blogItem.imageUrl}"
                        />
                        <h5 style="margin-top: 10px;" class="card-title">${blogItem.title}</h5>

                        <p class="card-text">
                                ${blogItem.content}
                        </p>

                        <a href="/blogs/${blogItem.id}"
                        >Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
            </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-lg-4">
                    <div class="card">
                        <img
                                class="card-img-top"
                                src="https://file.hstatic.net/200000692427/article/1_trieu_nb_800x534_5a3760033e0c4694af53e4ec7d8a21c5_1024x1024.jpg"
                        />

                        <h4 class="card-title">
                            Sắm đồ đi sinh, shop bé thơ tặng bé quà
                        </h4>

                        <p>
                            Yêu bé từ thuở lọt lòng, shop Bé Thơ cùng mẹ nâng niu thiên thần
                            nhỏ trong chất liệu mềm mại, êm ái và an toàn tuyệt vời với làn
                            da nhạy cảm non nớt
                        </p>

                        <a href="#">
                            Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <img
                                class="card-img-top"
                                src="https://file.hstatic.net/200000692427/article/1_trieu_nb_800x534_5a3760033e0c4694af53e4ec7d8a21c5_1024x1024.jpg"
                        />

                        <h4 class="card-title">
                            Sắm đồ đi sinh, shop bé thơ tặng bé quà
                        </h4>

                        <p>
                            Yêu bé từ thuở lọt lòng, shop Bé Thơ cùng mẹ nâng niu thiên thần
                            nhỏ trong chất liệu mềm mại, êm ái và an toàn tuyệt vời với làn
                            da nhạy cảm non nớt
                        </p>

                        <a href="#">
                            Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <img
                                class="card-img-top"
                                src="https://file.hstatic.net/200000692427/article/1_trieu_nb_800x534_5a3760033e0c4694af53e4ec7d8a21c5_1024x1024.jpg"
                        />

                        <h4 class="card-title">
                            Sắm đồ đi sinh, shop bé thơ tặng bé quà
                        </h4>

                        <p>
                            Yêu bé từ thuở lọt lòng, shop Bé Thơ cùng mẹ nâng niu thiên thần
                            nhỏ trong chất liệu mềm mại, êm ái và an toàn tuyệt vời với làn
                            da nhạy cảm non nớt
                        </p>

                        <a href="#">
                            Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <img
                                class="card-img-top"
                                src="https://file.hstatic.net/200000692427/article/1_trieu_nb_800x534_5a3760033e0c4694af53e4ec7d8a21c5_1024x1024.jpg"
                        />

                        <h4 class="card-title">
                            Sắm đồ đi sinh, shop bé thơ tặng bé quà
                        </h4>

                        <p>
                            Yêu bé từ thuở lọt lòng, shop Bé Thơ cùng mẹ nâng niu thiên thần
                            nhỏ trong chất liệu mềm mại, êm ái và an toàn tuyệt vời với làn
                            da nhạy cảm non nớt
                        </p>

                        <a href="#">
                            Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <img
                                class="card-img-top"
                                src="https://file.hstatic.net/200000692427/article/1_trieu_nb_800x534_5a3760033e0c4694af53e4ec7d8a21c5_1024x1024.jpg"
                        />

                        <h4 class="card-title">
                            Sắm đồ đi sinh, shop bé thơ tặng bé quà
                        </h4>

                        <p>
                            Yêu bé từ thuở lọt lòng, shop Bé Thơ cùng mẹ nâng niu thiên thần
                            nhỏ trong chất liệu mềm mại, êm ái và an toàn tuyệt vời với làn
                            da nhạy cảm non nớt
                        </p>

                        <a href="#">
                            Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <img
                                class="card-img-top"
                                src="https://file.hstatic.net/200000692427/article/1_trieu_nb_800x534_5a3760033e0c4694af53e4ec7d8a21c5_1024x1024.jpg"
                        />

                        <h4 class="card-title">
                            Sắm đồ đi sinh, shop bé thơ tặng bé quà
                        </h4>

                        <p>
                            Yêu bé từ thuở lọt lòng, shop Bé Thơ cùng mẹ nâng niu thiên thần
                            nhỏ trong chất liệu mềm mại, êm ái và an toàn tuyệt vời với làn
                            da nhạy cảm non nớt
                        </p>

                        <a href="#">
                            Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card">
                        <img
                                class="card-img-top"
                                src="https://file.hstatic.net/200000692427/article/1_trieu_nb_800x534_5a3760033e0c4694af53e4ec7d8a21c5_1024x1024.jpg"
                        />

                        <h4 class="card-title">
                            Sắm đồ đi sinh, shop bé thơ tặng bé quà
                        </h4>

                        <p>
                            Yêu bé từ thuở lọt lòng, shop Bé Thơ cùng mẹ nâng niu thiên thần
                            nhỏ trong chất liệu mềm mại, êm ái và an toàn tuyệt vời với làn
                            da nhạy cảm non nớt
                        </p>

                        <a href="#">
                            Xem thêm
                            <i class="bx bx-right-arrow-alt"></i>
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        </div>
    </div>
</main>

<jsp:include page="../../footer.jsp"/>

<!-- Js load file layout header và footer tạm thời khi chưa có BE -->


<!-- js của bootrap -->
<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>
<script src="/js/blog_list.js"></script>
</body>
</html>
