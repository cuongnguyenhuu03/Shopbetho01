<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật bộ sưu tập</title>
    <link
            rel="stylesheet"
            href="/bootstrap/css/bootstrap.min.css"
    />
    <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
    />

    <link rel="stylesheet" href="/admin/css/create_Collection.css" />

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

<main class="container create__Collection">
    <div class="create__Collection__title">
        <h1>Cập nhật bộ sưu tập trang chủ</h1>

        <form id="formData" action="/admin/collection/create" method="post" enctype="multipart/form-data">
            <input type="file" id="inputImage1" name="image" accept="image/*" hidden="hidden"/>
            <input type="file" id="inputImage2" name="image" accept="image/*" hidden="hidden"/>
            <input type="file" id="inputImage3" name="image" accept="image/*" hidden="hidden"/>
            <input type="file" id="inputImage4" name="image" accept="image/*" hidden="hidden"/>
            <input type="file" id="inputImage5" name="image" accept="image/*" hidden="hidden"/>
            <input type="file" id="inputImage6" name="image" accept="image/*" hidden="hidden"/>

            <button class="create__Collection__btn">Cập nhật</button>
        </form>
    </div>

    <div class="main__3__collection__img">
        <h5>Nhấn vào để thêm hình ảnh</h5>
        <img
                class="main__3__collection__img__item__1"
                src="/images/add img.png"
        />
        <img
                class="main__3__collection__img__item__2"
                src="/images/add img.png"
        />
        <img
                class="main__3__collection__img__item__3"
                src="/images/add img.png"
        />
        <img
                class="main__3__collection__img__item__4"
                src="/images/add img.png"
        />
        <img
                class="main__3__collection__img__item__5"
                src="/images/add img.png"
        />
        <img
                class="main__3__collection__img__item__6"
                src="/images/add img.png"
        />
    </div>

    <input type="file" id="imageInput" accept="image/*" hidden />
</main>

<jsp:include page="../../footer.jsp"/>
<div class="wrapper" style="display: none">
    <div class="loader"></div>
</div>


<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>

<script>
    document.getElementById('formData').addEventListener('submit', function (e) {
        // Chặn submit ngay lập tức
        e.preventDefault();

        // Hiển thị loading (ví dụ: thay đổi nút)
        const loading = document.querySelector('.wrapper');
        loading.style.display = 'flex';
        this.submit(); // submit lại form
    });
</script>

<script>
    // Đang phát triển UI trên môi trường dev, không có BE nền phần này là tạm thời
    // Tải header từ file header.html

    // Js để xử lý sự kiện chọn ảnh tạm thời
    let currentImg = null;
    // const imageInput = document.getElementById("imageInput");
    const inputImage1 = document.getElementById("inputImage1")
    const inputImage2 = document.getElementById("inputImage2")
    const inputImage3 = document.getElementById("inputImage3")
    const inputImage4 = document.getElementById("inputImage4")
    const inputImage5 = document.getElementById("inputImage5")
    const inputImage6 = document.getElementById("inputImage6")


    // Bắt sự kiện click vào khu vực chọn ảnh
    document
        .querySelectorAll(
            ".main__3__collection__img__item__1, .main__3__collection__img__item__2,.main__3__collection__img__item__3, .main__3__collection__img__item__4, .main__3__collection__img__item__5, .main__3__collection__img__item__6"
        )
        .forEach((div, index) => {
            div.addEventListener("click", function () {
                currentImg = this; // Lưu lại ảnh cần thay đổi
                if(index === 0) inputImage1.click();
                if(index === 1) inputImage2.click();
                if(index === 2) inputImage3.click();
                if(index === 3) inputImage4.click();
                if(index === 4) inputImage5.click();
                if(index === 5) inputImage6.click();
            });
        });

    // Khi người dùng chọn ảnh, thay đổi src của ảnh được chọn
    inputImage1.addEventListener("change", function (event) {
        if (currentImg && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg.src = e.target.result;
                currentImg.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });
    inputImage2.addEventListener("change", function (event) {
        if (currentImg && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg.src = e.target.result;
                currentImg.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });
    inputImage3.addEventListener("change", function (event) {
        if (currentImg && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg.src = e.target.result;
                currentImg.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });
    inputImage4.addEventListener("change", function (event) {
        if (currentImg && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg.src = e.target.result;
                currentImg.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });
    inputImage5.addEventListener("change", function (event) {
        if (currentImg && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg.src = e.target.result;
                currentImg.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });
    inputImage6.addEventListener("change", function (event) {
        if (currentImg && event.target.files.length > 0) {
            const reader = new FileReader();
            reader.onload = function (e) {
                currentImg.src = e.target.result;
                currentImg.style.width = "100%"; // Đảm bảo ảnh mới chiếm toàn bộ chiều rộng
                currentImg.style.height = "auto"; //
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });

    const formData = document.querySelector("#formData")
    formData.addEventListener("submit", (e) => {
        e.preventDefault();
        if(!inputImage1.value || !inputImage2.value || !inputImage3.value || !inputImage4.value
            || !inputImage5.value || !inputImage6.value) {
            alert("Vui lòng chọn đủ 6 tấm ảnh cho bộ sưu tập")
        }else {
            formData.submit();
        }
    })

</script>
</body>
</html>
