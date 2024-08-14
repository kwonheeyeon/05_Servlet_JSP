<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 전체 조회</title>
</head>
<body>
  <h1> 회원 전체 조회 </h1>

  <form action="/search">
    <input type="text" placeholder="이름으로 검색" name="searchName">
    <button type="submit">검색</button>
  </form>
  
  <table border="1">
    <thead>
    <tr>
      <th>번호</th>
      <th>이름</th>
      <th>휴대폰 번호</th>
      <th>누적 금액</th>
      <th>등급</th>
      <th>탈퇴</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${memberList}" var="member" varStatus="vs">
      <tr>
        <th id="index">${vs.count}</th>
        <td><a href="/update/member?index=${vs.count-1}">${member.name}</a></td>
        <td>${member.phone}</td>
        <td><a href="/update/amount?index=${vs.count-1}">${member.amount}원</a></td>

        <c:if test="${member.grade == 0}" >
          <td>일반</td> 
        </c:if>
        <c:if test="${member.grade == 1}" >
          <td>골드</td> 
        </c:if>
        <c:if test="${member.grade == 2}" >
          <td>다이아</td> 
        </c:if>

        <td><button id="withdrawalBtn">탈퇴</button></td>
      </tr>
    </c:forEach>
    </tbody>

  </table>

  <a href="/main">돌아가기</a>

  <script src="/resources/js/withdrawal.js"></script>
</body>
</html>