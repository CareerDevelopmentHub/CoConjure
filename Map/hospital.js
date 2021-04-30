// // Geolocation
// if (navigator.geolocation)
//   navigator.geolocation.getCurrentPosition(function (position) {
//     console.log(position);
//     console.log(position.coords.latitude);
//     console.log(position.coords.longitude);
//   });
// else console.log("Invaild");
var map;
var markers = [];
var infoWindow;
var currLatitude;
var currLongitude;

function initMap() {
    var Ranchi = {
        lat: 23.3441,
        lng: 85.3096,
    }
    map = new google.maps.Map(document.getElementById('map'), {
        center: Ranchi,
        zoom: 15,
    });
    infoWindow = new google.maps.InfoWindow();
    searchHospitals();
    setOnClickListener();
    getLocation();
}
function displayhospitals(hospitals) {
    var hospitalsList = "";
    var address;
    var phone;
    hospitals.forEach(function (hospital, index) {
        address = hospital.addressLines;
        phone = hospital.phoneNumber;
        numBed = hospitals.numBeds;
        hospitalsList += `
        <div class="hospital-container">
            <div class="hospital-container-background">
                <div class="hospital-info-container"> 
                    <div class="hospital-address">
                        <span>${address[0]}</span> 
                        <span>${address[1]}</span>
                    </div>
                    <div class="hospital-phone-number">Ph: ${phone}</div>
                </div>
                <div class="hospital-number-container">
                    <div class="hospital-number">${index + 1}</div>
                </div>
            </div>
        </div>
        `
    });
    document.querySelector('.hospitals-list').innerHTML = hospitalsList;
}

function showhospitalsMarker(hospitals, search) {
    var latlng;
    var name;
    var address;
    var statusText;
    var phoneNumber;
    var numBed;
    var bounds = new google.maps.LatLngBounds();
    hospitals.forEach(function (hospital, index) {
        latlng = new google.maps.LatLng(
            hospital.coordinates.latitude,
            hospital.coordinates.longitude);
        name = hospital.name;
        address = hospital.addressLines[0];
        statusText = hospital.openTime;
        phoneNumber = hospital.phoneNumber;
        numBed = hospital.numBeds;
        var rating = hospital.rating;

        createMarker(latlng, name, address, statusText, phoneNumber, numBed, index, rating);
        setMarkerDirections(hospital.coordinates.latitude, hospital.coordinates.longitude, index);
        setMarkerAnimations(markers[index], search)
        bounds.extend(latlng);
    });
    map.fitBounds(bounds);
}

function setMarkerAnimations(marker, search) {
    if (search == true)
        marker.setAnimation(google.maps.Animation.BOUNCE);
    else
        marker.setAnimation(google.maps.Animation.DROP);
}

function createMarker(latlng, name, address, statusText, phoneNumber, numBed, index, rating) {
    var html = `
    <div class="hospital-info-window">
        <div class="hospital-info-name">
            ${name} &nbsp ${rating}<span class="fa fa-star checked fa-xs"></span>
        </div>
        <div class="hospital-info-status">
            ${statusText}
        </div>
        <div id="hospital-address-id" class="hospital-info-address">
            <div class="circle">
                <i class="fas fa-location-arrow"></i>
            </div>
            ${address}
        </div>
        <div class="hospital-info-phone">
            <div class="circle">
                <i class="fas fa-phone-alt"></i>
            </div>
            ${phoneNumber}
        </div>
        <div class="hospital-info-beds">
            <div class="circle">
                <i class="fas fa-procedures"></i>
            </div>
            ${numBed}
        </div>
    </div>
    `
    var marker = new google.maps.Marker({
        map: map,
        position: latlng,
        label: `${index + 1}`,
    });

    google.maps.event.addListener(marker, 'mouseover', function () {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
    });
    markers.push(marker);
}



function setMarkerDirections(lat, long, index) {
    google.maps.event.addListener(markers[index], 'click', function () {
        setOnClickListenerAddress(lat, long);
    });
}

function setOnClickListener() {
    var hospitalElements = document.querySelectorAll('.hospital-container');
    hospitalElements.forEach(function (elem, index) {
        elem.addEventListener('click', function () {
            google.maps.event.trigger(markers[index], 'mouseover');
        })
    })
}

function clearLocations() {
    infoWindow.close();
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers.length = 0;
}

function searchHospitals() {
    var search = false;
    var zipCode = document.getElementById('zip-code-input').value;
    if (zipCode) {
        var foundHospitals = [];
        hospitals.forEach(function (hospital) {
            var postal = hospital.zipCode.substring(0, 5);
            if (zipCode == hospital.pincode || zipCode == postal) {
                foundHospitals.push(hospital);

            } else {

            }
        });
        search = true;
        clearLocations();
    } else {
        foundHospitals = hospitals;
    }
    displayhospitals(foundHospitals);
    showhospitalsMarker(foundHospitals, search);
}
