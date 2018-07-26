<%@include file="./common/header.jspf"%>

<c:forEach var="park" items="${parks}">
	<div class="parkContainer">
		<div class="parkListImage">
			<c:url var="parkDetailUrl" value="/detail?parkCode=${park.parkCode}" />
			<a href="${parkDetailUrl}"> 
			<c:url var="parkImgUrl" value="/img/parks/${park.parkCodeLowerCase}.jpg" /> 
			<img src="${parkImgUrl}" /> </a>
		</div>
		<div class="parkInfo">
			<c:url var="parkDetailUrl" value="/detail?parkCode=${park.parkCode}" /> 
			<a class="parkName" href="${parkDetailUrl}">
			<c:out value="${park.parkName}" /></a>
			<span class="horizontalSpacer"></span>
			<span class="parkState"><c:out value="|" /></span><span class="horizontalSpacer"></span>
			<span class="parkState">
			<c:out value="${park.state}" />
			<br />
			</span>
			<span class="parkDescription"> 
			<c:out value="${park.parkDescription}" />
			<br />
			</span> 
		</div>
	</div>
	<hr>
</c:forEach>

<%@include file="./common/footer.jspf"%>