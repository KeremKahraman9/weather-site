// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.getElementById('getLocation').addEventListener('click', function() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      document.getElementById('lat').value = position.coords.latitude;
      document.getElementById('lon').value = position.coords.longitude;
      document.getElementById('locationForm').submit();
    }, function(error) {
      alert("Location information could not be obtained: " + error.message);
    });
  } else {
    alert("Geolocation is not supported by this browser.");
  }
});
