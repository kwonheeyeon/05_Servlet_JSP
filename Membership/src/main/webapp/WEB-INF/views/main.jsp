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
          <td id="amount">${member.amount}</td>

          <c:if test="${member.grade == 0}">
            <td id="common">COMMON</td>
          </c:if>

          <c:if test="${member.grade == 1}">
            <td id="gold">GOLD</td>
          </c:if>

          <c:if test="${member.grade == 2}">
            <td id="diamond">DIAMOND</td>
          </c:if>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <hr>

  <h4>회원 추가</h4>

  <form action="/member/add" method="GET" id="addMember">
    <div>
      <table>
        <tr>
          <td>이름</td>
          <td><input type="text" name="inputName"></td>
        </tr>

        <tr>
          <td>휴대폰 번호</td>
          <td><input type="number" name="inputPhone"></td>
        </tr>

        <tr>
          <td class="btn" colspan="2"><button id="addMember">추가하기</button></td>
        </tr>
      </table>
    </div>
  </form>

  <hr>

  <h4>회원 정보 조회(이름으로 검색)</h4>

  <form action="/member/select" method="GET" id="selectMember">
    <div>
      <table>
        <tr>
          <td>조회할 이름</td>
          <td><input type="text"></td>
        </tr>

        <tr>
          <td class="btn" colspan="2"><button id="selectMember">조회하기</button></td>
        </tr>
      </table>
    </div>
  </form>

  <c:if test="${not empty sessionScope.message}" >
    <script>
      alert("${message}");
    </script>

    <c:remove var="message" scope="session" />
  </c:if>

  <script src="/resources/js/main.js"></script>
</body>
</html>