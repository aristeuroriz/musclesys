var geocoder;
var map;
var marker;

function initialize() {
	var latlng = new google.maps.LatLng(-15.777732073491423, -47.8385675292968);
	var options = {
		zoom: 1,
		minZoom: 2,
		center: latlng,
		streetViewControl: false,
		mapTypeId: google.maps.MapTypeId.TERRAIN
	};

	map = new google.maps.Map(document.getElementById("mapa"), options);

	geocoder = new google.maps.Geocoder();

	marker = new google.maps.Marker({
		map: map,
		draggable: true,
	});

	marker.setPosition(latlng);


}

initialize();

function carregarNoMapa(endereco) {
	geocoder.geocode({ 'address': endereco  }, function (results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[0]) {
				var latitude = results[0].geometry.location.lat();
				var longitude = results[0].geometry.location.lng();

				$('#user_location').val(results[0].formatted_address);
				$('#user_latitude').val(latitude);
				$('#user_longitude').val(longitude);

				var location = new google.maps.LatLng(latitude, longitude);
				marker.setPosition(location);
				map.setCenter(location);
				map.setZoom(16);
			}
		}
	});
}

$("#mostrar").click(function() {
	if($(this).val() != "")
		carregarNoMapa($("#user_location").val());

})

$("#user_location").blur(function() {
	if($(this).val() != "")
		carregarNoMapa($("#user_location").val());
})

google.maps.event.addListener(marker, 'drag', function () {
	geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[0]) { 
				$('#user_location').val(results[0].formatted_address);
				$('#user_latitude').val(marker.getPosition().lat());
				$('#user_longitude').val(marker.getPosition().lng());
			}
		}
	});
});

$("#user_location").autocomplete({
	source: function (request, response) {
		geocoder.geocode({ 'address': request.term }, function (results, status) {
			response($.map(results, function (item) {
				return {
					label: item.formatted_address,
					value: item.formatted_address,
					latitude: item.geometry.location.lat(),
					longitude: item.geometry.location.lng()
				}
			}));
		})
	},
	select: function (event, ui) {
		$("#user_latitude").val(ui.item.latitude);
		$("#user_longitude").val(ui.item.longitude);
		var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
		marker.setPosition(location);
		map.setCenter(location);
		map.setZoom(30);
	}
});

$("form").submit(function(event) {
	event.preventDefault();

	var endereco = $("#user_location").val();
	var latitude = $("#user_latitude").val();
	var longitude = $("#user_longitude").val();

});