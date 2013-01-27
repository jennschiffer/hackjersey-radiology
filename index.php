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

<body onload="initialize()">

<div id="header">
	<!-- header/logo/whatever - includes internal links to form, api-->
	hack jersey radiology wowowowoo
</div>

	<?php
		if ( $_POST['submitted'] == 1 ) {
			echo '<div id="success">Thanks for submitting your cost of radiology. Check out what others are paying near you!</div>';
			
			savePrice($_POST['procedure'], $_POST['insurance'], $_POST['provider'], $_POST['address'], $_POST['city'], $_POST['state'], $_POST['zip'], $_POST['phone'], $_POST['website'], $_POST['cost'], $_POST['comments'], $_POST['source'], $_POST['entryDate'], $_POST['ip']);
		}
	?>


<div id="map_canvas" style="width:100%; height:300px;"></div>

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
		
		<input type="hidden" name="submitted" value="1" />	
		<input type="hidden" name="entryDate" value="<?php echo date('Y-m-d'); ?>" />
		<input type="hidden" name="ip" value="<?php echo $_SERVER["REMOTE_ADDR"]; ?>" />
		<input type="hidden" name="source" value="crowdsource form" />
		<input type="submit" id="share" class="submit" value="Submit" />
	
	</form>

</div>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC12eZOT9Lb3Z2P3ZWIDZh9mhuT0qeMYNc&sensor=true"></script>
<script type="text/javascript">
var initialLocation;
var montclair = new google.maps.LatLng(40.8258, -74.2094);
var browserSupportFlag =  new Boolean();

function initialize() {
    var latlng = new google.maps.LatLng(40.8258, -74.2094);
    var myOptions = {
        zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
            myOptions);
            
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
      map.setZoom(13);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }
  else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }
  
  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      initialLocation = montclair;
    } else {
      initialLocation = montclair;
    }
    map.setCenter(initialLocation);
  }
  
  // Change this depending on the name of your PHP file
      downloadUrl("phpsqlajax_genxml3.php", function(data) {
        var xml = data.responseXML;
        var markers = xml.documentElement.getElementsByTagName("marker");
        for (var i = 0; i < markers.length; i++) {
          var name = markers[i].getAttribute("name");
          var address = markers[i].getAttribute("address");
          var type = markers[i].getAttribute("type");
          var point = new google.maps.LatLng(
              parseFloat(markers[i].getAttribute("lat")),
              parseFloat(markers[i].getAttribute("lng")));
          var html = "<b>" + name + "</b> <br/>" + address;
          var icon = customIcons[type] || {};
          var marker = new google.maps.Marker({
            map: map,
            position: point,
            icon: icon.icon,
            shadow: icon.shadow
          });
          bindInfoWindow(marker, map, infoWindow, html);
        }
      });
    

    function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }

    function downloadUrl(url, callback) {
      var request = window.ActiveXObject ?
          new ActiveXObject('Microsoft.XMLHTTP') :
          new XMLHttpRequest;

      request.onreadystatechange = function() {
        if (request.readyState == 4) {
          request.onreadystatechange = doNothing;
          callback(request, request.status);
        }
      };

      request.open('GET', url, true);
      request.send(null);
    }

    function doNothing() {}
}
google.maps.event.addDomListener(window, "load", initialize);


</script>

<script type="text/javascript" src="js/places.js"></script>
<script type="text/javascript" src="js/share.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=true"></script>
</body>
</html>