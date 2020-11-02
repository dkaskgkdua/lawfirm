<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<jsp:include page="../common/header.jsp" />


<style>
body {
	padding-top: 70px;
}

#login {
	width: 40%;
	border: 1px solid lightgray;
	padding: 20px;
	margin-top: 80px;
	margin-bottom: 200px;
}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />

	<div id="login" class="container">
		<form method="post" action="/hansong/authenticate">
			<fieldset>
				<legend> 로그인</legend>
				<div class="form-group">
					<label for="email">이메일</label> <input type="email"
						class="form-control" placeholder="Enter email" id="email"
						name="email" required>
				</div>
				<div class="form-group">
					<label for="pwd">비밀번호</label> <input type="password"
						class="form-control" placeholder="Enter password" id="pwd"
						name="pwd" required>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input
						class="form-check-input" id="saveCheck" type="checkbox">
						Remember me
					</label>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">로그인</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/hansong/members/joinform'">회원가입
					</button>
				</div>

				<div class="form-group">
					<div id="google-login">
						<button type="submit" class="btn btn-primary">구글계정으로 로그인</button>
					</div>
				</div>
				<div class="form-group">
					<a id="kakao-login-btn"></a>
				</div>
			</fieldset>
		</form>
		<form style="display: none" id="frmOauthLgoin" method="post"
			action="/hansong/authenticate">
			<input type="hidden" class="form-control" placeholder="Enter email"
				id="oauthEmail" name="email" required> <input type="hidden"
				class="form-control" placeholder="Enter password" id="oauthPwd"
				name="pwd" required>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp" />
	<script>

    $(function () {
        const loginform = {
            init : function () {	
            const _this = this;
            
                // 카카오 로그인
                common.gfn_getAuthKey("kakao", _this.kakaoInit);
            },

            kakaoInit : function(key) {
                Kakao.init(key);
                // 카카오 로그인 버튼을 생성합니다.
                Kakao.Auth.createLoginButton({
                    container: '#kakao-login-btn',
                    success: function (authObj) {
                       Kakao.API.request({
                           url : '/v2/user/me',
                           // 로그인 성공 시
                           success : function (res) {

                               $.ajax({
                                   url : common.gfn_getContextPath()+"/members/idCheck",
                                   data : {"email" : res.id
                                          , "name" : res.properties.nickname},
                                   cache : false,
                                   dataType : "json",
                                   method : "GET",
                                   async : false
                               })
                                   .done(function (rdata) {
                                       if(rdata == -2) { // 문제발생
                                           this.fail();
                                       } else { // 로그인 로직 태움
                                           $("#oauthEmail").val(res.id);
                                           $("#oauthPwd").val(res.id);
                                           $("#frmOauthLgoin").submit();
                                           // 카카오 로그아웃
                                           Kakao.API.request({
                                               url : "/v1/user/logout",
                                               success : function (res) {
                                                   //alert(res.id + "로그아웃 성공");
                                               },
                                               fail : function () {
                                                   //alert("로그아웃 실패");
                                               }
                                           })
                                       }
                                   })
                                   .fail(function (xhr, status, errorThrown) {
                                       common.gfn_alert('alert','알림','카카오 로그인 중 에러가 발생했습니다. 관리자에게 문의해주세요.'
                                                        ,'small', null, false, true);
                                   });
                           },
                           fail : function (error) {
                                alert(JSON.stringify(error));
                           }
                       })

                    },
                    fail: function (err) {
                        alert(JSON.stringify(err));
                    }
                });
            }
            
            // 구글 로그인
        }

        
        
        
        // 아이디 저장하기
        $(document).ready(function(){
        	 
            // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
            var key = getCookie("key");
            $("#email").val(key); 
             
            if($("#email").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
                $("#saveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
            }
             
            $("#saveCheck").change(function(){ // 체크박스에 변화가 있다면,
                if($("#saveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
                    setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
                }else{ // ID 저장하기 체크 해제 시,
                    deleteCookie("key");
                }
            });
             
            // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
            $("#email").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
                if($("#saveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                    setCookie("key", $("#email").val(), 7); // 7일 동안 쿠키 보관
                }
            });
        });
         
        function setCookie(cookieName, value, exdays){
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }
         
        function deleteCookie(cookieName){
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
        }
         
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if(start != -1){
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
        
        loginform.init();

    })
</script>
</body>
</html>