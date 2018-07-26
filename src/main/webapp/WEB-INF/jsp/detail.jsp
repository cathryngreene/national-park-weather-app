<%@include file="./common/header.jspf"%>

<div class="parkContainer">
	<div class="parkDetailImage">
		<c:url var="detailImageUrl"
			value="/img/parks/${park.parkCodeLowerCase}.jpg" />
		<img src="${detailImageUrl}" />
	</div>
	<div class="parkDetailContainer">
		<span class="parkDetailName"> <c:out value="${park.parkName}" />
			<br />
		</span>

		<div class="detailColumnContainer">
			<div class="leftDetailColumn">
				<span class="detailLabel">State: </span> <span class="detailValue"><c:out
						value="${park.state}" /></span><br /> <span class="detailLabel">Entry
					Fee: </span> <span class="detailValue"><c:out
						value="$${park.entryFeeFormatted}" /></span><br /> <span
					class="detailLabel">Year Founded: </span> <span class="detailValue"><c:out
						value="${park.yearFounded}" /></span><br /> <span class="detailLabel">Climate:
				</span> <span class="detailValue"><c:out value="${park.climate}" /></span><br />
				<span class="detailLabel">Annual Visitors: </span> <span
					class="detailValue"><c:out
						value="${park.annualVisitorCount}" /></span><br />

			</div>
			<div>
				<span class="detailLabel">Acreage: </span> <span class="detailValue"><c:out
						value="${park.acreage} acres" /></span><br /> <span class="detailLabel">Number
					of Campsites: </span> <span class="detailValue"><c:out
						value="${park.numberOfCampsites}" /></span><br /> <span
					class="detailLabel">Elevation: </span> <span class="detailValue"><c:out
						value="${park.elevationInFeet} feet" /></span><br /> <span
					class="detailLabel">Miles of Trail: </span> <span
					class="detailValue"><c:out
						value="${park.milesOfTrail} miles" /></span><br /> <span
					class="detailLabel">Animal Species: </span> <span
					class="detailValue"><c:out
						value="${park.numberOfAnimalSpecies}" /></span><br />
			</div>
		</div>
		<div class="quoteBlock">
			<span class="parkDetailQuote"> <c:out
					value="${park.inspirationalQuote}" /><br />
			</span> <span class="horizontalDetailSpacer"></span> <span
				class="parkDetailQuoteSource"> <c:out
					value="- ${park.inspirationalQuoteSource}" />
			</span>
		</div>
	</div>
</div>
<div class="detailDescription">
	<span class="parkDescription"><c:out
			value="${park.parkDescription}" /></span>
</div>
<span class="parkDetailName"><c:out value="5-Day Forecast" /></span>
<div class="verticalSpacer"></div>
<c:url var="formAction" value="/detail?parkCode=${park.parkCode}" />
<form method="POST" action="${formAction}">
	<select name="isCelsius">
		<option value="false" ${isCelsius ? '' : 'selected'}>Fahrenheit</option>
		<option value="true" ${isCelsius ? 'selected' : ''}>Celsius</option>
	</select> <input type="submit" name="submit" class="btn btn-success" value="Go" />
</form>

