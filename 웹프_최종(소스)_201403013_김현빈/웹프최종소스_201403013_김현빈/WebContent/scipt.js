function inputCheck() {
	if (document.regFrm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return false;
	} else	if (document.regFrm.passwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.pass.focus();
		return false;
	} else 	if (document.regFrm.repass.value == "") {
		alert("비밀번호를 확인해 주세요.");
		document.regFrm.repass.focus();
		return false;
	} else 	if (document.regFrm.passwd.value != document.regFrm.repass.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repass.value = "";
		document.regFrm.repass.focus();
		return false;
	} else 	if (document.regFrm.name.value == "") {
		alert("이름을 입력해 주세요.");
		document.regFrm.name.focus();
		return false;
	} else 	if (document.regFrm.address.value == "") {
		alert("주소를 입력해 주세요.");
		document.regFrm.address.focus();
		return false;
	} else 	if (document.regFrm.address.value == "") {
		alert("전화번호를 입력해 주세요.");
		document.regFrm.address.focus();
		return false;
	} else {
		document.regFrm.submit();
	}
}
function win_close() {
	self.close();
}