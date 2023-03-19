<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 쿠키저장 -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.project.product.domain.ProductDTO" %>
<%
   String cp = request.getContextPath();
   request.setCharacterEncoding("UTF-8");
   
   ProductDTO productCookieName = (ProductDTO)request.getAttribute("productDTO");

   //쿠키로 상품명 저장
   //Cookie c = new Cookie("쿠키이름", "쿠키값");
   Cookie c = new Cookie("sname" , URLEncoder.encode( productCookieName.getProductName() , "utf-8"));
   
   //쿠키 유효시간 설정(초단위, 12시간)
   c.setMaxAge(60*60*12);
   //쿠키 추가
   response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- 반응형 기능 -->
   <title>${productDTO.productName}</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
   <link rel="stylesheet" href="/resources/product/productView.css">
   <!-- navbar 클릭시 이동 -->
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="${contextPath}/resources/product/js/animatescroll.js">
</head>
<body>

<!-- 헤더 -->
<jsp:include page="../pageIngredient/header.jsp" flush="false"></jsp:include>

<!--상세페이지 시작-->

  <div class="small-container single-product">
    <div class="row">
    
     <div class="col-2">
        <img id="resultimg" src="${productDTO.storedFileName}" alt="상품 이미지 로딩 실패">
     </div>
     
     
     <div class="col-2">
        <form id="form-cart" action="/cart/cartWrite" method="post">
           <!-- cart에 필요한 데이터 -->
           <input type="hidden" name="userId" value="${memberInfo.userId}" />
           <input type="hidden" name="pno" value="${productDTO.pno}" />
           <h1>${productDTO.productName}</h1>
           <h4><fmt:formatNumber value = "${productDTO.productPrice}" pattern="###,###,###"/>원</h4>
           <input type="number" class="numbox" min="1" max="${productDTO.productStock}" value="1" name="productCnt"/>
           <button type="submit" class="btn"><a style="color: #fff; font-size: 16px;">장바구니<a></button>
           <a href="/order/orderList" class="btn">주문하기</a>
         <h3>배송비 : 3000원</h3>
        </form>
     </div>
     
    </div>
  </div>
  
  
  <div class="small-container">
    <!--navbar-->
    <div class="small-container">
       <div id="navbar">
          <a type="button" onclick="$('.box1').animatescroll();">상품상세정보</a>
          <a type="button" onclick="$('.box2').animatescroll();">리뷰</a>
          <a type="button" onclick="$('.box3').animatescroll();">제품문의</a>
       </div>
   </div>       
   
    <!-- 상품 상세 정보 영역 -->
    <div class="small-container">
       <div class="box1">
            <div class="titlearea">상품상세정보</div>            
              <div>${productDTO.productName}</div>
              <div>${productDTO.productPrice}</div>
              <div>${productDTO.productDescription}</div>
              <fmt:formatDate value = "${productDTO.productRegDate}" pattern="yyyy-MM-dd"/>
         </div>   <!--box1끝-->
       
    <!--리뷰목록-->
       <div class="box2">
          <div class="titlearea">리뷰</div>
            <table class="list" align="center">
               <tr>
                    <th width="80px">제목</th>
                    <th width="80px">상품명</th>
                    <th width="240px">리뷰내용</th>
                    <th width="40px">작성자</th>
                    <th width="80px">등록일</th>
               </tr>
                <c:forEach var = "reviewList" items = "${reviewList}">
                <tr>
                    <td>${reviewList.rvTitle}</td>
                    <td>${reviewList.productName}</td>
                    <td>${reviewList.rvContent}</td>
                    <td>${reviewList.rvWriter}</td>
                    <td><fmt:formatDate value = "${reviewList.rvRegDate}" pattern="yyyy-MM-dd"/></td>
                </tr>
                </c:forEach>
              </table>
              
              <br>
              
              <table class="comment">
                <form id="writeCommentForm">
                  <td width="70%">
                     <div><textarea  name="comment_id"      rows="2" cols="100%"  placeholder="아이디"></textarea></div>
                      <div><textarea  name="comment_title"   rows="2" cols="100%"  placeholder="제목"></textarea></div>                      
                     <div><textarea  name="comment_content"   rows="6" cols="100%"  placeholder="리뷰 내용"></textarea></div>
                 </td>
                  <td width="10%" style="background-color:#FFF; font-size: 20px; font-weight: bold; border-left: 1px solid #b9b9b9;">
                     <div style="text-align:center;"><a href="#" onclick="writeCmt()">등록</a></div>
                 </td>
                </form>
             </table>
          </div>   <!--box2끝-->
          
         <!--제품문의-->
         <div class="box3">
          <div class="titlearea">제품문의</div>
          <table class="list">
              <tr>
                  <th width="40px">번호</th>
                  <th width="80px">제품이름</th>
                  <th width="80px">답변상태</th>
                  <th width="240px">제목</th>
                  <th width="80px">등록일</th>
              </tr>
              <c:forEach var = "inquireList" items = "${inquireList}">
              <tr>
                  <td>${inquireList.askNum}</td>
                  <td>${inquireList.productName}</td>
                  <td>답변완료</td>
                  <td>${inquireList.askTitle}</td>
                  <td><fmt:formatDate value="${inquireList.askRegDate}" pattern="yyyy-MM-dd" /></td>
              </tr>
              </c:forEach>
          </table>
          
          <br>
          
          <table class="comment">
                <form id="writeCommentForm">
                    <input type="hidden" name="comment_num" value=""/>
                   <input type="hidden" name="comment_id" value=""/>
                     <td width="70%">
                        <div><textarea name="comment_id"       rows="2" cols="100%"   placeholder="아이디"></textarea></div>
                      <div><textarea name="comment_title"    rows="2" cols="100%"    placeholder="제목"></textarea></div>                      
                        <div><textarea name="comment_content"    rows="6" cols="100%"    placeholder="문의 내용"></textarea></div>
                    </td>
                     <td width="10%" style="background-color:#FFF; font-size: 20px; font-weight: bold; border-left: 1px solid #b9b9b9;"]>
                        <div style="text-align:center;"><a href="#" onclick="writeCmt()">등록</a></div>
                    </td>
                </form>
             </table>   
         </div>   <!--box3끝-->
      </div>   <!--small-container끝-->
      </div>
    
    <!-- #navbar 상단 고정 -->
    <script>
       window.onscroll = function() {myFunction()};
   
       var navbar = document.getElementById("navbar");
       var sticky = navbar.offsetTop;
   
       function myFunction() {
         if (window.pageYOffset >= sticky) {
           navbar.classList.add("sticky")
         } else {
           navbar.classList.remove("sticky");
         }
       }
    </script>
  <!-- 푸터 -->
  <jsp:include page="../pageIngredient/footer.jsp" flush="false"></jsp:include>
</body>
</html>