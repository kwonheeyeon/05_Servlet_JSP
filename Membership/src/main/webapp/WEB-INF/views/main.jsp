<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 관리 프로그램</title>

  <link rel="stylesheet" href="/WEB-INF/resources/css/main.css">
</head>
<body>
  <h3>회원 정보</h3>

  <table id="memberList" border="1">
    <thead>
      <th>번호</th>
      <th>이름</th>
      <th>휴대폰 번호</th>
      <th>누적금액</th>
      <th>등급</th>
    </thead>

    <tbody>
      <c:forEach items="${memberList}" var="member" varStatus="vs">
        <tr>
          <th>${vs.count}</th>

          <td>${member.name}</td>
          <td>${member.phone}</td>
          <td>${member.amount}</td>
          <td>${member.grade}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>