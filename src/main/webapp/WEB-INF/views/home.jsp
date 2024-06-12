<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<c:if test="${not empty msg}">
     <script>alert("${msg}");</script>
</c:if>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<title>Green Cycle</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

<link rel="stylesheet" href="assets/css/templatemo-hexashop.css">

<link rel="stylesheet" href="assets/css/owl-carousel.css">

<link rel="stylesheet" href="assets/css/lightbox.css">

<link rel="stylesheet" href="assets/css/">
<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
</head>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>


<!-- 나눔 Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>





<!-- 중고 물품 슬릭슬라이더 추가 -->
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

    <!-- Owl Carousel JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>




<body>
   <jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

      <!-- ***** 중고 물품 영역 ***** -->
<section class="section" id="sharing_stuff">
         <!-- <div class="col-lg-6"> -->
               <div class="section-heading">
                  <h2>중고장터</h2>
<!--                   <span>사용하지않는 물품을 판매/나눔하는 공간입니다.</span> -->
               </div>
            <!-- </div> -->
         </div>
      </div>
      <div class="container">
         <div class="row">
            <div class="col-lg-12" style="transform: translate(-14px, -40px);">
               <div class="sharing_stuff-item-carousel">
                  <div class="owl-sharing_stuff-item owl-carousel">
                  <c:forEach items="${sellList}" var="sell">
                     <div class="item" onclick="window.location.href='<c:url value="/sellDetail?salesNo=${sell.salesNo}" />'">
                        <div class="thumb">
<!--                            <div class="hover-content"> -->
<!--                               <ul> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-eye"></i> -->
<!--                                     </a></li> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-star"></i> -->
<!--                                     </a></li> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-shopping-cart"></i> -->
<!--                                     </a></li> -->
<!--                               </ul> -->
<!--                            </div> -->
                           
<img src="${pageContext.request.contextPath}${sell.salesImage }" alt="판매 이미지">                        </div>
                        <div class="down-content">
                            <h4 class="text-center">${sell.salesName }</h4>
                           <span class="text-center">${sell.salesPrice }원</span>
                     </div>
                   
                     </div>
                       </c:forEach>
                     
<!--                      <div class="item"> -->
<!--                         <div class="thumb"> -->
<!--                            <div class="hover-content"> -->
<!--                               <ul> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-eye"></i> -->
<!--                                     </a></li> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-star"></i> -->
<!--                                     </a></li> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-shopping-cart"></i> -->
<!--                                     </a></li> -->
<!--                               </ul> -->
<!--                            </div> -->
<!--                            <img src="assets/images/파도.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="down-content"> -->
<!--                          <h4 class="text-center">나눔물품</h4> -->
<!--                            <span class="text-center">2000원</span> -->
<!--                         </div> -->
<!--                      </div> -->
<!--                      <div class="item"> -->
<!--                         <div class="thumb"> -->
<!--                            <div class="hover-content"> -->
<!--                               <ul> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-eye"></i> -->
<!--                                     </a></li> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-star"></i> -->
<!--                                     </a></li> -->
<!--                                  <li><a href="single-product.jsp"> -->
<!--                                        <i class="fa fa-shopping-cart"></i> -->
<!--                                     </a></li> -->
<!--                               </ul> -->
<!--                            </div> -->
<!--                            <img src="assets/images/파도.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="down-content"> -->
<!--                          <h4 class="text-center">나눔물품</h4> -->
<!--                            <span class="text-center">2000원</span> -->
<!--                         </div> -->
<!--                      </div> -->
                     <div class="item">
                        <div class="thumb">
                           <div class="hover-content">
                              <ul>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-eye"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-star"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-shopping-cart"></i>
                                    </a></li>
                              </ul>
                           </div>
                            <img src="assets/images/파도.jpg" alt="">
                        </div>
                        <div class="down-content">
                           <h4 class="text-center" >나눔물품</h4>
                           <span class="text-center">2000원</span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- ***** used_goods Area Ends ***** -->

      <!--나눔 물품 영역 -->
   <section class="section" id="sharing_stuff">
         <!-- <div class="col-lg-6"> -->
               <div class="section-heading">
                  <h2>나눔 물품</h2>
                  <span>사용하지않는 물품을 나눔하는 공간입니다.</span>
               </div>
            <!-- </div> -->
      
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="sharing_stuff-item-carousel">
                  <div class="owl-sharing_stuff-item owl-carousel">
                     <div class="item">
                        <div class="thumb">
                           <div class="hover-content">
                              <ul>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-eye"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-star"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-shopping-cart"></i>
                                    </a></li>
                              </ul>
                           </div>
                           <img src="assets/images/파도.jpg" alt="">
                        </div>
                        <div class="down-content">
                            <h4 class="text-center">나눔물품</h4>
                           <span class="text-center">2000원</span>
                     </div>
                     </div>
                     <div class="item">
                        <div class="thumb">
                           <div class="hover-content">
                              <ul>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-eye"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-star"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-shopping-cart"></i>
                                    </a></li>
                              </ul>
                           </div>
                           <img src="assets/images/파도.jpg" alt="">
                        </div>
                        <div class="down-content">
                         <h4 class="text-center">나눔물품</h4>
                           <span class="text-center">2000원</span>
                        </div>
                     </div>
                     <div class="item">
                        <div class="thumb">
                           <div class="hover-content">
                              <ul>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-eye"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-star"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-shopping-cart"></i>
                                    </a></li>
                              </ul>
                           </div>
                           <img src="assets/images/파도.jpg" alt="" >
                        </div>
                        <div class="down-content">
                         <h4 class="text-center">나눔물품</h4>
                           <span class="text-center">2000원</span>
                        </div>
                     </div>
                     <div class="item">
                        <div class="thumb">
                           <div class="hover-content">
                              <ul>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-eye"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-star"></i>
                                    </a></li>
                                 <li><a href="single-product.jsp">
                                       <i class="fa fa-shopping-cart"></i>
                                    </a></li>
                              </ul>
                           </div>
                            <img src="assets/images/파도.jpg" alt="">
                        </div>
                        <div class="down-content">
                           <h4 class="text-center">나눔물품</h4>
                           <span class="text-center">2000원</span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- ***** used_goods Area Ends ***** -->

   <!-- ***** Explore Area Starts ***** -->
   <section class="section" id="explore">

                  <h2>About Us</h2>
               
