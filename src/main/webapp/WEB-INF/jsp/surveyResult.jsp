<%@include file="./common/header.jspf"%>

<span class="surveyResultHeadline">
<c:out value="Favorite Park Survey Results" /><br />
</span>
<span class="verticalSpacer"></span>
<table>	

	<c:forEach var="rankednames" items="${rankednames}">
	<tr>
		<td>	
		<span class="surveyResultImg">
			<c:url var="parkImgUrl" value="/img/parks/${rankednames.parkCodeLowerCase}.jpg" /> 
			<img src="${parkImgUrl}" />
		</span>	
		</td>
		<td>	
		<span class="surveyLabel">
			<c:out value="${rankednames.parkName}" />
		</span>
		<span class="horizontalDetailSpacer"></span>	
		</td>
		<td>	
		<span class="surveyLabelRank">
		<c:choose>
		<c:when test="${rankednames.ranking == 1}">		
			<c:out value="${rankednames.ranking} vote" />
		</c:when>
		<c:otherwise>
			<c:out value="${rankednames.ranking} votes" />
		</c:otherwise>
		</c:choose>
		</span>
		</td>
		</tr>
			
	</c:forEach>	

	
</table>


<%@include file="./common/footer.jspf"%>