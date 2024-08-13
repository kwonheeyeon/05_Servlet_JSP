<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 가입(추가)</title>
</head>
<body>
  <div>

    <h1>회원 가입 추가</h1>

    <form action="/addMember" method="POST">
      <div>
        <div><input type="text" name="inputName" placeholder="이름"></div>
        <div><input type="text" name="inputPhone" placeholder="휴대폰 번호(-제외)"></div>
      </div>

      <div>
        <a href="/main">돌아가기</a>
        <button type="submit">가입하기</button>
      </div>
    </form>

  </div>
</body>
</html>