<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Chi tiết bài viết</title>
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
    <link rel="stylesheet" href="/admin/css/blog_detail.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/footer.css" />
</head>
<body>
<jsp:include page="../../header.jsp"/>
<main class="main">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <c:choose>
                    <c:when test="${blog != null}">
                        <img src="/upload/file/${blog.imageUrl}"/>
                        <h1>${blog.title}</h1>
                        <p>${blog.content}</p>
                        <h3>Chi tiết: </h3>
                        <p>${blog.description}</p>
                    </c:when>
                    <c:otherwise>
                        <span>Không có chi tiết cụ thể</span>
                    </c:otherwise>
                </c:choose>
<%--                <img--%>
<%--                        src="https://file.hstatic.net/200000692427/article/banner_web-02_9df357c44c054222b1568a298246d652_1024x1024.jpg"--%>
<%--                />--%>
<%--                <h1>Mách mẹ cách chọn mua đồ sơ sinh cho bé trai vào mùa hè</h1>--%>

<%--                <p>--%>
<%--                    Chàng trai của mẹ sẽ là một chàng trai tốt bụng và ấm áp biết bao--%>
<%--                    bởi con sẽ được lớn lên bằng sự yêu thương, bao bọc nhẹ nhàng của--%>
<%--                    ba mẹ. Để Nous cùng đồng hành với mẹ cách chọn mua đồ sơ sinh cho--%>
<%--                    bé trai vào mùa hè này nhé!--%>
<%--                </p>--%>

<%--                <h4>1. Những món đồ sơ sinh cần thiết cho bé trai vào mùa hè</h4>--%>

<%--                <h4>1.1 Quần áo sơ sinh cho bé trai</h4>--%>

<%--                <p>--%>
<%--                    Mẹ có thể chọn mua quần áo sơ sinh vào bất kì khoảng thời gian từ--%>
<%--                    khi mẹ biết tin có bé. Nous gợi ý mẹ khoảng thời gian phù hợp nhất--%>
<%--                    để sắm đồ sơ sinh cho bé là từ ngoài tháng thứ 7 của thai kì. Vì--%>
<%--                    thời điểm này mẹ có thể xác định được cân nặng của con và thời--%>
<%--                    điểm sinh con sẽ vào mùa nào trong năm--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Chọn mua 4 bộ quần áo vừa size và khoảng 3 bộ quần áo nhỉnh size--%>
<%--                    hơn chút vì giai đoạn này bé lớn rất nhanh--%>
<%--                </p>--%>

<%--                <h4>1.2 Bao tay, bao chân</h4>--%>

<%--                <p>--%>
<%--                    Thời tiết đang mùa nắng nóng oi bức nên mẹ chỉ cần chuẩn bị khoảng--%>
<%--                    02 bộ bao tay, bao chân, mũ sơ sinh khi đưa bé đi ra ngoài đi--%>
<%--                    chơi, đi tiêm phòng.--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Bao tay bao chân Nous hạn chế chỉ thừa gây nguy hiểm cho trẻ đồng--%>
<%--                    thời vừa vặn không gây tuột tay thất lạc phụ kiện.--%>
<%--                </p>--%>

<%--                <img--%>
<%--                        src="https://file.hstatic.net/200000692427/file/1__1__7c0402121751415dad8e4e7fbb6d7693_1024x1024.jpg"--%>
<%--                />--%>

<%--                <h4>1.3 Mũ và Yếm</h4>--%>

<%--                <p>--%>
<%--                    Chuẩn bị khoảng 2-3 chiếc mũ để bảo vệ phần thóp của trẻ trong--%>
<%--                    giai đoạn đầu đời.--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Mũ và yếm đều được sử dụng chất liệu Nu Petit mềm mại và co giãn--%>
<%--                    đa chiều, dễ dàng đồng điệu với trang phục để tạo lên set đồ hoàn--%>
<%--                    thiện.--%>
<%--                </p>--%>

