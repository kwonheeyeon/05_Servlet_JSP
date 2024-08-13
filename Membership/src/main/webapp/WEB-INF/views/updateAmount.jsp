<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 금액 누적</title>
</head>
<body>
  <form action="/update/plusAmount" method="GET">
    <h1>금액 누적</h1>

    <div>${name}</div>

    <div>현재 누적 금액 : ${amount}</div>

    <div><input type="number" name="plusAmount" placeholder="추가 누적 금액"></div>

    <div>
      <a href="/selectList">목록으로</a>
      <button type="submit">완료</button>
    </div>

    <input type="hidden" name="index" value="${index}">
  </form>
</body>
</html>