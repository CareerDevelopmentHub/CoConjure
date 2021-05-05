async function getapi(){
    const getjson = await fetch('https://api.covid19api.com/summary');
    const covertjson= await getjson.json();
    const country=covertjson.Countries[76];
    console.log(covertjson.Countries[76].Country);
    var active=geid("1");
    var newconfimed=geid("2");
    var recoverd=geid("3");
    var newrecovered=geid("4");
    var death=geid("5");
    var newdeath=geid("6");
    var confirmed=geid("7");
    confirmed.innerHTML=country.TotalConfirmed;
    active.innerHTML=country.TotalConfirmed;
    newconfimed.innerHTML='+'+country.NewConfirmed;
    recoverd.innerHTML=country.TotalRecovered;
    newrecovered.innerHTML='+'+country.NewRecovered;
    death.innerHTML=country.TotalDeaths;
    newdeath.innerHTML='+'+country.NewDeaths;
}
function geid(selectorText) {
    return document.getElementById(selectorText);
}
function link() {
    var x = document.getElementById("Links");
    if (x.style.display === "block") {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
getapi();
if ("serviceWorker" in navigator) {
  navigator.serviceWorker.register("./sw.js").then(registration => {
      console.log("SW Registered");
      console.log(registration);
  }).catch(error => {
      console.log("SW Registered Failed");
      console.log(error);
  });
}