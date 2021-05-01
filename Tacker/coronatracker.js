fetch("https://api.covid19india.org/data.json")
.then((apidata) => {
  return apidata.json();
})
.then((data) => {
  data = data["statewise"];
  var temp = "";
  data.forEach((u) => {
    temp += "<tr>";
    temp += "<td>" + u.state + "</td>";
    temp += "<td>" + u.confirmed + "</td>";
    temp += "<td>" + u.active + "</td>";
    temp += "<td>" + u.recovered + "</td>";
    temp += "<td>" + u.deaths + "</td></tr>";
  });

  document.getElementById("data").innerHTML = temp;
})
.catch((error) => {
  console.log(`Error: ${error}`);
});