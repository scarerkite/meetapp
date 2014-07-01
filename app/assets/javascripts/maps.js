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
           position: address,
           map: map,
       });
       map.setCenter(address);
     } else {
       console.warn("Couldn't geocode address.");
     }
   }

   $('address').each(function(i, el) {
     var geocoderOptions = { address: $(el).text() };
     geocoder.geocode(geocoderOptions, showMarkerFromGeocoderResults);
   });
 }



   
$(initialize)
 // google.maps.event.addDomListener(window, 'load', initialize);