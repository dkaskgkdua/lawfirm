<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>법무법인 송한</title>
<jsp:include page="../common/header.jsp" />
<style>
.big_tab ul {
	overflow: hidden;
	width: 900px;
}

.big_tab ul li {
	width: 25%;
	box-sizing: border-box;
	float: left;
	list-style-type: none;
	border: 1px solid #ccc;
	text-align: center;
	line-height: 40px;
}

.big_tab ul li.activeClass {
	font-weight: bold;
	font-size: 20px;
	border-bottom-color: white ;
}

.sm_select {
	display: none;
}

.sm_select select {
	width: 100%;
	height: 40px;
}

@media ( max-width :500px) {
	.sm_select {
		display: block;
	}
	.big_tab {
		display: none;
	}
}

.tab-contents{
    margin-top: 50px;
    margin-bottom: 200px;
}

.page-link{
	color: navy !important;
}

.paging{
	justify-content: center;
    display: flex;
	margin-top: 50px;
}

</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/hansong/resources/images/lawyer.jpg"
					style="height: 250px; width: 2200px;">
				<div class="container">
					<div class="carousel-caption text-left">
						<h1 style="font-weight: bold; font-size: 25px; color:white;">
														LAW FIRM SONGHAN</h1>
						<br>
						<p style="font-weight: bold; color:white; margin-top: 30px;">
													의뢰인 중심 법률 서비스, 여기는 법무법인 한송입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="tabmenu">
		<div class="big_tab">
			<ul>
				<li><a href="#tab01">온라인상담</a></li>
			</ul>
		</div>
		<div class="sm_select">
			<select name="" id="tabmenu">
				<option value="#tab01">온라인상담</option>
			</select>
		</div>
	</div>

	<div id="tab01" class="tab-contents">
	<div class="container">
  <h2 style="font-size: 30px;
    font-weight: bold;">온라인상담</h2>
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td style="width: 70px">31</td>
        <td style="width: 400px">변호사님 궁금한게 있습니다.</td>
        <td style="width: 50px">20.07.30</td>
        <td style="width: 100px; color: #d43f3a">대기중</td>
      </tr>
      	<tr>
        <td>30</td>
        <td>이게 죄가 성립될까요??</td>
        <td>20.10.30</td>
        <td style="color: #d43f3a">대기중</td>
      	</tr>
       <tr>
        <td>29</td>
        <td>고소하고자 합니다. 도와주세요.</td>
        <td>20.10.29</td>
        <td style="color: #0094ff">상담완료</td>
      </tr>
       <tr>
        <td>28</td>
        <td>고소당했습니다. 어떻게 해야할까요...?</td>
        <td>20.10.28</td>
        <td style="color: #0094ff">상담완료</td>
      </tr>
      <tr>
        <td>27</td>
        <td>하 인생....</td>
        <td>20.10.28</td>
        <td style="color: #0094ff">상담완료</td>
      </tr>
    </tbody>
  </table>
</div>

<div class="container paging">
<ul class="pagination">
  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">Next</a></li>
</ul>
</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>

