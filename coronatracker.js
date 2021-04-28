//  Cases tracker
fetch('https://api.covid19api.com/summary').then((apidata) => {
    return apidata.json();
}).then((realdata) => {
    const country = realdata.Countries[76];
    document.getElementById('1').innerHTML = country.Country;
    document.getElementById('2').innerHTML = `Confirmed Case ${country.TotalConfirmed}`;
    document.getElementById('3').innerHTML = `Death ${country.TotalDeaths}`;
    document.getElementById('4').innerHTML = `Recovered ${country.TotalRecovered}`;
}).catch((error) => {
    console.log(`Error: ${error}`);
});



// Geolocation
if (navigator.geolocation)
    navigator.geolocation.getCurrentPosition(function (position) {
        console.log(position);
        console.log(position.coords.latitude);
        console.log(position.coords.longitude);
    });
else
    console.log("Invaild");
