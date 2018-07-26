<%@include file="./common/header.jspf"%>

<c:url var="surveyUrl" value="/survey" />
<form action="${surveyUrl}" method="POST">

	<div class="formContainer">

		<div class="formSpacerBlock"></div>

		<div class="formLabel">
			<label for="parkname">Select Your Favorite Park:</label> <select
				name="parkname" id="parkname">
				<option value="CVNP">Cuyahoga Valley National Park</option>
				<option value="ENP">Everglades National Park</option>
				<option value="GCNP">Grand Canyon National Park</option>
				<option value="GNP">Glacier National Park</option>
				<option value="GSMNP">Great Smoky Mountains National Park</option>
				<option value="GTNP">Grand Teton National Park</option>
				<option value="MRNP">Mount Rainer National Park</option>
				<option value="RMNP">Rocky Mountain National Park</option>
				<option value="YNP">Yellowstone National Park</option>
				<option value="YNP2">Yosemite National Park</option>
			</select>
		</div>

		<div class="formSpacerBlock"></div>

		<div class="formLabel">
			<label for="email">Email Address:</label> <input type="text"
				name="email" id="email" size="25" required/>
		</div>

		<div class="formSpacerBlock"></div>

		<div class="formLabel">
			<label for="state">Select Your State of Residence:</label> <select
				name="state" id="state">
				<option value="Alabama">Alabama</option>
				<option value="Alaksa">Alaska</option>
				<option value="Arizona">Arizona</option>
				<option value="Arkansas">Arkansas</option>
				<option value="California">California</option>
				<option value="Colorado">Colorado</option>
				<option value="Connecticut">Connecticut</option>
				<option value="Delaware">Delaware</option>
				<option value="Florida">Florida</option>
				<option value="Georgia">Georgia</option>
				<option value="Hawaii">Hawaii</option>
				<option value="Idaho">Idaho</option>
				<option value="Illinois">Illinois</option>
				<option value="Indiana">Indiana</option>
				<option value="Iowa">Iowa</option>
				<option value="Kansas">Kansas</option>
				<option value="Kentucky">Kentucky</option>
				<option value="Louisiana">Louisiana</option>
				<option value="Maine">Maine</option>
				<option value="Massachutsetts">Massachutsetts</option>
				<option value="Michigan">Michigan</option>
				<option value="Minnesota">Minnesota</option>
				<option value="Mississipi">Mississipi</option>
				<option value="Missouri">Missouri</option>
				<option value="Montana">Montana</option>
				<option value="Nebraska">Nebraska</option>
				<option value="Nevada">Nevada</option>
				<option value="New Hampshire">New Hampshire</option>
				<option value="New Jersey">New Jersey</option>
				<option value="New York">New York</option>
				<option value="North Carolina">North Carolina</option>
				<option value="North Dakota">North Dakota</option>
				<option value="Ohio">Ohio</option>
				<option value="Oklahoma">Oklahoma</option>
				<option value="Oregon">Oregon</option>
				<option value="Pennsylvania">Pennsylvania</option>
				<option value="Rhode Island">Rhode Island</option>
				<option value="South Carolina">South Carolina</option>
				<option value="South Dakota">South Dakota</option>
				<option value="Tennessee">Tennessee</option>
				<option value="Teaxs">Texas</option>
				<option value="Utah">Utah</option>
				<option value="Vermont">Vermont</option>
				<option value="Virginia">Virginia</option>
				<option value="Washington">Washington</option>
				<option value="West Virginia">West Virginia</option>
				<option value="Wisconsin">Wisconsin</option>
				<option value="Wyoming">Wyoming</option>
			</select>
		</div>

		<div class="formSpacerBlock"></div>

		<div class="formLabel">
			<label for="activitylevel">Select Your Activity Level:</label> <select
				name="activitylevel" id="activitylevel">
				<option value="inactive">Inactive</option>
				<option value="sedentary">Sedentary</option>
				<option value="active">Active</option>
				<option value="extremelyactive">Extremely Active</option>
			</select>
		</div>
		<div class="spacerBlock"></div>

		<div class="endFormContainer">
			<div>
				<input type = "hidden" name="submit" id="submit">
				<input class="formSubmitButton" type="submit" value="Submit" /><br />
			</div>
		</div>

	</div>
</form>

<%@include file="./common/footer.jspf"%>