<%--                <img--%>
<%--                        src="https://file.hstatic.net/200000692427/file/2_d892e20177b140c4bf13cb33220f5ed8_1024x1024.jpg"--%>
<%--                />--%>

<%--                <h4>1.4 Khăn sữa, khăn đa năng</h4>--%>

<%--                <p>--%>
<%--                    Nên mua khoảng 5-7 chiếc khăn sữa để chăm sóc bé sơ sinh khi ăn và--%>
<%--                    giúp mẹ thấm hút phần sữa bị chảy.--%>
<%--                </p>--%>
<%--                <p>--%>
<%--                    Khăn đa năng cũng là vật dụng không thể thiếu giúp mẹ làm chăn--%>
<%--                    quấn, khăn lau, khăn tắm cho bé--%>
<%--                </p>--%>
<%--                <p>--%>
<%--                    Những chiếc khăn sữa, khăn đa năng nhà Nous đều được may từ 100%--%>
<%--                    cotton có khả năng kháng khuẩn tự nhiên, thấm hút tốt giúp bé an--%>
<%--                    toàn cả ngày và bền chắc dù qua nhiều lần giặt.--%>
<%--                </p>--%>
<%--                <img--%>
<%--                        src="https://file.hstatic.net/200000692427/file/anh_bai_viet_1.8-min_8124def77d354b46a866c467bfe336fc_grande.jpg"--%>
<%--                />--%>

<%--                <h4>1.5 Các đồ sơ sinh khác cho bé trai vào mùa hè</h4>--%>

<%--                <p>Băng rốn sơ sinh: 3 túi</p>--%>

<%--                <p>Nước muối sinh lí: 01 chai</p>--%>

<%--                <p>Thuốc nhỏ mắt, mũi trẻ sơ sinh 3 lọ 10ml</p>--%>

<%--                <p>Tăm bông cho bé: 2 gói</p>--%>

<%--                <p>Gạc rơ lưỡi: 03 hộp</p>--%>

<%--                <p>Bình sữa 02 bình</p>--%>

<%--                <p>Miếng lót chống thấm: 01 cái</p>--%>

<%--                <p>Khăn ướt: 01 gói</p>--%>
<%--                <p>Bỉm: 2-3 bịch size cho bé sơ sinh</p>--%>

<%--                <p>Chậu tắm: 01 cái</p>--%>

<%--                <p>Chậu rửa mặt: 01 cái</p>--%>

<%--                <h4>2. Lưu ý chọn đồ sơ sinh cho bé trai vào mùa hè</h4>--%>

<%--                <h4>2.1. Chọn chất liệu đồ sơ sinh cho bé trai vào mùa hè</h4>--%>

<%--                <p>--%>
<%--                    Đặc biệt trong mùa hè này mẹ nên chọn mua những bộ quần áo cotton--%>
<%--                    tự nhiên tạo sự thoáng mát, thấm hút mồ hôi tốt, mềm mại sẽ giúp--%>
<%--                    da bé được thoáng hơn--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Nous cho ra mắt nhiều mẫu sơ sinh mới sử dụng chất liệu Nu Air bởi--%>
<%--                    tính ưu việt được dệt pointelle tạo ra ngàn lỗ trám thông thoáng.--%>
<%--                    Nổi bật với đặc tính mềm mại và thoáng khí phương pháp dệt cũng--%>
<%--                    tạo cho chất liệu này bề mặt vải độc đáo và nổi bật mà chẳng cần--%>
<%--                    thêm họa tiết.​--%>
<%--                </p>--%>

<%--                <img--%>
<%--                        src="Nous cho ra mắt nhiều mẫu sơ sinh mới sử dụng chất liệu Nu Air bởi tính ưu việt được dệt pointelle tạo ra ngàn lỗ trám thông thoáng. Nổi bật với đặc tính mềm mại và thoáng khí phương pháp dệt cũng tạo cho chất liệu này bề mặt vải độc đáo và nổi bật mà chẳng cần thêm họa tiết.​"--%>
<%--                />--%>

