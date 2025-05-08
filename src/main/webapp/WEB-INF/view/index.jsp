<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.shopbetho.shop.entity.FormatUtil" %>
<!DOCTYPE html>
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
            rel="stylesheet"/>
    <script src="https://unpkg.com/scrollreveal"></script>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <title>ShopBeTho</title>
</head>
<body>
<jsp:include page="header.jsp"/>

 <main class="main">
      <div class="main__1">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <img
                src="https://file.hstatic.net/200000692427/file/790x532_61ca7a43928f4f6f8158e06b19cfc605.png"
              />
            </div>

            <div class="col-lg-6">
              <h4>Con trẻ tuyệt nhất khi thoải mái là chính mình</h4>
              <span class="main__1__icon"> “ </span>

              <p>
                Mỗi thiết kế của Shopbetho đều tuân thủ triết lý "COMFYNISTA -
                Thoải mái chính là thời trang", trong đó sự thoải mái của các bé
                được ưu tiên trong mỗi chi tiết nhỏ nhưng vẫn chứa đựng sự tinh
                tế và khác biệt. Vì vậy, Nous luôn được hàng triệu bà mẹ Việt
                Nam tin chọn nâng niu hành trình lớn khôn của bé.
              </p>

              <span class="main__1__icon__2">“</span>

              <span class="main__1__btn">
                <p>Xem thêm</p>
                <img src="/images/img_button pink.png" />
              </span>
            </div>
          </div>
        </div>
      </div>

      <div class="main__2">
        <div class="container">
          <div class="row">
            <h2>Sản phẩm nổi bật</h2>
          </div>
          <div class="row">
            <div class="col-sm-6"></div>
            <div class="col-sm-6 justify-content-end d-flex">
              <nav class="main__2__menu">
                <p>Hàng mới</p>
                <p>Hot sales</p>
                <p>Phụ kiện</p>
                <p>
                <a href="/products" style="color: black; text-decoration: none;">XEM THÊM</a>
                </p>
              </nav>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12">
              <div class="main__2__product d-flex flex-nowrap">
                                      <c:choose>
                                          <c:when test="${productsHighLight != null && productsHighLight.size() > 0}">
                                              <c:forEach var="product" items="${productsHighLight}">
                                                  <div class="card col-sm-3">
                                                      <div style="background-image: url(/upload/file/${product.colors[0].avtColor});
                                                              background-size: cover;
                                                              background-repeat: no-repeat;
                                                              background-position: center;
                                                              width: 100%;
                                                              padding-top: 100%"
                                                      ></div>
                                                      <a style="font-weight: bold;" href="/products/${product.id}" class="card-title"
                                                      >${product.name}</a>
                                                      <h5>${FormatUtil.formatCurrency(product.getPrice())}đ</h5>
                                                  </div>
                                              </c:forEach>
                                          </c:when>
                                          <c:otherwise>
                                              <h1>Không có sản phẩm nổi bật nào.</h1>
                                          </c:otherwise>
                                      </c:choose>


              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="main__3">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <div class="main__3__collection">
                <div class="row main__3__collection__more">
                  <h3>Bộ sưu tập</h3>
                  <a href="#">
                    XEM THÊM
                    <i class="bx bx-right-arrow-alt"></i>
                  </a>
                </div>

                <div class="row">

                  <div class="main__3__collection__img">
                         <c:choose>
                                                      <c:when test="${collections != null && collections.imageUrls.size() > 0}">
                                                          <c:forEach var="picture" items="${collections.imageUrls}" varStatus="loop">
                                                              <img
                                                                      class=`main__3__collection__img__item__${loop.index + 1}`
                                                                      src="/upload/file/${picture}"
                                                              />
                                                          </c:forEach>
                                                      </c:when>
                                                      <c:otherwise>
                                                          <img
                                                                  class="main__3__collection__img__item__1"
                                                                  src="https://file.hstatic.net/200000692427/file/1.jpg"
                                                          />
                                                          <img
                                                                  class="main__3__collection__img__item__2"
                                                                  src="https://file.hstatic.net/200000692427/file/1_0a9f2d4992fd467890bbf9b07258faee.jpg"
                                                          />
                                                          <img
                                                                  class="main__3__collection__img__item__3"
                                                                  src="https://file.hstatic.net/200000692427/file/3.jpg"
                                                          />
                                                          <img
                                                                  class="main__3__collection__img__item__4"
                                                                  src="https://file.hstatic.net/200000692427/file/2_b488f8d7b0b4460396ad165832970f6f.jpg"
                                                          />
                                                          <img
                                                                  class="main__3__collection__img__item__5"
                                                                  src="https://file.hstatic.net/200000692427/file/2_3f667b571a7a40279b27ebad8e30c576.jpg"
                                                          />
                                                          <img
                                                                  class="main__3__collection__img__item__6"
                                                                  src="https://file.hstatic.net/200000692427/file/3_52b3a174a62c4d1e8b2cd40450fc3146.jpg"
                                                          />
                                                      </c:otherwise>
                                                  </c:choose>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="main__3__banner">
                     <c:if test="${banners != null}">
                         <img
                                 src="/upload/file/${banners.secondBanner}"
                         />
                     </c:if>

        </div>
      </div>

      <div class="main__4">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 main__4__slogan__welcome">
              <h2>SẢN PHẨM MỚI</h2>
              <h4>Coming Soon</h4>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <div class="main__4__product">
                                      <c:choose>
                                          <c:when test="${productsNew != null && productsNew.size() > 0}">
                                              <c:forEach var="product" items="${productsNew}">
                                                  <div class="card col-sm-3">
                                                      <div style="background-image: url(/upload/file/${product.colors[0].avtColor});
                                                              background-size: cover;
                                                              background-repeat: no-repeat;
                                                              background-position: center;
                                                              width: 100%;
                                                              padding-top: 100%"
                                                      ></div>
                                                      <a style="font-weight: bold;" href="/products/${product.id}" class="card-title"
                                                      >${product.name}</a>
                                                      <h5>${FormatUtil.formatCurrency(product.getPrice())}đ</h5>
                                                  </div>
                                              </c:forEach>
                                          </c:when>
                                          <c:otherwise>
                                              <h1>Không có sản phẩm nào mới.</h1>
                                          </c:otherwise>
                                      </c:choose>


              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="main__5">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <div class="main__5__news__slogan">
                <h2>Tin tức</h2>

                <a href="/blogs"
                  >Xem thêm
                  <i class="bx bx-right-arrow-alt"></i>
                </a>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12 main__5__news__product">
                                <c:choose>
                                    <c:when test="${blogs != null && blogs.size() > 0}">
                                        <c:forEach var="blogItem" items="${blogs}">
                                            <div class="card">
                                                <img
                                                        src="/upload/file/${blogItem.imageUrl}"
                                                />
                                                <h5 class="card-title" style="
                                                  display: -webkit-box;
                                                  -webkit-line-clamp: 3;
                                                  -webkit-box-orient: vertical;
                                                  overflow: hidden;">${blogItem.title}</h5>

                                                <p class="card-text">
                                                    ${blogItem.content}
                                                </p>

                                                <a href="/blogs/${blogItem.id}"
                                                >Xem thêm
                                                    <i class="bx bx-right-arrow-alt"></i>
                                                </a>
                                            </div>
                                        </c:forEach>

                                    </c:when>
                                    <c:otherwise>
                                        <span>Không có tin tức nỗi bật</span>
                                    </c:otherwise>
                                </c:choose>
            </div>
          </div>
        </div>
      </div>

      <div class="main__6">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 main__6__slogan__1">
              <img
                src="https://file.hstatic.net/200000692427/file/icon-1_1_19a39ece32684288b7867210e0821408.svg"
              />

              <h2>Nous Baby Gallery</h2>
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12 main__6__img">
              <img
                src="https://theme.hstatic.net/200000692427/1001117622/14/home-insta-mid-image-1.jpg?v=5504"
              />

              <img
                src="https://theme.hstatic.net/200000692427/1001117622/14/home-insta-mid-image-2.jpg?v=5504"
              />

              <img
                src="https://theme.hstatic.net/200000692427/1001117622/14/home-insta-mid-image-3.jpg?v=5504S"
              />

              <img
                src="https://theme.hstatic.net/200000692427/1001117622/14/home-insta-mid-image-4.jpg?v=5504"
              />
            </div>
          </div>

          <div class="row">
            <div class="col-sm-12 main__6__slogan__2">
              <h2>New Lookbook</h2>
            </div>

            <div class="row">
              <div class="col-sm-12 main__6__video">
                <iframe
                  width="100%"
                  height="700"
                  src="https://www.youtube.com/embed/XuD4mOQ0Irg"
                  title="YouTube video player"
                  frameborder="0"
                  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                  allowfullscreen
                >
                </iframe>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <footer class="footer">
      <div class="footer__1">
        <hr />
        <div class="footer__1__background"></div>
        <div class="footer__1__slogan">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <h1>Nhận ưu đãi và coupon mới nhất!</h1>

                <p>Chúng tôi cam kết bảo mật không lộ thông tin của bạn</p>

                <input
                  class="form-control"
                  placeholder="Nhập email của bạn ..."
                />

                <span class="footer__1__slogan__btn">
                  <p>Đăng ký</p>
                  <img src="/images/img_button pink.png" />
                </span>
              </div>

              <div class="col-sm-6 footer__1__slogan__img">
                <img
                  src="https://theme.hstatic.net/200000692427/1001117622/14/home-newletter-image.jpg?v=5504"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="footer__2">
        <div class="container">
          <div class="row">
            <div class="col-sm-12 footer__2__cskh">
              <div class="footer__2__cskh__item">
                <div class="footer__2__cskh__item__backgroud">
                  <img
                    src="https://theme.hstatic.net/200000692427/1001117622/14/home_policy_item_image_1.png?v=5504"
                  />
                </div>
                <h5>Giao hàng nhanh, miễn phí</h5>

                <p>
                  Cho đơn hàng từ 500k trở lên hoặc đăng kí thành viên để hưởng
                  nhiều ưu đãi
                </p>
              </div>

              <div class="footer__2__cskh__item">
                <div class="footer__2__cskh__item__backgroud">
                  <img
                    src="https://theme.hstatic.net/200000692427/1001117622/14/home_policy_item_image_2.png?v=5504"
                  />
                </div>
                <h5>Đổi/ trả hàng</h5>

                <p>Đổi trả sản phẩm tối đa 5 ngày</p>
              </div>

              <div class="footer__2__cskh__item">
                <div class="footer__2__cskh__item__backgroud">
                  <img
                    src="https://theme.hstatic.net/200000692427/1001117622/14/home_policy_item_image_3.png?v=5504"
                  />
                </div>
                <h5>Thành viên</h5>

                <p>Tích điểm giảm giá trị hóa đơn</p>
              </div>

              <div class="footer__2__cskh__item">
                <div class="footer__2__cskh__item__backgroud">
                  <img
                    src="https://theme.hstatic.net/200000692427/1001117622/14/home_policy_item_image_4.png?v=5504"
                  />
                </div>
                <h5>Chính hãng</h5>

                <p>Sản phẩm nguồn gốc xuất xứ rõ ràng- an toàn - thoải mái</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <hr id="footer__2_hr" />

      <div class="footer__3">
        <div class="container">
          <div class="row">
            <div class="col-sm-6 col-lg-3">
              <ul>
                <h4>Giới thiệu</h4>
                <li>Giới thiệu</li>
                <li>Chính sách đổi trả</li>
                <li>Chính sách bảo mật</li>
                <li>Chính sách vận chuyển</li>
                <li>Điều khoản dịch vụ</li>
                <li>Hướng dẫn mua hàng</li>
                <li>Hướng dẫn thanh toán</li>
                <li>Liên hệ</li>
              </ul>
            </div>

            <div class="col-sm-6 col-lg-3">
              <ul>
                <h4>Thông tin cửa hàng</h4>
                <li>Shop Bé Thơ</li>

                <li>Mã số thuế: 8014372676</li>

                <li>
                  Địa chỉ: 62/15 Lý Chính Thắng, phường Võ Thị Sáu, Quận 3,
                  thành phố Hồ Chí Minh
                </li>
                <li>Điện thoại: 0916 991 839</li>
                <li>Email: shopbetho62@gmail.com</li>
              </ul>
            </div>

            <div class="col-sm-6 col-lg-3">
              <ul>
                <h4>Hệ thống cửa hàng</h4>
                <li>Không có chi nhánh</li>
              </ul>
            </div>

            <div class="col-sm-6 col-lg-3">
              <ul>
                <h4>Fanpage Facebook</h4>
                <li>
                  <div id="fb-root"></div>
                  <script
                    async
                    defer
                    crossorigin="anonymous"
                    src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v17.0"
                    nonce="XYZ123"
                  ></script>

                  <div
                    class="fb-page"
                    data-href="https://www.facebook.com/Shopbethochm"
                    data-tabs="timeline"
                    data-width="340"
                    data-height="200"
                    data-small-header="false"
                    data-adapt-container-width="true"
                    data-hide-cover="false"
                    data-show-facepile="true"
                  >
                    <blockquote
                      cite="https://www.facebook.com/dobothunlanhchobe"
                      class="fb-xfbml-parse-ignore"
                    >
                      <a href="https://www.facebook.com/dobothunlanhchobe"
                        >Nous Vietnam</a
                      >
                    </blockquote>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="footer__3__mobile">
        <div class="contaier">
          <div class="col-sm-12">
            <!-- Đang làm phần footer cho mobile -->
            <!-- Mình sẽ tự làm phần dropdow -->

            <hr/>

            <div class="footer__3__mobile__dropdow">
              <div class="footer__3__mobile__dropdow__btn">
                <h4>Giới thiệu</h4>
                <i class="bx bx-chevron-down"></i>
              </div>
              <div class="footer__3__mobile__dropdow__content">
                <a href="#">Giới thiệu </a>
                <a href="#">Chính sách đổi trả</a>
                <a href="#">Chính sách bảo mật</a>
                <a href="#">Chính sách vận chuyển</a>
                <a href="#">Điều khoản dịch vụ</a>
                <a href="#">Hướng dẫn mua hàng</a>
                <a href="#">Hướng dẫn thanh toán</a>
                <a href="#">Liên hệ</a>
              </div>
            </div>

            <div class="footer__3__mobile__dropdow">
              <div class="footer__3__mobile__dropdow__btn">
                <h4>Thông tin cửa hàng</h4>
                <i class="bx bx-chevron-down"></i>
              </div>
              <div class="footer__3__mobile__dropdow__content">
                <a href="#">Shop Bé Thơ </a>
                <a href="#">Mã số thuế: 8014372676</a>
                <a href="#"
                  >Địa chỉ: 62/15 Lý Chính Thắng, phường Võ Thị Sáu, Quận 3,
                  thành phố Hồ Chí Minh
                </a>
                <a href="#">Tel: 0916 991 839</a>
                <a href="#">Email: shopbetho62@gmail.com</a>
              </div>
            </div>

            <div class="footer__3__mobile__dropdow">
              <div class="footer__3__mobile__dropdow__btn">
                <h4>Hệ thống cửa hàng</h4>
                <i class="bx bx-chevron-down"></i>
              </div>
              <div class="footer__3__mobile__dropdow__content">
                <a href="#">Không có chi nhánh</a>
              </div>

              <div class="footer__3__mobile__dropdow">
                <div class="footer__3__mobile__dropdow__btn">
                  <h4>fanpage facebook</h4>
                  <i class="bx bx-chevron-down"></i>
                </div>
                <div class="footer__3__mobile__dropdow__content d-flex justify-content-center mt-3">

                  <div id="fb-root"></div>
                  <script
                    async
                    defer
                    crossorigin="anonymous"
                    src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v17.0"
                    nonce="XYZ123"
                  ></script>

                  <div
                    class="fb-page"
                    data-href="https://www.facebook.com/Shopbethochm"
                    data-tabs="timeline"
                    data-width="340"
                    data-height="200"
                    data-small-header="false"
                    data-adapt-container-width="true"
                    data-hide-cover="false"
                    data-show-facepile="true"
                  >
                    <blockquote
                      cite="https://www.facebook.com/dobothunlanhchobe"
                      class="fb-xfbml-parse-ignore"
                    >
                      <a href="https://www.facebook.com/dobothunlanhchobe"
                        >Nous Vietnam</a
                      >
                    </blockquote>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>

      <hr />

      <div class="footer__4">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-sm-6 d-flex justify-content-start">
              <h2 class="fw-bold">shopbetho.com</h2>
            </div>

            <div class="col-sm-6 justify-content-end">
              <img
                src="https://file.hstatic.net/200000692427/file/bct_1a31754a964c4a5497e1e9edb98515a4.png"
              />
            </div>
          </div>

          <a href="https://www.htechp.com/"> Designed by Htech Performance </a>
        </div>
      </div>

      <nav class="footer__menu__mobile">
        <i class='bx bx-home'></i>
        <i class='bx bx-menu' ></i>
        <i class='bx bx-user' ></i>
        <i class='bx bx-chat' ></i>
      </nav>
    </footer>


    <!-- nút gọi và nút liên hệ -->

    <span class="btn__body__icon">

      <div class="btn__body">
        <p>Hỗ trợ ngay</p>
        <img src="/images/img button body pink.png" />
      </div>

      <div class="btn__body__icon__facebook__daddy">
        <div class="btn__body__icon__facebook__daddy__backgroud"></div>
        <i class="bx bxl-facebook-circle"></i>
      </div>

      <div class="btn__body__icon__mess__daddy">
        <div class="btn__body__icon__mess__daddy__backgroud"></div>
        <i class="bx bxl-messenger"></i>
      </div>

      <div class="btn__body__zalo__daddy">
        <div class="btn__body__zalo__daddy__backgroud"></div>
        <img src="/images/icon zalo.webp" />
      </div>

    </span>

        <script src="/bootstrap/js/bootstrap.js"></script>
        <script src="/bootstrap/js/bootstrap.min.js"></script>
        <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="/js/index.js"></script>

</body>
</html>