<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 조회</title>
</head>
<body>
  <div>
    <h1>회원 조회</h1>

    <form action="/search">
      <input type="text" placeholder="이름으로 검색" name="searchName">
    <button type="submit">검색</button>
  </form>

    <table border="1">

      <thead>
        <th>번호</th>
        <th>이름</th>
        <th>휴대폰 번호</th>
        <th>누적 금액</th>
        <th>등급</th>
        <th>탈퇴</th>
      </thead>

      <tbody>
      <c:if test="${not empty message}" >
        <tr colspan="6">${message}</tr>
      </c:if>

      <c:forEach items="${selectList}" var="member" varStatus="vs">
        <tr>
          <th>${vs.count}</th>
          <td>${member.name}</td>
          <td><a href="/update/member">${member.phone}</a></td>
          <td>${member.amount}</td>

          <c:if test="${member.grade == 0}" >
            <td>일반</td> 
          </c:if>
          <c:if test="${member.grade == 1}" >
            <td>골드</td> 
          </c:if>
          <c:if test="${member.grade == 2}" >
            <td>다이아</td> 
          </c:if>

          <td><button>탈퇴</button></td>
        </tr>
      </c:forEach>
    </tbody>
    </table>
  </div>
</body>
</html>