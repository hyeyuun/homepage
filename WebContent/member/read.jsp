<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/member/ssi.jsp" %>
<jsp:useBean id="vo" class="member.MemberVO"/>
<jsp:setProperty property="*" name="vo"/>    
<%
	String id = (String)session.getAttribute("id");
	vo = dao.read(id);
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
.form-ctl{
	width : 80%;
	height: 34px;
    padding: 6px 12px 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>


</head>
<body>
<jsp:include page="/menu/header.jsp" flush="false"/>
<div class="title"> <span style="color:pink;"><%=vo.getMname() %></span>님의 회원정보 </div>
<!-- start--> 
	<form class="form-horizontal" action="./updateProc.jsp" method="post" name="frm" enctype="multipart/form-data" onsubmit="return inCheck(this)">
		<div class="form-group">
		<table >
			<tr>
				<td colspan="2"> 
					<img src="./storage/<%=vo.getFname()%>" style="width: 500px; height: 380px; margin: 10px;">
				</td>
			</tr>
			<tr>
				<th style="text-align: center; width: 30%;">아 이 디</th>
				<td>
					<span class="col-sm-10">
						<input type="text" class="form-ctl" placeholder="아이디" name="id" value="<%=id%>" readonly="readonly">
					</span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">비밀번호</th>
				<td>
					<span class="col-sm-10">
						<input type="password" class="form-ctl" placeholder="비밀번호" name="passwd" value="<%=vo.getPasswd()%>">
					</span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">비밀번호 확인</th>
				<td>
					<span class="col-sm-10">
						<input type="password" class="form-ctl" placeholder="비밀번호 확인" name="repasswd" value="<%=vo.getPasswd()%>">
					</span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">이&emsp;&emsp;름</th>
				<td>
					<span class="col-sm-10">
						<input type="text" class="form-ctl" placeholder="본명" name="mname" value="<%=vo.getMname()%>">
					</span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">전화번호</th>
				<td>
					<span class="col-sm-10">
						<input type="text" class="form-ctl" placeholder="전화번호(-추가)" name="tel" value="<%=vo.getTel()%>" >
					</span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">이 메 일</th>
				<td>
					<span class="col-sm-10">
						<input type="text" class="form-ctl" placeholder="이메일" name="email" value="<%=vo.getEmail()%>">
					</span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">우편번호</th>
				<td>
					<span class="col-sm-10">
						<input type="text" name="zipcode" class="form-ctl" size="12" maxlength="5" id="sample6_postcode" placeholder="우편번호" value="<%=vo.getZipcode()%>"> 
					</span>
				</td>
			</tr>
			<tr>
				<th style="text-align: center;">주&emsp;&emsp;소</th>
				<td>
					<span class="col-sm-10">
						<input type="text" name="address1" class="form-ctl" size="30" id="sample6_address" placeholder="주소" value="<%=vo.getAddress1()%>"><br>
						<input type="text" name="address2" class="form-ctl" size="30" id="sample6_address2" placeholder="상세주소" value="<%=vo.getAddress2()%>"><br>
					</span>
				</td>
			</tr>
			<TR>
			      <Th style="text-align: center;">직&emsp;&emsp;업 </Th>
			      <td>
			      	<span class="col-sm-10">
				      	<%=vo.getJob()%>
				      	<script type="text/javascript">
      						document.frm.job.value = '<%=vo.getJob()%>'
      					</script>
			      	</span>
			      </td>
    		</TR>
    		
		</table>
	</div>
	<!-- end-->

	<!-- <div class="bottom"> //버튼을 만들지 만들지 고민!! (회원수정,회원탈퇴,사진만수정)
        <button type="submit" class="btn btn-default btn-sm" >
          <span class="glyphicon glyphicon-user"></span> 회원수정 
        </button>
		<button type="button" class="btn btn-default btn-sm" onclick="history.back()">
          <span class="glyphicon glyphicon-remove"></span> 취소
        </button>
	</div> -->
</form>
<jsp:include page="/menu/footer.jsp" flush="false"/>
</body>
</html>