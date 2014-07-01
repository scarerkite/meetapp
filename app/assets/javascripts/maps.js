function initialize() {
   var mapOptions = {
     center: new google.maps.LatLng(51.5, -0.1),
     zoom: 14,
     streetViewControl: false,
     mapTypeControl: false
   };
   var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
   addMarker(map);
 };

function addMarker(map) {
   console.log("Showing marker from geocoder results.");
   var geocoder = new google.maps.Geocoder();
   var showMarkerFromGeocoderResults = function(results, status) {
     if (status == google.maps.GeocoderStatus.OK) {
       var marker = new google.maps.Marker({
           position: results[0].geometry.location,
           map: map,
       });
       map.setCenter(results[0].geometry.location);
     } else {
       console.warn("Couldn't geocode address.");
     }
   }

   $('destination').each(function(i, el) {
     var geocoderOptions = { address: $(el).text() };
     geocoder.geocode(geocoderOptions, showMarkerFromGeocoderResults);
   });
 }



   
$(initialize)
 // google.maps.event.addDomListener(window, 'load', initialize);