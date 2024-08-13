<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 관리 프로그램</title>

  <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
  <div>
    <div>회원 관리 프로그램</=>

    <div>
      <div><a href="/signUp">회원 가입(추가)</a></button></div>
      <div><a href="/selectList">회원 전체 조회</a></div>
    </div>
  </div>

  <script>
    <c:if test="${not empty message}" >
      alert("${message}");
    </c:if>

    <c:remove var="message" scope="session" />
  </script>
</body>
</html>