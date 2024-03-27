<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<style>
input:not(input[type=submit]){width:100%;}
input[type=submit]{width:100px;}
#goList{width:100px;}

 td{padding: 10px; 
 width: 700px;
 text-align: center;}
 
 td:nth-of-type(1) {
	width: 200px;
}
 td:nth-of-type(2) {
	text-align: left;
}

td:not([colspan]):first-child {
	background: black;
	color: white;
	font-weight: bold; 
}
input[readonly]{
background-color: #D0D0D0;}
</style>
</head>
<body>
 <main>
 <%@include file="/WEB-INF/include/menus.jsp" %>
   <h2>글 정보</h2>
    <table>
     <tr>
     <td>제목</td>
     <td>${ vo.title }</td>
     </tr>
     <tr>
     <td>작성자</td>
     <td>${ vo.writer }</td>
     </tr>
     <tr>
     <td>작성일</td>
     <td>${ vo.regdate }</td>
     </tr>
     <tr>
     <td>조회수</td>
     <td>
     <c:choose>
       <c:when test="${vo.hit ne 0}">
       ${vo['hit'] }
       </c:when>
       <c:otherwise>
       <span style="color:red">없음</span>
       </c:otherwise>
     </c:choose>
     </td>
     </tr>
     <tr>
     <td>내용</td>
     <td>${ vo.content }</td>
     </tr>
     
     <tr>
     <td colspan="2">
     <a class="btn btn-primary btn-sm" role="button" 
     href="/Board/List">게시글목록</a>
     
   
     <a class="btn btn-primary btn-sm" role="button" 
     href="/">Home</a>
     </td>
     </tr>
    </table>
 </main>
 
  <script>
    const goListEl = document.getElementById('goList');
    goListEl.addEventListener('click', function(e){
    	location.href='/Board/List';
    	
    })
  </script>	
</body>
</html>