<div class="weatherContainer">
	<c:forEach var="weather" items="${weather}">
		<div class="dailyContainer">
			<div>
				<c:choose>
					<c:when test="${weather.forecast == 'snow' && weather.fiveDayForecastValue == 1}">
						<span class="forecastImgDayOne">
						<c:url var="snowImage" value="/img/weather/snow.png" />
						<img src="${snowImage}" />
						</span>
					</c:when>				
					<c:when test="${weather.forecast == 'snow'}">
						<span class="forecastImg">
						<c:url var="snowImage" value="/img/weather/snow.png" />
						<img src="${snowImage}" />
						</span>
					</c:when>
					<c:when test="${weather.forecast == 'cloudy' && weather.fiveDayForecastValue == 1}">
						<span class="forecastImgDayOne">
						<c:url var="cloudyImage" value="/img/weather/cloudy.png" />
						<img src="${cloudyImage}" />
						</span>
					</c:when>
					<c:when test="${weather.forecast == 'cloudy'}">
						<span class="forecastImg">
						<c:url var="cloudyImage" value="/img/weather/cloudy.png" />
						<img src="${cloudyImage}" />
						</span>
					</c:when>
					<c:when test="${weather.forecast == 'partly cloudy' && weather.fiveDayForecastValue == 1}">
						<span class="forecastImgDayOne">
						<c:url var="partlyCloudyImage" value="/img/weather/partlyCloudy.png" />
						<img src="${partlyCloudyImage}" />
						</span>
					</c:when>					
					<c:when test="${weather.forecast == 'partly cloudy'}">
						<span class="forecastImg">					
						<c:url var="partlyCloudyImage" value="/img/weather/partlyCloudy.png" />
						<img src="${partlyCloudyImage}" />
						</span>
					</c:when>
					<c:when test="${weather.forecast == 'rain' && weather.fiveDayForecastValue == 1}">
						<span class="forecastImgDayOne">
						<c:url var="rainImage" value="/img/weather/rain.png" />
						<img src="${rainImage}" />
						</span>
					</c:when>					
					<c:when test="${weather.forecast == 'rain'}">
						<span class="forecastImg">						
						<c:url var="rainImage" value="/img/weather/rain.png" />
						<img src="${rainImage}" />
						</span>
					</c:when>
					<c:when test="${weather.forecast == 'sunny' && weather.fiveDayForecastValue == 1}">
						<span class="forecastImgDayOne">
						<c:url var="sunnyImage" value="/img/weather/sunny.png" />
						<img src="${sunnyImage}" />
						</span>
					</c:when>						
					<c:when test="${weather.forecast == 'sunny'}">
						<span class="forecastImg">					
						<c:url var="sunnyImage" value="/img/weather/sunny.png" />
						<img src="${sunnyImage}" />
						</span>
					</c:when>
					<c:when test="${weather.forecast == 'thunderstorms' && weather.fiveDayForecastValue == 1}">
						<span class="forecastImgDayOne">
						<c:url var="thunderstormsImage" value="/img/weather/thunderstorms.png" />
						<img src="${thunderstormsImage}" />
						</span>
					</c:when>						
					<c:when test="${weather.forecast == 'thunderstorms'}">
						<span class="forecastImg">					
						<c:url var="thunderstormsImage"
							value="/img/weather/thunderstorms.png" />
						<img src="${thunderstormsImage}" />
						</span>
					</c:when>
				</c:choose>
			</div>
			<c:choose>
				<c:when test="${isCelsius}">
				<span class="weatherHigh">
					<c:out value="High: ${Math.round((weather.high - 32) * (5/9))}°C" /><br />
				</span>	
				<span class="weatherLow">
					<c:out value="Low: ${Math.round((weather.low - 32) * (5/9))}°C" />
				</span>	
				</c:when>
				<c:otherwise>
				<span class="weatherHigh">
					<c:out value="High: ${weather.high}°F" /><br />
				</span>	
				<span class="weatherLow">
					<c:out value="Low: ${weather.low}°F" />	
				</span>	
				</c:otherwise>
			</c:choose>
<div class="verticalSpacer"></div>
			<div class="weatherAvdisory">
				<c:choose>
					<c:when
						test="${weather.high > 75 && weather.fiveDayForecastValue == 1}">
						<c:out value="Bring an extra gallon of water" />
					</c:when>
					<c:when
						test="${weather.low < 20 && weather.fiveDayForecastValue == 1}">
						<c:out value="Warning: frigid temperatures" />
					</c:when>
					<c:when
						test="${(weather.high - weather.low) > 20 && weather.fiveDayForecastValue == 1 }">
						<c:out value="Wear breathable layers" />
					</c:when>
				</c:choose>
				</div>
<div class="verticalSpacer"></div>				
				<div class="weatherAvdisory">
					<c:choose>
						<c:when
							test="${weather.forecast == 'sunny' && weather.fiveDayForecastValue == 1}">
							<c:out value="Pack sunblock" />
						</c:when>
						<c:when
							test="${weather.forecast == 'snow' && weather.fiveDayForecastValue == 1}">
							<c:out value="Pack snowshoes" />
						</c:when>
						<c:when
							test="${weather.forecast == 'rain' && weather.fiveDayForecastValue == 1}">
							<c:out value="Pack raingear and wear waterproof shoes" />
						</c:when>
						<c:when
							test="${weather.forecast == 'thunderstorms' && weather.fiveDayForecastValue == 1 }">
							<c:out value="Seek shelter and avoid hiking on exposed ridges" />
						</c:when>
					</c:choose>
				</div>
		</div>
	</c:forEach>
</div>

<%@include file="./common/footer.jspf"%>