</section>
   <!-- ***** Explore Area Ends ***** -->

   <!-- ***** 소셜 미디어 부분 ***** -->
   <section class="section" id="social">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-heading">
                  <h2>소셜 미디어</h2>
                  <span> Hexashop</span>
               </div>
            </div>
         </div>
      </div>
      
   </section>
   <!-- ***** 소셜 미디어 Ends ***** -->

   <!-- ***** Subscribe Area Starts ***** -->
   <jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

   <!-- jQuery -->
   <script src="assets/js/jquery-2.1.0.min.js"></script>
   <!-- 나눔 jQuery (필요한 경우) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
   <!-- Bootstrap -->
   <script src="assets/js/popper.js"></script>
   <script src="assets/js/bootstrap.min.js"></script>

   <!-- Plugins -->
   <script src="assets/js/owl-carousel.js"></script>
   <script src="assets/js/accordions.js"></script>
   <script src="assets/js/datepicker.js"></script>
   <script src="assets/js/scrollreveal.min.js"></script>
   <script src="assets/js/waypoints.min.js"></script>
   <script src="assets/js/jquery.counterup.min.js"></script>
   <script src="assets/js/imgfix.min.js"></script>
   <script src="assets/js/slick.js"></script>
   <script src="assets/js/lightbox.js"></script>
   <script src="assets/js/isotope.js"></script>

   <!-- Global Init -->
   <script src="assets/js/custom.js"></script>
   <script>

   
      $(function() {
         var selectedClass = "";
         $("p").click(function() {
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
            $("#portfolio div").not("." + selectedClass).fadeOut();
            setTimeout(function() {
               $("." + selectedClass).fadeIn();
               $("#portfolio").fadeTo(50, 1);
            }, 500);

            
         });
      });
   </script>      
   
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<!-- Slick JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
   <script>
       $(document).ready(function() {
           var owl = $('.owl-sharing_stuff-item');
           owl.owlCarousel({
               items: 3,
               loop: true,
               margin: -50,
               nav: false,
               dots: false
           });       
           $('.custom-prev-btn').click(function() {
               owl.trigger('prev.owl.carousel');
           });       
           $('.custom-next-btn').click(function() {
               owl.trigger('next.owl.carousel');
           });
       });
   </script>


    

</body>
</html>