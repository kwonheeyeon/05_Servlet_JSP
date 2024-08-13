<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 정보 수정</title>
</head>
<body>
  <form action="/update/phone" method="GET">
    <h1>회원 정보 수정</h1>

    <div>${name}</div>

    <div><input type="text" name="newPhone" placeholder="${phone}"></div>

    <div>
      <a href="/selectList">목록으로</a>
      <button type="submit">수정</button>
    </div>

    <input type="hidden" name="index" value="${index}">
  </form>
</body>
</html>