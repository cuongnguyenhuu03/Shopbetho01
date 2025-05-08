<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Thêm sản phẩm mới</title>
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

    <link rel="stylesheet" href="/admin/css/create_product.css" />
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
    <form id="formData" action="/admin/product/create" method="post" enctype="multipart/form-data">
        <div class="CreateProduct">
            <div class="container">
                <div class="CreateProductSubmit">
                    <h2>Thêm sản phẩm mới</h2>

                    <button class="CreateProductSubmit__Btn">Thêm</button>
                </div>
            </div>

            <div class="container">
                <div class="CreateProductMain">
                    <div class="CreateProduct__GeneralInfor">
                        <h3>Thông tin tổng quan</h3>
                        <p>Tên sản phẩm</p>
                        <input
                                class="form-control CreateProduct__GeneralInfor__NameProduct"
                                type="text"
                                name="name"
                                placeholder="Ví dụ: áo khoác mùa hè cho bé"
                        />

                        <p>Miêu tả sản phẩm</p>
                        <textarea
                                type="text"
                                name="description"
                                class="form-control CreateProduct__GeneralInfor__DescribeProduct"
                                placeholder="Ví dụ: Áo quần con nít thường được thiết kế với màu sắc tươi sáng, họa tiết ngộ nghĩnh, đáng yêu. Chất liệu vải mềm mại, thoáng mát như cotton, lanh, hoặc nỉ, đảm bảo sự thoải mái cho làn da nhạy cảm của trẻ. Kiểu dáng đa dạng, từ những bộ đồ liền thân ấm áp cho trẻ sơ sinh, đến những chiếc áo thun, quần short năng động cho trẻ lớn hơn. Các chi tiết như nơ, bèo nhún, hình thú cưng, hoặc nhân vật hoạt hình được thêu hoặc in trên áo quần, tạo điểm nhấn thu hút sự chú ý của trẻ."
                        >
              </textarea>

                        <div class="CreateProduct__GeneralInfor__StatusId">
                            <div class="CreateProduct__GeneralInfor__StatusId__Status">
                                <div class="CreateProduct__GeneralInfor__StatusId__Status__1">
                                    <lable>Còn hàng</lable>
                                    <input
                                            id="CreateProduct__GeneralInfor__StatusId__Status__1"
                                            value="true"
                                            name="isActive"
                                            type="radio"
                                    />
                                </div>

                                <div class="CreateProduct__GeneralInfor__StatusId__Status__2">
                                    <lable>Hết hàng</lable>
                                    <input
                                            id="CreateProduct__GeneralInfor__StatusId__Status__2"
                                            value="false"
                                            name="isActive"
                                            type="radio"
                                    />
                                </div>
                            </div>

                            <div class="CreateProduct__GeneralInfor__StatusId__Id">
                                <lable>Mã sản phẩm</lable>
                                <input
                                        class="m-3 CreateProduct__GeneralInfor__StatusId__Id__Product"
                                        type="text"
                                        name="code"
                                        placeholder="Nhập mã sản phẩm"
                                />
                            </div>
                        </div>

                        <div class="CreateProductMain__Price">
                            <p>Giá sản phẩm</p>
                            <input type="number" name="price" class="form-control" />
                        </div>

                        <div class="CreateProduct__GeneralInfor__outstanding">
                            <p>Sản phẩm này có dùng để hiện thị sản phẩm nỗi bật không ?</p>
                            <lable class="m-2">Có</lable>
                            <input
                                    id="CreateProduct__GeneralInfor__outstanding_1"
                                    value="true"
                                    name="isHighlight"
                                    type="radio"
                            />

                            <label class="m-2">Không</label>
                            <input
                                    id="CreateProduct__GeneralInfor__outstanding"
                                    name="isHighlight"
                                    value="false"
                                    type="radio"
                            />
                        </div>

                        <div class="CreateProduct__GeneralInfor__newProduct">
                            <p>Sản phẩm này có phải sản phẩm mới không ?</p>
                            <lable class="m-2">Có</lable>
                            <input
                                    id="CreateProduct__GeneralInfor__newProduct_1"
                                    name="isNew"
                                    value="true"
                                    type="radio"
                            />

                            <label class="m-2">Không</label>
                            <input
                                    id="CreateProduct__GeneralInfor__newProduct"
                                    name="isNew"
                                    value="false"
                                    type="radio"
                            />
                        </div>
                    </div>

                    <div class="CreateProduct__GeneralInfor__UploadImg">
                        <div class="CreateProduct__GeneralInfor__UploadImg__avt">
                            <h4 class="fw-bold">Quản lý màu</h4>
                            <div class="CreateProduct__GeneralInfor__UploadImg__Color">
                                <button
                                        class="CreateProduct__GeneralInfor__UploadImg__ColorAdd__Btn"
                                >
                                    Thêm màu
                                </button>

                                <button
                                        class="CreateProduct__GeneralInfor__UploadImg__ColorDel__Btn"
                                >
                                    Xóa màu
                                </button>
                            </div>

                            <!-- Bắt đầu ô chọn màu -->

                            <!-- <div class="CreateProduct__GeneralInfor__UploadImg__avt__box">
                              <input
                                type="file"
                                id="CreateProduct__GeneralInfor__UploadImg__avt__input"
                                accept="image/*"
                                hidden
                              />

                              <img
                                class="addImgAvt"
                                style="width: 100%"
                                src="/images/add img.png"
                              />

                              <div class="CreateProduct__GeneralInfor__UploadImg__Detail">
                                <img
                                  class="addImgDetail__1"
                                  style="width: 80%"
                                  src="/images/add img.png"
                                />
                                <img
                                  class="addImgDetail__2"
                                  style="width: 80%"
                                  src="/images/add img.png"
                                />
                                <img
                                  class="addImgDetail__3"
                                  style="width: 80%"
                                  src="/images/add img.png"
                                />
                                <img
                                  class="addImgDetail__4"
                                  style="width: 80%"
                                  src="/images/add img.png"
                                />
                              </div>
                            </div> -->

                            <!-- Kết thúc ô chọn màu -->

                            <!-- template cho ô chọn màu -->

                            <template
                                    class="CreateProduct__GeneralInfor__UploadImg__avt__box__template"
                            >
                                <div
                                        class="CreateProduct__GeneralInfor__UploadImg__avt__box__template__div"
                                >
                                    <input
                                            type="file"
                                            id="CreateProduct__GeneralInfor__UploadImg__avt__input"
                                            accept="image/*"
                                            hidden
                                    />


                                    <!-- thẻ input này dùng checkbox để hỗ trợ xóa -->
                                    <input type="checkbox" class="group-checkbox-color" /> Chọn
                                    nhóm này
                                    <br/>
                                    <input type="text" placeholder="Nhập màu..." class="colorNames" name="colorNames" style="display: block; margin-top: 5px; margin-bottom: 7px; padding-left:8px"/>



                                    <img
                                            class="addImgAvt"
                                            style="width: 100%"
                                            src="/images/add img.png"
                                            name="avatarColors"
                                    />

                                    <div class="CreateProduct__GeneralInfor__UploadImg__Detail">
                                        <img
                                                class="addImgDetail__1"
                                                style="width: 80%"
                                                src="/images/add img.png"
                                        />
                                        <img
                                                class="addImgDetail__2"
                                                style="width: 80%"
                                                src="/images/add img.png"
                                        />
                                        <img
                                                class="addImgDetail__3"
                                                style="width: 80%"
                                                src="/images/add img.png"
                                        />
                                        <img
                                                class="addImgDetail__4"
                                                style="width: 80%"
                                                src="/images/add img.png"
                                        />
                                    </div>
                                </div>
                            </template>
                            <!-- Kết thúc template -->
                        </div>

                        <div class="CreateProduct__GeneralInfor__UploadImg__Size">
                            <h4 class="fw-bold">Tạo size</h4>
                            <input
                                    type="text"
                                    class="form-control CreateProduct__GeneralInfor__UploadImg__Size__Input"
                            />

                            <div
                                    class="CreateProduct__GeneralInfor__UploadImg__Size__RenderList"
                            ></div>

                            <div
                                    class="CreateProduct__GeneralInfor__UploadImg__Size__Detail"
                            >
                                <button
                                        type="button"
                                        class="CreateProduct__GeneralInfor__UploadImg__SizeAdd__Btn"
                                >
                                    Thêm size
                                </button>
                                <button
                                        type="button"
                                        class="CreateProduct__GeneralInfor__UploadImg__SizeDel__Btn"
                                >
                                    Xóa size
                                </button>
                            </div>
                        </div>

                        <div class="CreateProduct__GeneralInfor__UploadImg__Category">
                            <h4 class="fw-bold">Phân loại</h4>
                            <p>Phân loại sản phẩm</p>

                            <select class="form-control CreateProduct__GeneralInfor__UploadImg__Category__Product__Type">
                                -- Lựa chọn --
                                <option value="Đồ sơ sinh">Đồ sơ sinh</option>
                                <option value="Sét đồ">Sét đồ</option>
                                <option value="Đồ bơi">Đồ bơi</option>
                                <option value="Áo quần">Áo quần</option>
                                <option value="Phụ kiện">Phụ kiện</option>
                            </select>

                            <button
                                    class="CreateProduct__GeneralInfor__UploadImg__Category__Btn"
                                    type="button"
                            >
                                Đồng ý
                            </button>
                        </div>
                        <div class="CreateProduct__GeneralInfor__UploadImg__Category">
                                                    <h4 class="fw-bold">Chi tiết phân loại</h4>
                                                    <p>Chi tiết loại sản phẩm</p>

                                                    <select class="form-control CreateProduct__GeneralInfor__UploadImg__Category__Product__Type__Detail">
                                                        -- Lựa chọn --
                                                         <option value="QUẦN ÁO">QUẦN ÁO</option>
                                                                                       <option value="KHĂN">KHĂN</option>
                                                                                        <option value="BAO TAY">BAO TAY</option>
                                                                                         <option value="CHÂN MŨ">CHÂN MŨ</option>
                                                    </select>

                                                    <button
                                                            class="CreateProduct__GeneralInfor__UploadImg__Category__Btn"
                                                            type="button"
                                                    >
                                                        Đồng ý
                                                    </button>
                                                </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <c:if test="${error != null}">
        <p>${error}</p>
    </c:if>

    <div class="wrapper" style="display: none">
        <div class="loader"></div>
    </div>
</main>

<jsp:include page="../../footer.jsp"/>

<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/js/create_product.js"></script>
<script src="/js/index.js"></script>




</body>
</html>