<%--                <h4>2.2. Chọn kiểu dáng đồ sơ sinh cho bé trai</h4>--%>

<%--                <p>--%>
<%--                    Vì khi mới sinh xương của bé còn mềm, da của bé còn non nên mẹ cần--%>
<%--                    ưu tiên những bộ đồ dài tay có thể bao bọc toàn bộ cơ thể con mà--%>
<%--                    lại thuận tiện thao tác thay/ mặc cho mẹ--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Nous giới thiệu mẹ 3 kiểu dáng đồ sơ sinh cho bé trai dễ mặc, dễ--%>
<%--                    mua, dễ vận động nhà Nous được các mẹ ưa chuộng nhất: bộ cài--%>
<%--                    thẳng, bộ cài lệch, bodysuit liền tất--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    - Bộ cài thẳng newborn: cổ áo tròn, cúc bấm siêu mỏng giúp mẹ--%>
<%--                    thuận tiện thao tác thay đồ khi bé nằm và là lựa chọn an toàn, hầu--%>
<%--                    hết của mẹ Việt Nam--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    - Bộ cài lệch newborn: nhân đôi lớp bảo vệ phần ngực và bụng đồng--%>
<%--                    thời giúp con thoải mái khi nằm sấp mà không lo hằn da--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    - Bodysuit liền thân: bé trai ưa vận động không thể bo qua--%>
<%--                    bodysuit liền thân giúp con thoải mái xoay chuyển mà không lo hở--%>
<%--                    bụng.--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Thiết kế đính tiền bao tay tiện lợi, bảo vệ bé chu đáo hơn và tối--%>
<%--                    ưu chi phí cho mẹ--%>
<%--                </p>--%>

<%--                <img--%>
<%--                        src="https://file.hstatic.net/200000692427/file/8__2__93608694fa4e4e8d88715532f21165a1_1024x1024.jpg"--%>
<%--                />--%>

<%--                <h4>2.3. Chọn màu sắc đồ sơ sinh cho bé trai</h4>--%>

<%--                <p>--%>
<%--                    Chọn mua đồ sơ sinh cho bé trai mẹ cũng nên chọn những màu sắc có--%>
<%--                    gam màu lạnh như xám, xanh, ghi,…vì trẻ sơ sinh rất dễ dàng nhận--%>
<%--                    thức và hình thành tính cách từ khi còn nhỏ.--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Mùa hè sôi động cùng Nous khám phá sắc xanh của ly sinh tố bơ, sắc--%>
<%--                    vàng của ly soda chanh tươi mát, hay sắc tím của ly chè kem khoai--%>
<%--                    môn. Những màu sắc mát mắt sẽ đưa các em bé trai của mẹ khuấy động--%>
<%--                    mùa hè tươi sáng đầu tiên khi con chào đời.--%>
<%--                </p>--%>

<%--                <img--%>
<%--                        src="https://file.hstatic.net/200000692427/file/35_bc068d083d0b48caa52c911e410c9c42_1024x1024.jpg"--%>
<%--                />--%>

<%--                <h4>3. Địa chỉ mua đồ sơ sinh cho bé trai uy tín</h4>--%>

<%--                <p>--%>
<%--                    Làn da của trẻ còn mỏng manh và dễ bị dị ứng với bụi vải, vải--%>
<%--                    không an toàn nên khi chuẩn bị đồ sơ sinh cho bé trai mẹ cần tìm--%>
<%--                    hiểu về thương hiệu, nguồn gốc xuất sứ, tem và nhãn mác trước khi--%>
<%--                    mua về sử dụng--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Nous – thương hiệu thời trang trẻ em Made in Việt Nam thuộc Công--%>
<%--                    ty Cổ phần Nu Việt Nam. Hành trình 8 năm chứng minh và phát triển--%>
<%--                    tạo nên những sản phẩm quần áo trẻ em được ba mẹ Việt tin yêu bởi--%>
<%--                    công nghệ hiện đại và chất liệu đạt chuẩn quốc tế, không gây kích--%>
<%--                    ứng và an toàn cho làn da của bé--%>
<%--                </p>--%>

