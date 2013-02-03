<?php 

/* include all files in /function directory */
include "functions.php";

/* connect to the database */
hackjerseyConnect();

/* check if this is an API call */
if( function_exists( $_GET['show'] ) ){
	$_GET['show']();
}
else { ?>

<!DOCTYPE html>
<html>
<head>

	<title>The Cost of Radiology in New Jersey - a Hack Jersey Jam</title>
	
	<link rel="stylesheet" href="style.css" type="text/css" media="screen">	

</head>

<body>

<div id="container">

	<div id="header">
		<h1>The Cost of Radiology in New Jersey</h1>
		
		<ul id="navigation">
			<li><a href="#filter">See a Price List</a></li>
			<li><a href="#crowdsource">Share Your Radiology Costs</a></li>
			<li><a href="#api">API documentation</a></li>
			<li><a href="#about">About this App</a></li>
		</ul>
		
		<p>You may or may not have realized how much healthcare procedure costs, especially radiology (MRIs, ultrasounds, mammograms, etc), range throughout small geographical areas. Take a look at how much these procedures cost in New Jersey.</p>
		
		<p><a href="HJLadiesNightassets.pdf">Read our story.</a></p>
	</div>
	
		<?php
		
			$procedureFilter = "Radiology";
			$countyFilter = "all of New Jersey";
			
			if ( $_POST['submitted'] == "share" ) {
				echo '<div id="success">Thanks for submitting your cost of radiology. Check out what others are paying near you!</div>';
				
				savePrice($_POST['procedure'], $_POST['insurance'], $_POST['provider'], $_POST['address'], $_POST['city'], $_POST['state'], $_POST['zip'], $_POST['phone'], $_POST['website'], $_POST['cost'], $_POST['comments'], $_POST['source'], $_POST['entryDate'], $_POST['ip']);
			}
			else if ( $_POST['submitted'] == "filter" ) {
				$procedureFilter = getName($_POST['procedure'], "procedures");
				$countyFilter = getName($_POST['county'], "counties") . " County";
			}
		?>
		
	<div id="filter">
		<form id="filter-prices" method="post">
	
			<p>
				<label for="county">Choose a county: </label>
				<select name="county">
					<?php getDropdownCounties(); ?>
				</select>
			</p>
			
			<p>
				<label for="procedure">Choose a procedure: </label>
				<select name="procedure">
					<?php getDropdownProcedures(); ?>
				</select>
			</p>
			
			<input type="hidden" name="submitted" value="filter" />
			<input type="submit" name="filter" value="Filter Prices" />
		</form>
	</div>
	
	<div id="pricelist" class="section">
		
		<h2><?php echo $procedureFilter; ?> Costs in <?php echo $countyFilter; ?></h2>
		
		<?php
			/* if in county filter, see if Medicare costs exist */
			
			if ( $_POST['submitted'] == "filter") {
			
				// get local from county id
				$locale = getLocale($_POST['county']);
				
				// get price from locale and procedure
				$medicareCost = getMedicareCost($locale,$_POST['procedure']);
				
				if ( $locale == "rest" ) {
					$locale = "rest of";
				}
				
				if ($medicareCost != null) {
					echo '<p id="medicare">The US categorizes ' . getName($_POST['county'], "counties") . ' County as part of <span class="locale">' . $locale . ' Jersey</span>, and so it pays $' . $medicareCost . ' for this procedure. <br /><strong>What are YOU paying?</strong></p>';
				}
				else { /* no medicare data to see here */ }
				
			}
		
		
			$prices = mysql_query("SELECT * FROM prices ORDER BY cost");
			$count = mysql_num_rows($prices);
				
			if ($count != 0) { 
				
				$printedCount == 0;
				
				echo '<p><small>* Prices are sorted from lowest to highest.</small><p>';
				
				echo '<table border="1" cellpadding="10">
						<thead>
							<td>Procedure</td>
							<td>Provider/Facility</td>
							<td>Patient\'s Insurance<br /> Coverage</td>
							<td>Patient\'s Cost</td>
							<td>Patient Comments</td>
						</thead>';
				
				while ( $row = mysql_fetch_array($prices)) {
					$id = $row['ID'];
					$procedureID = $row['procedureID'];
					$facilityID = $row['facilityID'];
					$insuranceID = $row['insuranceID'];
					$sourceID = $row['sourceID'];
					$cost = $row['cost'];
					$comments = $row['comments'];
					
					$facility = getFacility($facilityID); 
					$facilityName = $facility['name']; 
					$facilityAddress = $facility['address']; 
					$facilityCity = $facility['city']; 
					$facilityState = $facility['state']; 
					$facilityZip = $facility['zip']; 
					$facilityPhone = $facility['phone']; 
					$facilityWebsite = $facility['website'];

					$thisCountyID = getCounty($facilityCity);
					
					if ( $_POST['submitted'] == "filter") {
					
						if ( $procedureID == $_POST['procedure'] && $thisCountyID == $_POST['county'] ) {
							// matches filter, so post row
								echo '<tr>
										<td>' . getName($procedureID, "procedures") . '</td>';
													
								echo   '<td>
											<li><strong>' . $facilityName . '</strong></li>
											<li>' . $facilityAddress . '</li>
											<li>' . $facilityCity . ', ' . $facilityState . '</li>
											<li>' . $facilityZip . '</li>
											<li>' . $facilityPhone . '</li>
											<li><a href="' . $facilityWebsite . '">' . $facilityWebsite . '</a></li>
									    </td>';
								
								echo   '<td>' . getName($insuranceID, "insurance") . '</td>
										<td>$' . $cost . '</td>
										<td>' . $comments . '</td>
									  </tr>';

							$printedCount++;
						}
						else { /* doesn't match filter, so don't post row */ }
						
					}
					else {
						echo '<tr>
								<td>' . getName($procedureID, "procedures") . '</td>';
											
						echo   '<td>
									<li><strong>' . $facilityName . '</strong></li>
									<li>' . $facilityAddress . '</li>
									<li>' . $facilityCity . ', ' . $facilityState . '</li>
									<li>' . $facilityZip . '</li>
									<li>' . $facilityPhone . '</li>
									<li><a href="' . $facilityWebsite . '">' . $facilityWebsite . '</a></li>
							    </td>';
						
						echo   '<td>' . getName($insuranceID, "insurance") . '</td>
								<td>$' . $cost . '</td>
								<td>' . $comments . '</td>
							  </tr>';
						
						$printedCount++;
					}
				}
				echo '</table>';
			} else echo "No prices available. Share yours!";
			
			if ($printedCount == 0 ) { echo "<p>No prices available. Share yours!</p>"; }
		?>
		
	</div>
	
	<div id="form" class="section">
	
		<form id="crowdsource" method="post">
		
		<h2>Share Your NJ Radiology Costs</h2>
		
		<small>(* required)</small>
			
			<p>
				<label for="procedure">Procedure *</label>
				<select name="procedure">
					<?php getDropdownProcedures(); ?>
				</select>
			</p>
			
			<p>
				<label for="insurance">Insurance Coverage *</label>
				<select name="insurance">
					<?php getDropdownInsurance(); ?>
				</select>
			</p>
			
			<p>
				<label for="provider">Provider/Doctor *</label>
				<input type="text" class="text" name="provider" id="provider" placeholder="" />
			</p>
			
			<fieldset name="address-fields">
	
				<p>
					<label for="address">Address</label>
					<input type="text" class="text" name="address" id="address" />
				</p>
				
				<p>
					<label for="city">City *</label>
					<input type="text" class="text" name="city" id="city" />
				</p>
				
				<p>
					<label for="state">State: </label>
					<em><strong>New Jersey</strong></em>
					<input type="hidden" name="state" value="NJ" />
				</p>
				
				<p>
					<label for="zipcode">Zip Code</label>
					<input type="text" class="text" name="zipcode" id="zip" />
				</p>
				
				<p>
					<label for="phone">Phone Number</label>
					<input type="text" class="text" name="phone" id="phone" />
				</p>
							
				<p>
					<label for="website">Website</label>
					<input type="text" class="text" name="website" id="website" />
				</p>
				
			</fieldset>

	
			
			<p>
				<label for="cost">Procedure Cost *</label>
				$<input type="text" class="text" name="cost" id="cost" />
			</p>
			
			<p>
				<label for="comments">Comments?</label><br />
				<textarea name="comments" id="comments" ></textarea>
			</p>
			
			<input type="hidden" name="submitted" value="share" />	
			<input type="hidden" name="entryDate" value="<?php echo date('Y-m-d'); ?>" />
			<input type="hidden" name="ip" value="<?php echo $_SERVER["REMOTE_ADDR"]; ?>" />
			<input type="hidden" name="source" value="crowdsource form" />
			<input type="submit" id="share-costs" class="submit" value="Submit" />
		
		</form>
	
	</div>
	
	<div id="api" class="section">
		<h2>Use the API to get the data!</h2>
		
		<p>API call (last updated 2/3/2013): <a href="http://pancaketheorem.com/stuff/hackjersey/?show=radiologyAPI" target="_blank">http://example.com/?show=radiologyAPI</a></p>
		
		<p>In the <em>functions.php</em> file, you'll find everything you need in the <em>radiologyAPI()</em> function, but there is a list of parts of the price object:</p>
		
		<table id="api-definitions" cellpadding="10" border="1">
			<thead>
				<td>price.OBJECT</td><td>description</td>
			</thead>
			
			<tr>
				<td>id</td><td>unique id of each price record</td>
			</tr>
			<tr>
				<td>procedure_id</td><td>unique id of each procedure
			</tr>
			<tr>
				<td>procedure_name</td><td>name of procedure
			</tr>
			<tr>
				<td>facility_id</td><td>unique id of each facility/provider
			</tr>
			<tr>
				<td>facility_name</td><td>name of facility/doctor
			</tr>
			<tr>
				<td>facility_address</td><td>facility street address
			</tr>
			<tr>
				<td>facility_city</td><td>facility city
			</tr>
			<tr>
				<td>facility_state</td><td>facility state
			</tr>
			<tr>
				<td>facility_zip</td><td>facility zip code
			</tr>
			<tr>
				<td>facility_phone</td><td>facility phone number
			</tr>
			<tr>
				<td>facility_website</td><td>url of facility website
			</tr>
			<tr>
				<td>insurance_id</td><td>unique id of each insurance status
			</tr>
			<tr>
				<td>insurance_name</td><td>name or status of procedure insurance coverage
			</tr>
			<tr>
				<td>source_id</td><td>unique id of each source
			</tr>
			<tr>
				<td>source_name</td><td>where this record came from (imported by us, crowdsource form, etc)
			</tr>
			<tr>
				<td>cost</td><td>the cost of this record's procedure
			</tr>
			<tr>
				<td>comments</td><td>user-submitted comments
			</tr>
			<tr>
				<td>entry_date</td><td>date that this price was entered
			</tr>
			<tr>
				<td>ip</td><td>IP address of person who submitted this price
			</tr>
		</table>
		
		<p>In the works: return data with latitude, longitude, county, and Medicare-coined locale.<br />Also, optimize API call to allow filtering of return data.</p>
		
		<h3>Example use with jQuery:</h3>
		
<code><pre>$(document).ready(function(){
	var procedures = "http://pancaketheorem.com/stuff/hackjersey/?show=radiologyAPI";
	$.getJSON(procedures, function(data){
		$('#example').append('&lt;li>A(n) "' + price.procedure_name + '" at ' + price.facility_name + ' costs $' + price.cost + '.&lt;/li>');
		});
	});
});</pre></code>	

