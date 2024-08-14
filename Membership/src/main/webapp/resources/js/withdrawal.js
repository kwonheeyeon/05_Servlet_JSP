const index = document.querySelector("#index") - 1;

const withdrawalBtn = document.querySelector("#withdrawalBtn");
withdrawalBtn.addEventListener("click", () => {
  
  if(confirm("정말로 탈퇴하시겠습니까?")){
    alert("탈퇴되었습니다");
    location.href="/withdrawlMember?index=" + index;
  }else{
    alert("탈퇴 취소");
  }

});