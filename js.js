/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  insertMember.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function checkID() {
	var id = newMem.id.value;

	if (id == "")
	{
		alert("���̵� �Է����ּ���.");
		newMem.id.focus();
		return;
	}
	window.open("checkId.jsp?id="+id,"win", "width=255, height=145, scrollbars=no, resizable=no");
}

function checkValue() {
	if (newMem.id.value == "")
	{
		alert("���̵� �Է����ּ���.");
		newMem.id.focus();
		return;
	}
	if (newMem.password.value == "")
	{
		alert("��й�ȣ�� �Է����ּ���.");
		newMem.password.focus();
		return;
	}
	if (newMem.name.value == "")
	{
		alert("�̸��� �Է����ּ���.");
		newMem.name.focus();
		return;
	}
	if (newMem.joomin1.value == "")
	{
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է����ּ���.");
		newMem.joomin1.focus();
		return;
	}
	if (newMem.joomin2.value == "")
	{
		alert("�ֹε�Ϲ�ȣ ���ڸ��� �Է����ּ���.");
		newMem.joomin2.focus();
		return;
	}
	if (newMem.email1.value == "")
	{
		alert("�̸����� �Է����ּ���.");
		newMem.email1.focus();
		return;
	}
	if (newMem.email2.value == "")
	{
		alert("�̸��� �ڸ� �Է����ּ���.");
		newMem.email2.focus();
		return;
	}
	if (newMem.hp1.value == "")
	{
		alert("�޴�����ȣ ���ڸ��� �Է����ּ���.");
		newMem.id.focus();
		return;
	}
	if (newMem.hp2.value == "")
	{
		alert("�޴�����ȣ �߰��ڸ��� �Է����ּ���.");
		newMem.id.focus();
		return;
	}
	if (newMem.hp3.value == "")
	{
		alert("�޴�����ȣ ���ڸ��� �Է����ּ���.");
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
//  login.jsp �� manager.html ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function login_check()      // �α��ν� ���Է��׸� �κ��� üũ���ִ� �ڹٽ�ũ��Ʈ �Լ�
{
	if(document.login.id.value=="")
	{
    	alert("���̵� �Է��� �ּ���.");
    	document.login.id.focus();
    	return;	
    }

    if(document.login.password.value=="")
	{
    	alert("��й�ȣ�� �Է��� �ּ���.");
    	document.login.password.focus();			
    	return;
    }
		
    document.login.submit();
}

function onEnterSubmit()     // �α��ι�ư�� Ŭ������ �ʰ�, ����Ű�� �Է��ϴ��� �α��� �����ϰ� ����               
{
  	var keyCode = window.event.keyCode;
   	if(keyCode==13)  login.submit();    //  "keyCode==13"�� ����Ű�� �Էµ��� �ǹ���
}

function login_focus()     // ���� �ε��Ǹ�  ID�� �Է��ϴ� ��ġ�� �ٷ� Ŀ���� ��ġ���ѳ���
{											// �ڹٽ�ũ��Ʈ �Լ�  (body �±׾��� onLoad �̺�Ʈ �ڵ鷯�� �ָ��� ��!)
   	document.login.id.focus();
   	return;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  viewDetailContents.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
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
//  buyContents.jsp ������ ���Ǵ� �ڹٽ�ũ��Ʈ �ڵ��� ���ۺ�
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function payment()      // �α��ν� ���Է��׸� �κ��� üũ���ִ� �ڹٽ�ũ��Ʈ �Լ�
{
	if(document.payForm.cardNum.value=="")
	{
    	alert("ī���ȣ�� �Է��� �ּ���.");
    	document.payForm.cardNum.focus();
    	return;	
    }

    if(document.payForm.cardPassword.value=="")
	{
    	alert("��й�ȣ�� �Է��� �ּ���.");
    	document.payForm.cardPassword.focus();			
    	return;
    }
		
    document.payForm.submit();
}