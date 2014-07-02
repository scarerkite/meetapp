function initialize() {
   var latitude = $('#lat').data('latitude');
   var longitude = $('#lng').data('longitude');
   var latLng = new google.maps.LatLng(latitude, longitude);
   var mapOptions = {
     center: latLng,
     zoom: 14,
     streetViewControl: false,
     mapTypeControl: false
   };
   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
   addMarker(map, latLng);
 };

function addMarker(map, latLng) {
   console.log("Showing marker from geocoder results.");
   new google.maps.Marker({
     position: latLng,
     map: map
   });
 }



   
$(initialize)
 // google.maps.event.addDomListener(window, 'load', initialize);