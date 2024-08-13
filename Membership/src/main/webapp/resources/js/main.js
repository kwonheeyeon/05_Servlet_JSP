const addMember = document.querySelector("#addMember");
const inputName = document.querySelector("[name=inputName]");
const inputPhone = document.querySelector("[name=inputPhone]");

addMember.addEventListener("submit", e => {
  // 입력 값 가져와서 양쪽 공백 제거
  const name = inputName.value.trim();
  const phone = inputPhone.value.trim();


  if(name.length == 0 || phone.length == 0){
    e.preventDefault(); // form 제출 이벤트 막기

    alert("이름과 휴대폰 번호를 둘 다 입력해주세요");
    name.focus();
  }
});