<div id="example"></div>		

	
	</div>
	
	<div id="about" class="section">
		<h2>This application was built on January 27th and 28th, 2013, for <a href="http://hackjersey.com">Hack Jersey</a>!</h2>
		<p>It was built by the team <strong>Ladies Night</strong>: 
			<ol>
				<li>Concept and reporting: Jeanne Pinder (former NY Times Journalist and founder of <a href="http://clearhealthcosts.com">ClearHealthCost.com</a>)</li>
				<li>Design and engineering: <a href="http://jennschiffer.com">Jenn Schiffer</a> (Computer Science Department Administrator at Montclair State University and software engineer).</li>
			</ol>
		</p>
		
		<p> We &hearts; healthcare cost transparency, the state of New Jersey, Montclair State University, open data, and viewers like you.</p>
	
	</div>
	
</div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<!-- <script type="text/javascript">
$(document).ready(function(){
	var procedures = "http://pancaketheorem.com/stuff/hackjersey/?show=radiologyAPI";
	$.getJSON(procedures, function(data){
		$.each(data, function(i,price){
		    $('#example').append('<li>A(n) "' + price.procedure_name + '" at ' + price.facility_name + ' costs $' + price.cost + '.</li>');
		});
	});
});
</script> -->

<script type="text/javascript" src="js/places.js"></script>
<script type="text/javascript" src="js/share.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=true"></script>

<script src="//pmetrics.performancing.com/js" type="text/javascript"></script>
<script type="text/javascript">try{ clicky.init(19765); }catch(e){}</script>
<noscript><p><img alt="Performancing Metrics" width="1" height="1" src="//pmetrics.performancing.com/19765ns.gif" /></p></noscript>
</body>
</html>

<?php } // end API call ?>