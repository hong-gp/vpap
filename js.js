/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  insertMember.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function checkID() {
	var id = newMem.id.value;

	if (id == "")
	{
		alert("아이디를 입력해주세요.");
		newMem.id.focus();
		return;
	}
	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}

function checkValue() {
	if (newMem.id.value == "")
	{
		alert("아이디를 입력해주세요.");
		newMem.id.focus();
		return;
	}
	if (newMem.password.value == "")
	{
		alert("비밀번호를 입력해주세요.");
		newMem.password.focus();
		return;
	}
	if (newMem.name.value == "")
	{
		alert("이름을 입력해주세요.");
		newMem.name.focus();
		return;
	}
	if (newMem.joomin1.value == "")
	{
		alert("주민등록번호 앞자리를 입력해주세요.");
		newMem.joomin1.focus();
		return;
	}
	if (newMem.joomin2.value == "")
	{
		alert("주민등록번호 뒷자리를 입력해주세요.");
		newMem.joomin2.focus();
		return;
	}
	if (newMem.email1.value == "")
	{
		alert("이메일을 입력해주세요.");
		newMem.email1.focus();
		return;
	}
	if (newMem.email2.value == "")
	{
		alert("이메일 뒤를 입력해주세요.");
		newMem.email2.focus();
		return;
	}
	if (newMem.hp1.value == "")
	{
		alert("휴대폰번호 앞자리를 입력해주세요.");
		newMem.id.focus();
		return;
	}
	if (newMem.hp2.value == "")
	{
		alert("휴대폰번호 중간자리를 입력해주세요.");
		newMem.id.focus();
		return;
	}
	if (newMem.hp3.value == "")
	{
		alert("휴대폰번호 뒷자리를 입력해주세요.");
		newMem.id.focus();
		return;
	}
	newMem.submit();
}

function idFocus() {
	newMem.id.focus();
	return;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  login.jsp 및 manager.html 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function login_check()      // 로그인시 미입력항목 부분을 체크해주는 자바스크립트 함수
{
	if(document.login.id.value=="")
	{
    	alert("아이디를 입력해 주세요.");
    	document.login.id.focus();
    	return;	
    }

    if(document.login.password.value=="")
	{
    	alert("비밀번호를 입력해 주세요.");
    	document.login.password.focus();			
    	return;
    }
		
    document.login.submit();
}

function onEnterSubmit()     // 로그인버튼을 클릭하지 않고, 엔터키를 입력하더라도 로그인 가능하게 해줌               
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  login.submit();    //  "keyCode==13"은 엔터키가 입력됨을 의미함
}

function login_focus()     // 폼이 로딩되면  ID를 입력하는 위치에 바로 커서를 위치시켜놓는
{											// 자바스크립트 함수  (body 태그안의 onLoad 이벤트 핸들러에 주목할 것!)
   	document.login.id.focus();
   	return;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  viewDetailContents.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var btn = document.getElementById("wantbtn");

function want()
{
	var frm = document.contents;
	frm.action = "wantContents.jsp";
	frm.submit();
}

function buy()
{
	var frm = document.contents;
	frm.action = "buyContents.jsp";
	frm.submit();
}

function point()
{
	var frm = document.conPoint;
	frm.action = "point.jsp";
	frm.submit();
}
function view()
{
	var frm = document.contents;
	frm.action = "view.jsp";
	frm.submit();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  buyContents.jsp 내에서 사용되는 자바스크립트 코드의 시작부
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function payment()      // 로그인시 미입력항목 부분을 체크해주는 자바스크립트 함수
{
	if(document.payForm.cardNum.value=="")
	{
    	alert("카드번호를 입력해 주세요.");
    	document.payForm.cardNum.focus();
    	return;	
    }

    if(document.payForm.cardPassword.value=="")
	{
    	alert("비밀번호를 입력해 주세요.");
    	document.payForm.cardPassword.focus();			
    	return;
    }
		
    document.payForm.submit();
}