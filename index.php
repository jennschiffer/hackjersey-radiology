<!DOCTYPE html>
<html>
<head>

	<title>blah</title>
	
	<link rel="stylesheet" href="style.css" type="text/css" media="screen">	
	
	<?php 
		/* include all files in /function directory */
		include "functions.php";
		
		/* connect to the database */
		hackjerseyConnect();
	?>

</head>

<body>

<div id="container">

	<div id="header">
		<h1>New Jersey Radiology Costs</h1>
		
		<ul id="navigation">
			<li><a href="#filter">See a Price List</a></li>
			<li><a href="#crowdsource">Share Your Radiology Costs</a></li>
			<li><a href="#about">About this App</a></li>
		</ul>
		
		<p> some blurb will go here</p>
	</div>
	
		<?php
			if ( $_POST['submitted'] == "share" ) {
				echo '<div id="success">Thanks for submitting your cost of radiology. Check out what others are paying near you!</div>';
				
				savePrice($_POST['procedure'], $_POST['insurance'], $_POST['provider'], $_POST['address'], $_POST['city'], $_POST['state'], $_POST['zip'], $_POST['phone'], $_POST['website'], $_POST['cost'], $_POST['comments'], $_POST['source'], $_POST['entryDate'], $_POST['ip']);
			}
			else if ( $_POST['submitted'] == "filter" ) {
				echo "hey girl hey";
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
	
	<div id="pricelist">
		<!-- pricelist goes here -->
		
		<?php
			$prices = mysql_query("SELECT * FROM prices");
			$count = mysql_num_rows($prices);
				
			if ($count != 0) { 
				
				echo '<ol>';
				
				while ( $row = mysql_fetch_array($prices)) {
					$id = $row['ID'];
					$procedureID = $row['procedureID'];
					$facilityID = $row['facilityID'];
					$insuranceID = $row['insuranceID'];
					$sourceID = $row['sourceID'];
					$cost = $row['cost'];
					$comments = $row['comments'];
					$ip = $row['IP'];
					
					echo '<ul>
							<li>' . $id . '</li>
							<li>' . getName($procedureID, "procedures") . '</li>';
					
					$facility = getFacility($facilityID); 
					
					echo   '<li><ol>
								<li>' . $facility['name'] . '</li>
								<li>' . $facility['address'] . '</li>
								<li>' . $facility['city'] . '</li>
								<li>' . $facility['state'] . '</li>
								<li>' . $facility['zip'] . '</li>
						    </ol></li>';
					
					echo   '<li>' . $facility['phone'] . '</li>
							<li>' . $facility['website'] . '</li>	
							<li>' . getName($insuranceID, "insurance") . '</li>
							<li>' . getName($sourceID, "sources") . '</li>
							<li>' . $cost . '</li>
							<li>' . $comments . '</li>
							<li>' . $entryDate . '</li>
							<li>' . $ip . '</li>
						  </ul>';
				}
				echo '</ol>';
			}
		?>
		
	</div>
	
	<div id="form">
	
		<form id="crowdsource" method="post">
			
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
				<input type="text" name="provider" id="provider" placeholder="" />
			</p>
			
			<fieldset name="address-fields">
			
	
				<div>
					<label for="address">Address</label>
					<input type="text" name="address" id="address" />
				</div>
				
				<div>
					<label for="city">City *</label>
					<input type="text" name="city" id="city" />
				</div>
				
				<div>
					<label for="state">State</label>
					New Jersey
					<input type="hidden" name="state" value="NJ" />
				</div>
				
				<div>
					<label for="zipcode">Zip Code</label>
					<input type="text" name="zipcode" id="zip" />
				</div>
				
				<div>
					<label for="phone">Phone Number</label>
					<input type="text" name="phone" id="phone" />
				</div>
				
			</fieldset>
			
			<p>
				<label for="website">Website</label>
				<input type="text" name="website" id="website" />
			</p>
	
			
			<p>
				<label for="cost">Procedure Cost *</label>
				<input type="text" name="cost" id="cost" />
			</p>
			
			<p>
				<label for="comments">Comments</label>
				<textarea name="comments" id="comments" ></textarea>
			</p>
			
			<input type="hidden" name="submitted" value="share" />	
			<input type="hidden" name="entryDate" value="<?php echo date('Y-m-d'); ?>" />
			<input type="hidden" name="ip" value="<?php echo $_SERVER["REMOTE_ADDR"]; ?>" />
			<input type="hidden" name="source" value="crowdsource form" />
			<input type="submit" id="share" class="submit" value="Submit" />
		
		</form>
	
	</div>
	
	<div id="about">
		<h3>This application was built on January 27th and 28th, 2013, for <a href="http://hackjersey.com">Hack Jersey</a>!</h3>
		<p>It was built by the team <strong>Ladies Night</strong>: <a href="http://clearhealthcosts.com">ClearHealthCost.com's</a> founder, Jeanne Pinder (former NY Times Journalist), and developer, <a href="http://jennschiffer.com">Jenn Schiffer</a> (Computer Science Department Administrator at Montclair State University).</p>
		
		<p> We &hearts; healthcare cost transparency, the state of New Jersey, Montclair State University, open data, and viewers like you.</p>
	
	</div>
	
</div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="js/places.js"></script>
<script type="text/javascript" src="js/share.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=true"></script>
</body>
</html>