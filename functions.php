<?php 
/**
*	HackJersey Functions
*	@author Jenn Schiffer
*	@version 0.1
*	@package hackjersey
*/

/**
* Connects to the mysql database
*/
function hackjerseyConnect() {
	
	$link = mysql_connect('localhost', 'root', 'root');
	if (!$link) {
		die('Could not connect to mysql: ' . mysql_error());
	}
	
	$hackjerseyDatabase = mysql_select_db("hackjersey", $link);
	if (!$hackjerseyDatabase) {
		die('Could not reach database: ' . mysql_error());
	}
}

/**
* Get the names of different table fields
*/
function getName($id, $table) {
	$list = mysql_query("SELECT * FROM $table WHERE `ID` = $id");
	$count = mysql_num_rows($list);
	if ($count == 1) { 
		while ( $row = mysql_fetch_array($list)) {
			$name = $row['name'];				
		}
	}
	else echo "multiple id error - procedures";
	return $name;
}

/**
* Get the information about a facility and return array of it
*/
function getFacility($id) {
	$facilities = mysql_query("SELECT * FROM facilities WHERE `ID` = $id");
	$count = mysql_num_rows($facilities);
	if ($count == 1) { 
		while ( $row = mysql_fetch_array($facilities)) {
			$name = $row['name'];
			$address = $row['address'];
			$city = $row['city'];
			$state = $row['state'];
			$zip = $row['zip'];
			$phone = $row['phone'];
			$website = $row['website'];
		}
		
		$facility = array( 
			"name" => $name,
			"address" => $address,
			"city" => $city,
			"state" => $state,
			"zip" => $zip,
			"phone" => $phone,
			"website" => $website
    	);
	}
	else echo "multiple id error - " . $count . "facilities";
	return $facility;
}

/**
* Get dropdown selector of all procedures
*/
function getDropdownProcedures() {
	$procedures = mysql_query("SELECT * FROM procedures");
	$count = mysql_num_rows($procedures);
	if ($count != 0) { 
		while ( $row = mysql_fetch_array($procedures)) {
			$id = $row['ID'];
			$name = $row['name'];
			echo '<option value="' . $id . '">' . $name . '</option>';
		}
	}
	else echo "no data error - procedures";
}

/**
* Get dropdown selector of all insurance options
*/
function getDropdownInsurance() {
	$insuranceStatuses = mysql_query("SELECT * FROM insurance");
	$count = mysql_num_rows($insuranceStatuses);
	if ($count != 0) { 
		while ( $row = mysql_fetch_array($insuranceStatuses)) {
			$id = $row['ID'];
			$name = $row['name'];
			echo '<option value="' . $id . '">' . $name . '</option>';
		}
	}
	else echo "no data error - insurance statuses";
}

/**
* Save price to database
*/
function savePrice($procedureID, $insuranceID, $provider, $address, $city, $state, $zip, $phone, $website, $cost, $comments, $source, $entryDate, $ip) {

	// get facility ID or create new one
	$facilities = mysql_query("SELECT * FROM facilities WHERE `name` = '$provider' AND `city` = '$city'");
	$count = mysql_num_rows($facilities);
	if ($count == 0) {
		saveFacility($provider, $address, $city, $state, $zip, $phone, $website);
		$facilityID = mysql_query("SELECT LAST_INSERT_ID()");
	}
	else {
		while ( $row = mysql_fetch_array($facilities) ) {
			$facilityID = $row['ID'];
		}
	}
		
	// get source ID
	$sources = mysql_query("SELECT * FROM sources WHERE `name` = '$source'");
	$count = mysql_num_rows($sources);
	if ($count == 1) { 
		while ( $row = mysql_fetch_array($sources) ) {
			$sourceID = $row['ID'];
		}
	}
	else echo "no data error - source ";

	
	mysql_query("INSERT INTO prices (`procedureID`, `facilityID`, `insuranceID`, `sourceID`, `cost`, `comments`, `entryDate`, `IP`) VALUES ( '$procedureID', '$facilityID', '$insuranceID', '$sourceID', '$cost', '$comments', '$entryDate', '$ip');") or die('There was an error saving: ' . mysql_error());

}

/**
* Save facility to database
*/
function saveFacility($provider, $address, $city, $state, $zip, $phone, $website) {
	mysql_query("INSERT INTO facilities (`name`, `address`, `city`, `state`, `zip`, `phone`, `website`) VALUES ( '$provider', '$address', '$city', '$state', '$zip', '$phone', '$website');") or die('There was an error saving: ' . mysql_error());

}

?>