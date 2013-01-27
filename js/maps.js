/**
* Share Form Scripts
* Author: Jenn Schiffer
*/


function initialize() {
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
        zoom: 8,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map"),
            myOptions);
}
google.maps.event.addDomListener(window, "load", initialize);