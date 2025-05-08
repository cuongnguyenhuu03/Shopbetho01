<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.shopbetho.shop.entity.FormatUtil" %>
<html>
<head>
    <title>Cập nhật sản phẩm</title>
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
    <form id="formData" action="/admin/product/update" method="post" enctype="multipart/form-data">
        <div class="CreateProduct">
            <div class="container">
                <div class="CreateProductSubmit">
                    <h2>Cập nhật sản phẩm</h2>

                    <button class="CreateProductSubmit__Btn">Cập nhật</button>
                </div>
            </div>

            <div class="container">
                <div class="CreateProductMain">
                    <div class="CreateProduct__GeneralInfor">
                        <input type="number" name="id" value="${product.id}" hidden="hidden">
                        <h3>Thông tin tổng quan</h3>
                        <p>Tên sản phẩm</p>
                        <input
                                class="form-control CreateProduct__GeneralInfor__NameProduct"
                                type="text"
                                name="name"
                                placeholder="Ví dụ: áo khoác mùa hè cho bé"
                                value="${product.name}"
                        />

                        <p>Miêu tả sản phẩm</p>
                        <textarea
                                type="text"
                                name="description"
                                class="form-control CreateProduct__GeneralInfor__DescribeProduct"
                                placeholder="Ví dụ: Áo quần con nít thường được thiết kế với màu sắc tươi sáng, họa tiết ngộ nghĩnh, đáng yêu. Chất liệu vải mềm mại, thoáng mát như cotton, lanh, hoặc nỉ, đảm bảo sự thoải mái cho làn da nhạy cảm của trẻ. Kiểu dáng đa dạng, từ những bộ đồ liền thân ấm áp cho trẻ sơ sinh, đến những chiếc áo thun, quần short năng động cho trẻ lớn hơn. Các chi tiết như nơ, bèo nhún, hình thú cưng, hoặc nhân vật hoạt hình được thêu hoặc in trên áo quần, tạo điểm nhấn thu hút sự chú ý của trẻ."

                        >
                            ${product.description}
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
                                            ${product.isActive() ? "checked" : ""}
                                    />
                                </div>

                                <div class="CreateProduct__GeneralInfor__StatusId__Status__2">
                                    <lable>Hết hàng</lable>
                                    <input
                                            id="CreateProduct__GeneralInfor__StatusId__Status__2"
                                            value="false"
                                            name="isActive"
                                            type="radio"
                                            ${not product.isActive() ? "checked" : ""}
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
                                        value="${product.code}"
                                />
                            </div>
                        </div>

                        <div class="CreateProductMain__Price">
                            <p>Giá sản phẩm</p>
                            <input type="number" name="price" class="form-control" value="${product.getPrice()}"/>
                        </div>

                        <div class="CreateProduct__GeneralInfor__outstanding">
                            <p>Sản phẩm này có dùng để hiện thị sản phẩm nỗi bật không ?</p>
                            <lable class="m-2">Có</lable>
                            <input
                                    id="CreateProduct__GeneralInfor__outstanding_1"
                                    value="true"
                                    name="isHighlight"
                                    type="radio"
                                    ${product.isHighlight() ? "checked" : ""}
                            />

                            <label class="m-2">Không</label>
                            <input
                                    id="CreateProduct__GeneralInfor__outstanding"
                                    name="isHighlight"
                                    value="false"
                                    type="radio"
                                    ${not product.isHighlight() ? "checked" : ""}
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
                                   ${product.isNew()? "checked" : ""}
                            />

                            <label class="m-2">Không</label>
                            <input
                                    id="CreateProduct__GeneralInfor__newProduct"
                                    name="isNew"
                                    value="false"
                                    type="radio"
                                    ${not product.isNew()? "checked" : ""}
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
                                src="./Resource/img/add img.png"
                              />

                              <div class="CreateProduct__GeneralInfor__UploadImg__Detail">
                                <img
                                  class="addImgDetail__1"
                                  style="width: 80%"
                                  src="./Resource/img/add img.png"
                                />
                                <img
                                  class="addImgDetail__2"
                                  style="width: 80%"
                                  src="./Resource/img/add img.png"
                                />
                                <img
                                  class="addImgDetail__3"
                                  style="width: 80%"
                                  src="./Resource/img/add img.png"
                                />
                                <img
                                  class="addImgDetail__4"
                                  style="width: 80%"
                                  src="./Resource/img/add img.png"
                                />
                              </div>
                            </div> -->
                            <c:forEach var="colorName" items="${product.getColors()}">

                                    <div
                                            class="CreateProduct__GeneralInfor__UploadImg__avt__box__template__div"
                                    >
                                        <input type="hidden" name="colorIds" value="${colorName.id}"/>
                                        <input
                                                type="file"
                                                id="CreateProduct_Avatar"
                                                name="avatarColors"
                                                accept="image/*"
                                                hidden
                                        />


                                        <!-- thẻ input này dùng checkbox để hỗ trợ xóa -->
                                        <input type="checkbox" class="group-checkbox-color" /> Chọn
                                        nhóm này
                                        <br/>
                                        <input type="text" placeholder="Nhập màu..." class="colorNames" name="colorNames"
                                               style="display: block; margin-top: 5px; margin-bottom: 7px; padding-left:8px"
                                               value="${colorName.name}"
                                        />



                                        <img
                                                class="addImgAvt"
                                                style="width: 100%"
                                                src="/upload/file/${colorName.avtColor}"
                                                name="avatarColors"
                                        />
                                        <div class="CreateProduct__GeneralInfor__UploadImg__Detail">
                                            <c:choose>
                                                <c:when test="${colorName.imageUrl != null && colorName.imageUrl.size() > 0}">
                                                    <c:forEach var="itemImage" items="${colorName.imageUrl}" varStatus="loop">
                                                        <img
                                                                class="addImgDetail__${loop.index + 1}"
                                                                style="width: 80%"
                                                                src="/upload/file/${itemImage}"
                                                        />
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
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
                                                </c:otherwise>
                                            </c:choose>


                                        </div>
                                    </div>

                            </c:forEach>
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
                                        <input type="text" placeholder="Nhập màu..." class="colorNames" name="colorNames"
                                               style="display: block; margin-top: 5px; margin-bottom: 7px; padding-left:8px"
                                        />



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
                            >
                                <c:forEach var="sizeItem" items="${product.sizes}">
                                    <div class="size__box">
                                        ${sizeItem}
                                    </div>
                                </c:forEach>
                            </div>

                            <div
                                    class="CreateProduct__GeneralInfor__UploadImg__Size__Detail"
                            >
                                <button
                                        class="CreateProduct__GeneralInfor__UploadImg__SizeAdd__Btn"
                                >
                                    Thêm size
                                </button>
                                <button
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
                                <option disabled>-- Lựa chọn --</option>
                                <option value="Đồ sơ sinh" <c:if test="${product.catalogue == 'DOSOSINH'}">selected</c:if>>Đồ sơ sinh</option>
                                <option value="Sét đồ" <c:if test="${product.catalogue == 'SETDO'}">selected</c:if>>Sét đồ</option>
                                <option value="Đồ bơi" <c:if test="${product.catalogue == 'DOBOI'}">selected</c:if>>Đồ bơi</option>
                                <option value="Áo quần" <c:if test="${product.catalogue == 'AOQUAN'}">selected</c:if>>Áo quần</option>
                                <option value="Phụ kiện" <c:if test="${product.catalogue == 'PHUKIEN'}">selected</c:if>>Phụ kiện</option>
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
                                                                                <c:if test="${product.catalogue == 'DOSOSINH'}">
                                                                                    <option value="QUẦN ÁO" <c:if test="${product.catalogueDetailEnum == 'QUANAO'}">selected</c:if>>QUẦN ÁO</option>
                                                                                    <option value="KHĂN" <c:if test="${product.catalogueDetailEnum == 'KHAN'}">selected</c:if>>KHĂN</option>
                                                                                    <option value="BAO TAY" <c:if test="${product.catalogueDetailEnum == 'BAOTAY'}">selected</c:if>>BAO TAY</option>
                                                                                    <option value="CHÂN MŨ" <c:if test="${product.catalogueDetailEnum == 'CHANMU'}">selected</c:if>>CHÂN MŨ</option>

                                                                                </c:if>
                                                                                <c:if test="${product.catalogue == 'SETDO'}">
                                                                                            <option value="BÉ TRAI" <c:if test="${product.catalogueDetailEnum == 'BETRAI'}">selected</c:if>>BÉ TRAI</option>
                                                                                            <option value="BÉ GÁI" <c:if test="${product.catalogueDetailEnum == 'BEGAI'}">selected</c:if>>BÉ GÁI</option>
                                                                                </c:if>
                                                                                <c:if test="${product.catalogue == 'DOBOI'}">
                                                                                          <option  value="BÉ TRAI" <c:if test="${product.catalogueDetailEnum == 'BETRAI'}">selected</c:if>>BÉ TRAI</option>
                                                                                          <option value="BÉ GÁI" <c:if test="${product.catalogueDetailEnum == 'BEGAI'}">selected</c:if>>BÉ GÁI</option>
                                                                                </c:if>
                                                                                <c:if test="${product.catalogue == 'PHUKIEN'}">
                                                                                          <option value="DẦU" <c:if test="${product.catalogueDetailEnum == 'DAU'}">selected</c:if>>DẦU</option>
                                                                                          <option value="KHĂN" <c:if test="${product.catalogueDetailEnum == 'KHAN'}">selected</c:if>>KHĂN</option>
                                                                                          <option value="KẸP CÀI" <c:if test="${product.catalogueDetailEnum == 'KEPCAI'}">selected</c:if>>KẸP CÀI</option>

                                                                                </c:if>
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
</main>