<%--                <p>--%>
<%--                    Mẹ có thể ghé showroom của Nous là Nous Hous tại 79 Mạc Thị Bưởi,--%>
<%--                    Quận 1, Thành phố Hồ Chí Minh để trải nghiệm chất liệu và tinh--%>
<%--                    thần Comfynista của Nous.--%>
<%--                </p>--%>

<%--                <img--%>
<%--                        src="https://file.hstatic.net/200000692427/file/2__2__123cdf586e8d42ea8c5027a54b448007_1024x1024.jpg"--%>
<%--                />--%>

<%--                <section>--%>


<%--                    <div class="main__list__blog">--%>

<%--                        <p>Mẹ có thể tham khảo thêm tủ đồ Nous qua:</p>--%>

<%--                        <p>Website: https://nous.vn</p>--%>

<%--                        <p>Fanpage: noûs | Facebook</p>--%>

<%--                        <p>Shopee: https://shope.ee/Aukkb1qg2</p>--%>

<%--                        <p>Tiki: https://tiki.vn/cua-hang/nous-official</p>--%>

<%--                        <p>Tiktok: https://www.tiktok.com/@nous.vietnam</p>--%>

<%--                        <h3>Xem thêm các bài viết khác</h3>--%>

<%--                        <div class="row">--%>
<%--                            <div class="col-md-6">--%>
<%--                                <div class="card">--%>
<%--                                    <img--%>
<%--                                            src="https://file.hstatic.net/200000692427/article/banner_web-05_5fb82ca0510744658ea432a165e3fad4_1024x1024.jpg"--%>
<%--                                    />--%>

<%--                                    <h5 class="card-title">--%>
<%--                                        Vì sao chất liệu Nu air được ưu ái vào mùa hè--%>
<%--                                    </h5>--%>

<%--                                    <p class="card-text">--%>
<%--                                        Mùa hè bé cần những bộ đồ mềm mại và thấm hút tốt để vận--%>
<%--                                        động thoải mái mà không sợ mồ hôi. Chất liệu Nu Air nhà--%>
<%--                                        Nous có đặc tính nổi bật gì, mẹ cùng Nous tìm hiểu về--%>
<%--                                        chất liệu này nhé!--%>
<%--                                    </p>--%>

<%--                                    <a href="#">--%>
<%--                                        Xem thêm--%>
<%--                                        <i class="bx bx-right-arrow-alt"></i>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="col-md-6">--%>
<%--                                <div class="card">--%>
<%--                                    <img--%>
<%--                                            src="https://file.hstatic.net/200000692427/article/banner_web-05_5fb82ca0510744658ea432a165e3fad4_1024x1024.jpg"--%>
<%--                                    />--%>

<%--                                    <h5 class="card-title">--%>
<%--                                        Vì sao chất liệu Nu air được ưu ái vào mùa hè--%>
<%--                                    </h5>--%>

<%--                                    <p class="card-text">--%>
<%--                                        Mùa hè bé cần những bộ đồ mềm mại và thấm hút tốt để vận--%>
<%--                                        động thoải mái mà không sợ mồ hôi. Chất liệu Nu Air nhà--%>
<%--                                        Nous có đặc tính nổi bật gì, mẹ cùng Nous tìm hiểu về--%>
<%--                                        chất liệu này nhé!--%>
<%--                                    </p>--%>

<%--                                    <a href="#">--%>
<%--                                        Xem thêm--%>
<%--                                        <i class="bx bx-right-arrow-alt"></i>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </section>--%>
            </div>
        </div>
    </div>
</main>

<jsp:include page="../../footer.jsp"/>

<!-- js load file header và footer làm layout tạm thời khi chưa có BE -->

<!-- js của bootrap -->
<script src="/bootstrap/js/bootstrap.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>
</body>
</html>
