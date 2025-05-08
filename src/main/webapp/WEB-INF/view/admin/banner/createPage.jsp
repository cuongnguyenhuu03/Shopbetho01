<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Banner</title>
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

    <link rel="stylesheet" href="/admin/css/create_banner.css" />
    <link rel="stylesheet" href="/admin/css/create_blog.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/footer.css" />

     <style>
            .wrapper {
                position: fixed;
                top: 0;
                bottom: 0;
                right: 0;
                left: 0;
                z-index: 2000;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: rgba(0, 0, 0, 0.5);
            }

            .loader,
            .loader::before,
            .loader::after {
                border-width: 2px;
                border-style: solid;
                border-radius: 10px;
                animation: rotate 5s linear infinite;
            }

            .loader {
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                width: 40px;
                height: 40px;
                border-color: #5a4ff3;
            }

            .loader::before,
            .loader::after {
                position: absolute;
                content: '';
            }

            .loader::before {
                border-color: #35a2d2;
                width: 110%;
                height: 110%;
                animation-delay: 0.5s;
            }

            .loader::after {
                border-color: #9c40fc;
                width: 120%;
                height: 120%;
                animation-delay: 0.1s;
            }

            @keyframes rotate {
                to {
                    transform: rotate(360deg);
                }
            }
        </style>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<main>
    <div class="CreateBanner container">
        <div class="CreateBanner__title">
            <h1>Cập nhật banner trang chủ</h1>
            <form id="formData" action="/admin/banner/create" method="post" enctype="multipart/form-data">
                <input type="file" id="imageInput1" name="image1" accept="image/*" hidden="hidden"/>
                <input type="file" id="imageInput2" name="image2" accept="image/*" hidden="hidden"/>
                <button class="CreateBanner__title__btn" >Cập nhật</button>
            </form>
        </div>

        <div class="container">
            <div class="CreateBanner__1">
                <h5>Banner đầu trang</h5>
                <div class="CreateBanner__1__add">
                    <img src="/images/add img.png" />
                </div>
            </div>

            <hr />

            <div class="CreateBanner__2">
                <h5>Banner thân trang</h5>
                <div class="CreateBanner__2__add">
                    <img src="/images/add img.png" />
                </div>
            </div>
        </div>
    </div>
    <input type="file" id="imageInput" accept="image/*" hidden />
     <div class="wrapper" style="display: none">
            <div class="loader"></div>
        </div>
</main>

<jsp:include page="../../footer.jsp"/>
<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>

<script>
    // Đang phát triển UI trên môi trường dev, không có BE nền phần này là tạm thời
    // Tải header từ file header.html


    // Js để xử lý sự kiện chọn ảnh tạm thời
    let currentImg1 = null;
    let currentImg2 = null;
    const imageInput_1 = document.getElementById("imageInput1")
    const imageInput_2 = document.getElementById("imageInput2")

    // Bắt sự kiện click vào khu vực chọn ảnh
    document
        .querySelectorAll(".CreateBanner__1__add")
        .forEach((div) => {
            div.addEventListener("click", function () {
                currentImg1 = this.querySelector("img"); // Lưu lại ảnh cần thay đổi
                 imageInput_1.click();
            });
        });
    document
        .querySelectorAll(".CreateBanner__2__add")
        .forEach((div, index) => {
            div.addEventListener("click", function () {
                currentImg2 = this.querySelector("img"); // Lưu lại ảnh cần thay đổi
               imageInput_2.click();
            });
        });

    // Khi người dùng chọn ảnh, thay đổi src của ảnh được chọn
    imageInput_1.addEventListener("change", function (event) {
        if (currentImg1 && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg1.src = e.target.result;
                currentImg1.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg1.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });
    imageInput_2.addEventListener("change", function (event) {
        if (currentImg2 && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg2.src = e.target.result;
                currentImg2.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg2.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });

    // submit form
    const formData = document.querySelector("#formData");
    formData.addEventListener("submit", (e) => {
        e.preventDefault();
        if(!imageInput_1.value) {
            alert("Vui lòng chọn banner đầu trang")
            return;
        }
        if(!imageInput_2.value) {
            alert("Vui lòng chọn banner cuối trang")
            return;
        }
        const loading = document.querySelector('.wrapper');
                    loading.style.display = 'flex';
        formData.submit();
    });
</script>
</body>
</html>
