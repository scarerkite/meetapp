var map;
function initialize() {
  var latitude = $('#lat').data('latitude');
  var longitude = $('#lng').data('longitude');
  var latLng = new google.maps.LatLng(latitude, longitude);
  var position_marker;
  google.maps.event.addDomListener(window, 'resize', function() {
    map.setCenter(latLng);
  });
  var mapOptions = {
    center: latLng,
    zoom: 16,
    streetViewControl: false,
    mapTypeControl: false
  };
  map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  addMarker(map, latLng);
  $("#current-position").on("click", function(){
    if(navigator.geolocation){
      $("#address").text("Finding new address...");
      navigator.geolocation.getCurrentPosition(updateLocation, handleLocationError);
      navigator.geolocation.watchPosition(updateLocation, handleLocationError);
    }else{
      alert("Oh no! This browser doesn't support HTML5 geolocation API.");
    }
  });
};


function addMarker(map, latLng) {
  position_marker = new google.maps.Marker({
    position: latLng,
    map: map
  });
};

 // Add current location
  function updateLocation(position){
    
    var coords = position.coords;
    latLng = new google.maps.LatLng(coords.latitude, coords.longitude);
    if(position_marker != undefined) position_marker.setMap(null);
    position_marker = new google.maps.Marker({
      position: latLng,
      map: map,
      title: "my position"
    });
    map.setCenter(latLng);
    map.setZoom(16);
    path = window.location.pathname + ".json";
    $.ajax({
      url: path,
      type: "PUT",
      data: {
        event:{
          latitude: position.coords.latitude,
          longitude: position.coords.longitude
        }
      },
      dataType: 'json',
      success: function(data){
        new_address = data.address;
        if (data.postcode != null){
          new_address += ", " + data.postcode;
        }
          
        console.log("event location updated", data)
        $("#address").text(new_address);
      }
    })
  }

  function handleLocationError(error){
    alert(error);
  }



$(initialize)
 // google.maps.event.addDomListener(window, 'load', initialize);