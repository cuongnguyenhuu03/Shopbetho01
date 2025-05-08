<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
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

    <link rel="stylesheet" href="/css/chi_tiet_san_pham.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/footer.css" />

</head>
<body>
<jsp:include page="../../header.jsp"/>
<main class="main">
    <div class="container main__product__details">
        <div class="row">
            <div class="col-lg-6">
<%--                <img--%>
<%--                        src="${product.colors[0].avtColor}"--%>
<%--                />--%>

                <div class="main__product__details__img__slide">
                    <img
                            src="https://product.hstatic.net/200000692427/product/upload_9ed38da3b49a47c9924fb56d2f2dd72d_master.jpg"
                    /><img
                        src="https://product.hstatic.net/200000692427/product/upload_9ed38da3b49a47c9924fb56d2f2dd72d_master.jpg"
                /><img
                        src="https://product.hstatic.net/200000692427/product/upload_4dabe921edb74b0bb185892bb7ec96c2_large.jpg"
                /><img
                        src="https://product.hstatic.net/200000692427/product/upload_f98c320906ad497bb2bead0f0c647043_large.jpg"
                />
                </div>
            </div>

            <div class="col-lg-6">
                <h1>Bộ áo cộc quần cộc trắng phối hồng nhạt in hình pupy</h1>

                <p>
                    Tình trạng:

                    <span id="main__product__details__status">Còn hàng</span>
                </p>

                <p>
                    Mã sản phẩm:
                    <span id="main__product__details__id"> 629078gvsdoiu </span>
                </p>

                <p>
                    Giá:
                    <span id="main__product__details__price"> 215,000 vnđ </span>
                </p>

                <p>Màu sắc</p>

                <div class="main__product__details__color">
                    <img
                            src="https://product.hstatic.net/200000692427/product/upload_9ed38da3b49a47c9924fb56d2f2dd72d.jpg"
                    />
                    <img
                            src="https://product.hstatic.net/200000692427/product/upload_9ed38da3b49a47c9924fb56d2f2dd72d.jpg"
                    />
                    <img
                            src="https://product.hstatic.net/200000692427/product/upload_9ed38da3b49a47c9924fb56d2f2dd72d.jpg"
                    />
                </div>

                <div class="main__product__details__size">
                    <p>Kích thước:</p>

                    <button>2Y</button>
                    <button>3Y</button>
                    <button>4Y</button>
                    <button>5Y</button>
                </div>

                <div class="main__product__details__quantity">
                    <p>Số lượng:</p>

                    <div class="main__product__details__quantity__grid">

                        <input
                                type="number"
                                id="quantity"
                                name="quantity"
                                min="1"
                                value="1"
                                step="1"
                        />

                        <button type="button" data-bs-target="#exampleModal" data-bs-toggle="modal" class="main__product__details__btn">
                            Để lại thông tin mua hàng
                        </button>
                    </div>

                </div>

                <hr/>
                <div class="main__product__details__shop">
                    <h5 class="fw-bold">Tìm tại cửa hàng:</h5>

                    <h5>
                        62/15 Lý Chính Thắng, phường Võ Thị Sáu, Quận 3, thành phố Hồ
                        Chí Minh
                    </h5>
                </div>
            </div>
        </div>
    </div>

    <div class="container main__product__details__describe">
        <h2>Mô tả</h2>
        <hr />
        <p>
        <p>
            Thiết kế hiện đại, khỏe khoắn phù hợp cho bé đi học và đi chơi.
        </p>​
        <p>
            Phối
            vải và chuyển màu nhịp nhàng trên các chi tiết trang phục​ Quần cạp
            mềm, bản lớn chắc chắn, không gây hằn bụng, có túi nhỏ cho bé cất đồ,
            dây nơ tạo điểm nhấn thời trang Cổ áo bo tròn mềm mại và vừa vặn, khuy
            bấm cài vai giúp mở rộng chu vi vòng cổ Hình in ngộ nghĩnh, dễ thương
        </p>
        <p>
            Đặc điểm thiết kế Thiết kế dễ dàng ​vận động, kiểu dáng phù hợp ​mùa
            hè cho em bé ​2-6 tuổi đi học và đi chơi
        </p>
        <p>
            Thiết kế ralgan tạo sự tương
            phản, nổi bật cho phần tay áo với thân Chất liệu cải tiến mềm mại, bền
            chắc, nâng cao thời gian sử dụng sản phẩm.​ Thông tin chất liệu Chất
            liệu modal cotton mềm mại thoáng mát
        </p>
        </p>
    </div>

    <div class=" container main__evaluate">
        <h1>Đánh giá sản phẩm</h1>
        <div class="row d-flex  align-items-center">
            <div class="col-3">
                <i class='bx bxs-star main__evaluate__1'>

                </i>
            </div>

            <div class="col-9 main__evaluate__2">

                <div class="main__evaluate__star">
                    <i class='bx bx-star' ></i>

                </div>

                <div class="main__evaluate__star">
                    <i class='bx bx-star' ></i>

                </div>

                <div class="main__evaluate__star">
                    <i class='bx bx-star' ></i>

                </div>

                <div class="main__evaluate__star">
                    <i class='bx bx-star' ></i>

                </div>

                <div class="main__evaluate__star">
                    <i class='bx bx-star' ></i>

                </div>
            </div>
        </div>
    </div>

    <div class="container main__evaluate__similar__roduct__dady">

        <div class="row">
            <div class="col-sm-12">
                <h1 class="fw-bold">
                    Sản phẩm tương tự
                </h1>

                <div class="main__evaluate__similar__roduct">
                    <div class="card">
                        <img class='card-img' src="https://product.hstatic.net/200000692427/product/bo_coc_tay_ao_trang_phoi_quan_ke_caro_be_70f20b5189c94459832442bee6bf9637_large.jpg"/>

                        <h5 class="card-title" href="#">
                            Bộ cộc tay áo trắng phối quần kẻ caro be
                        </h5>

                        <h4>
                            295,000 vnđ
                        </h4>
                    </div>


                    <div class="card">
                        <img class='card-img' src="https://product.hstatic.net/200000692427/product/_-_nb3s25-sc2-m02-ow_-_bo_coc_tay_ao_trang_hoa_tiet_phoi_quan_xanh__2__0952008feb874fa1bd7ae4385e724be5_grande.jpg"/>

                        <h5 class="card-title" href="#">
                            Bộ cộc tay áo trắng phối quần kẻ caro be
                        </h5>

                        <h4>
                            295,000 vnđ
                        </h4>
                    </div>


                    <div class="card">
                        <img class='card-img' src="https://product.hstatic.net/200000692427/product/bo_coc_tay_quan_gia_vay_mau_nau_phoi_trang_dinh_no_de118791d52c43c9ba37679ddcce8db7_large.jpg"/>

                        <h5 class="card-title" href="#">
                            Bộ cộc tay áo trắng phối quần kẻ caro be
                        </h5>

                        <h4>
                            295,000 vnđ
                        </h4>
                    </div>


                    <div class="card">
                        <img class='card-img' src="https://product.hstatic.net/200000692427/product/upload_6612c2fdc4be48348788a00cd996e704_grande.jpg"/>

                        <h5 class="card-title" href="#">
                            Bộ cộc tay áo trắng phối quần kẻ caro be
                        </h5>

                        <h4>
                            295,000 vnđ
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">--%>
<%--        Để lại thông tin mua hàng--%>
<%--    </button>--%>

<%--    <!-- Modal -->--%>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông tin mua hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">Họ tên:</label>
                            <input type="text" class="form-control" id="recipient-name" />
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">Ghi chú:</label>
                            <textarea class="form-control" id="message-text"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-primary">Gửi thông tin</button>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../../footer.jsp"/>

<!-- Js load file layout header và footer tạm thời khi chưa có BE -->

<!-- js của bootrap -->

    <script src="/bootstrap/js/bootstrap.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/detail_product.js"></script>
<script src="/js/index.js"></script>


<script>
    document.addEventListener("DOMContentLoaded", () => {
        const btn = document.querySelector(".main__product__details__btn");
        if (btn) {
            btn.addEventListener("click", () => {
                console.log("Hello");
            });
        }
    });

    console.log(1)
</script>



</body>
</html>

