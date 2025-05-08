<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.shopbetho.shop.entity.FormatUtil" %>
<%@ page import="java.lang.String" %>
<html>
<head>
    <title>Sản phẩm</title>
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
    <link rel="stylesheet" href="/admin/css/san_pham.css" />

</head>
<body>
<jsp:include page="../../header.jsp"/>

<main class="main">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 main__product">
                <c:choose>
                                    <c:when test="${products != null && products.size() > 0}">
                                        <c:forEach var="product" items="${products}">
                                        <a style="color: black; text-decoration: none" href="/products/${product.id}">
                                              <div class="card">
                                                    <img
                                                      class="card-img-top"
                                                      src="/upload/file/${product.colors[0].avtColor}"
                                                    />
                                                    <p  class="card-text">
                                                         ${product.description}
                                                    </p>

                                                   <h4 class="card-title">
                                                         ${FormatUtil.formatCurrency(product.getPrice())} đ
                                                   </h4>
                                              </div>

                                        </a>
                                        </c:forEach>
                                    </c:when>
                                     <c:otherwise>
                                              <p style="font-size: 17px; font-weight: bold; text-align: center">Không có sản phẩm nào</p>
                                     </c:otherwise>
               </c:choose>

            </div>
        </div>
    </div>

</main>

<jsp:include page="../../footer.jsp"/>
<script src="/js/index.js"></script>
<script>
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
</script
</body>
</html>