<jsp:include page="../../footer.jsp"/>
<div class="wrapper" style="display: none">
    <div class="loader"></div>
</div>
<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/js/update_product.js"></script>
<script src="/js/index.js"></script>


<script>
    const divUploadAvatar = document.querySelectorAll(".CreateProduct__GeneralInfor__UploadImg__avt__box__template__div")
    divUploadAvatar.forEach(child => {
           const imageAvatar = child.querySelector(".addImgAvt")
           const inputChooseAvatar = child.querySelector("#CreateProduct_Avatar");
           imageAvatar.addEventListener("click", () => {
                           inputChooseAvatar.click();
                           inputChooseAvatar.addEventListener("change", (event) => {
                               const file = event.target.files[0];
                               if (file) {
                                   imageAvatar.src = URL.createObjectURL(file);
                                   imageAvatar.dataset.file = file.name;
                               }
                           });
            });
    })




    window.addEventListener("DOMContentLoaded", () => {
     const detailImgsContainer = document.querySelectorAll(".CreateProduct__GeneralInfor__UploadImg__Detail");
     let indexTemp = 0;
     detailImgsContainer.forEach((child, index) => {
        const imgChild = child.querySelectorAll("img");

        imgChild.forEach((img, index) => {
                    const detailInput = document.createElement("input");
                    detailInput.type = "file";
                    detailInput.name = "colorImages[" + indexTemp + "]" + "["+ index +"]";
                    detailInput.accept = "image/*";
                    detailInput.style.display = "none";

                    img.addEventListener("click", () => detailInput.click());
                    detailInput.addEventListener("change", (event) => {
                        const file = event.target.files[0];
                        if (file) {
                            img.src = URL.createObjectURL(file);
                            img.dataset.file = file.name;
                        }
                    });
                  child.appendChild(detailInput)

                });
                indexTemp++;
     })



        const typeCatalogue = document.querySelector(".CreateProduct__GeneralInfor__UploadImg__Category__Product__Type")
        const typeCatalogueDetail = document.querySelector(".CreateProduct__GeneralInfor__UploadImg__Category__Product__Type__Detail")


    })

    function formatCurrencyVN(amount) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND',
                minimumFractionDigits: 0,
                maximumFractionDigits: 0
            })
                .format(amount)
                .replace('₫', '')  // Bỏ ký hiệu đ
                .trim();           // Xóa khoảng trắng cuối
        }

</script>

</body>
</html>
