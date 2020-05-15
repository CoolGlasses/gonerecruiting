const heightArray = [
  "<5ft 3in", "5ft 3in", "5ft 4in", "5ft 5in", "5ft 5in",
  "5ft 6in", "5ft 7in", "5ft 8in", "5ft 9in", "5ft 10in", "5ft 11in",
  "6ft 0in", "6ft 1in", "6ft 2in", "6ft 3in", "6ft 4in", ">6ft 4in"];
const positionArray = ["PG", "G", "G/W", "W", "W/F", "F", "F/P", "P", "C"];
const gradeArray = ["12", "11", "10", "9"];


function addSubmitButton() {
  var bar = document.getElementById('filterBar')
  var submitButton = document.createElement("input");
  submitButton.setAttribute("type", "submit");
  submitButton.setAttribute("value", "Filter");
  submitButton.setAttribute("id", "submitButton");
  bar.appendChild(submitButton);
}

function addNameSearch() {
  var bar = document.getElementById('filterBar')
  var nameSearch = document.createElement("input");
  nameSearch.setAttribute("type", "text");
  nameSearch.setAttribute("placeholder", "Search by Name...");
  nameSearch.setAttribute("id", "nameSearch");
  nameSearch.setAttribute("name", "filter[name]");
  bar.appendChild(nameSearch);
}

function addSchoolSearch() {
  var bar = document.getElementById('filterBar')
  var schoolSearch = document.createElement("input");
  schoolSearch.setAttribute("type", "text");
  schoolSearch.setAttribute("placeholder", "Search by School...");
  schoolSearch.setAttribute("id", "schoolSearch");
  schoolSearch.setAttribute("name", "filter[school]");
  bar.appendChild(schoolSearch);
}

function addHeightSelector() {
  var bar = document.getElementById('filterBar')
  var heightSelector = document.createElement("select");
  heightSelector.setAttribute("id", "heightSelector");
  heightSelector.setAttribute("name", "filter[height]");
  bar.appendChild(heightSelector);
}

function addPositionSelector() {
  var bar = document.getElementById('filterBar')
  var positionSelector = document.createElement("select");
  positionSelector.setAttribute("id", "positionSelector");
  positionSelector.setAttribute("name", "filter[position]");
  bar.appendChild(positionSelector);
}

function addGradeSelector() {
  var bar = document.getElementById('filterBar')
  var gradeSelector = document.createElement("select");
  gradeSelector.setAttribute("id", "gradeSelector");
  gradeSelector.setAttribute("name", "filter[grade]");
  bar.appendChild(gradeSelector);
}

function addHeightOptions() {
  var heights = document.getElementById("heightSelector");
  var option1 = document.createElement('option');
  option1.disabled=true;
  option1.selected=true;
  var nod1 = document.createTextNode("--by Height--");
  option1.appendChild(nod1);
  heights.appendChild(option1);

  var i;
  for (i = 0; i < heightArray.length; i++) {
    var heights = document.getElementById("heightSelector");
    var option1 = document.createElement('option');
    option1.setAttribute("value", heightArray[i]);
    var nod1 = document.createTextNode(heightArray[i]);
    option1.appendChild(nod1);
    heights.appendChild(option1);
  }
}

function addPositionOptions() {
  var positions = document.getElementById("positionSelector");
  var option1 = document.createElement('option');
  option1.disabled = true;
  option1.selected = true;
  var nod1 = document.createTextNode("--by Position--");
  option1.appendChild(nod1);
  positions.appendChild(option1);

  var i;
  for (i = 0; i < positionArray.length; i++) {
    var positions = document.getElementById("positionSelector");
    var option1 = document.createElement('option');
    option1.setAttribute("value", positionArray[i]);
    var nod1 = document.createTextNode(positionArray[i]);
    option1.appendChild(nod1);
    positions.appendChild(option1);
  }
}

function addGradeOptions() {
  var heights = document.getElementById("gradeSelector");
  var option1 = document.createElement('option');
  option1.disabled = true;
  option1.selected = true;
  var nod1 = document.createTextNode("--by Grade--");
  option1.appendChild(nod1);
  heights.appendChild(option1);

  var i;
  for (i = 0; i < gradeArray.length; i++) {
    var heights = document.getElementById("gradeSelector");
    var option1 = document.createElement('option');
    option1.setAttribute("value", gradeArray[i]);
    var nod1 = document.createTextNode(gradeArray[i]);
    option1.appendChild(nod1);
    heights.appendChild(option1);
  }
}


function fire() {
  addNameSearch();
  addHeightSelector();
  addPositionSelector();
  addGradeSelector();
  addSchoolSearch();
  addHeightOptions();
  addPositionOptions();
  addGradeOptions();
  addSubmitButton();
}

window.onload = function() {
  fire();
}

