const heightArray = [
  "<5ft 3in", "5ft 3in", "5ft 4in", "5ft 5in", "5ft 5in",
  "5ft 6in", "5ft 7in", "5ft 8in", "5ft 9in", "5ft 10in", "5ft 11in",
  "6ft 0in", "6ft 1in", "6ft 2in", "6ft 3in", "6ft 4in", ">6ft 4in"];
const positionArray = ["PG", "G", "G/W", "W", "W/F", "F", "F/P", "P", "C"];
const gradeArray = ["12", "11", "10", "9"];
var filterBarOpen = false;


function openFilterBar() {
  const playerTable = document.querySelector('#myTable');
  var filterBar = playerTable.insertRow(1);
  var submitBar = playerTable.insertRow(2);
  filterBar.id = "filterBar";
  submitBar.id = "submitBar";

  var i;
  for (i = 0; i < 5; i++) {
    var filterCell = filterBar.insertCell(i);
    var submitCell = submitBar.insertCell(i);
    filterCell.id = "filterCell" + i;
    submitCell.id = "submitCell" + i;
  }

  addSubmitButton();
  filterBarOpen = true;
}

function addSubmitButton() {
  var cell = document.getElementById('submitCell2')
  cell.innerHTML = "<button id='submitButton'>Submit</button>";
}

function openNameSearchBar() {
  if (filterBarOpen == false) {
    openFilterBar();
  }

  createNameSearch();
}

function createNameSearch() {
  var cell = document.getElementById('filterCell0')
  cell.innerHTML = "<input type='text' id='nameSearch' placeholder='Search for name...'>";
}

function openHeightFilterBar() {
  if (filterBarOpen == false) {
    openFilterBar();
  }
  createHeightSelector();
  addHeightOptions();
}

function createHeightSelector() {
  var cell = document.getElementById('filterCell1')
  cell.innerHTML = "<select id = 'heights'></select>";
}


function addHeightOptions() {
  var i;
  for (i = 0; i < heightArray.length; i++) {
    var heights = document.getElementById("heights");
    var option1 = document.createElement('option');
    option1.setAttribute("value", heightArray[i]);
    var nod1 = document.createTextNode(heightArray[i]);
    option1.appendChild(nod1);
    heights.appendChild(option1);
    //need to add an "onchange" eventlistener to push selected value back to ruby
  }
}

function openPositionFilterBar() {
  if (filterBarOpen == false) {
    openFilterBar();
  }

  createPositionSelector();
  addPositionOptions();
}

function createPositionSelector() {
  var cell = document.getElementById('filterCell2')
  cell.innerHTML = "<select id = 'positions'></select>";
}

function addPositionOptions() {
  var i;
  for (i = 0; i < positionArray.length; i++) {
    var positions = document.getElementById("positions");
    var option1 = document.createElement('option');
    option1.setAttribute("value", positionArray[i]);
    var nod1 = document.createTextNode(positionArray[i]);
    option1.appendChild(nod1);
    positions.appendChild(option1);
    //need to add an "onchange" eventlistener to push selected value back to ruby
  }
}

function openGradeFilterBar() {
  if (filterBarOpen == false) {
    openFilterBar();
  }
  createGradeSelector();
  addGradeOptions();

}

function createGradeSelector() {
  var cell = document.getElementById('filterCell3')
  cell.innerHTML = "<select id = 'grades'></select>";
}

function addGradeOptions() {
  var i;
  for (i = 0; i < gradeArray.length; i++) {
    var heights = document.getElementById("grades");
    var option1 = document.createElement('option');
    option1.setAttribute("value", gradeArray[i]);
    var nod1 = document.createTextNode(gradeArray[i]);
    option1.appendChild(nod1);
    heights.appendChild(option1);
    //need to add an "onchange" eventlistener to push selected value back to ruby
  }
}


function openSchoolSearchBar() {
  if (filterBarOpen == false) {
    openFilterBar();
  }

  createSchoolSearch();
}

function createSchoolSearch() {
  var cell = document.getElementById('filterCell4')
  cell.innerHTML = "<input type='text' id='schoolSearch' placeholder='Search for school...'>";
}

window.onload = function() {
  document.getElementById("nameButton").addEventListener("click", openNameSearchBar);
  document.getElementById("heightButton").addEventListener("click", openHeightFilterBar);
  document.getElementById("positionButton").addEventListener("click", openPositionFilterBar);
  document.getElementById("gradeButton").addEventListener("click", openGradeFilterBar);
  document.getElementById("schoolButton").addEventListener("click", openSchoolSearchBar);
}
