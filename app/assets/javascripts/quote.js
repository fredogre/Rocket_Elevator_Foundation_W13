var form = document.getElementById("contactform");

form.addEventListener(
  "submit",
  function(e) {
    e.preventDefault();

    alert("Thank You !!");
    form.reset();
  },
  false
);

//Residential Quote

function resQuote() {
  if ($("#resApartmentsNb").val() && $("#resFloorsNb").val()) {
    var units = parseInt($("#resApartmentsNb").val()) || 0;
    var floors = parseInt($("#resFloorsNb").val()) || 0;
    var basements = parseInt($("#resBsmtNb").val()) || 0;
    var rdoSTD = $("#resStandard").is(":checked");
    var rdoPRE = $("#resPremium").is(":checked");
    var rdoEX = $("#resExcelium").is(":checked");
    var floors20 = Math.ceil(floors / 20);
    var cages = (document.getElementById("resElev").value = Math.ceil(
      (units / floors / 6) * floors20
    ));

    if (rdoSTD == true) {
      (document.getElementById("resPrice").value =
        " $ " + (cages * 7565 * 1.1).toFixed(2));
    }
    if (rdoPRE == true) {
      (document.getElementById("resPrice").value =
        " $ " + (cages * 12345 * 1.13).toFixed(2));
    }
    if (rdoEX == true) {
      (document.getElementById("resPrice").value =
        " $ " + (cages * 15400 * 1.16).toFixed(2));
    }
  } else {
    $("#resPrice").val("");
    $("#resElev").val("");
  }
}

//Commercial Quote

function comQuote() {
  var shops = parseInt($("#comShopsNb").val()) || 0;
  var floors = parseInt($("#comFloorsNb").val()) || 0;
  var basements = parseInt($("#comBsmtNb").val()) || 0;
  var parking = parseInt($("#comParkingNb").val()) || 0;
  var cages = parseInt($("#comElevatorNb").val()) || 0;
  var rdoSTD = $("#comStandard").is(":checked");
  var rdoPRE = $("#comPremium").is(":checked");
  var rdoEX = $("#comExcelium").is(":checked");

  if (rdoSTD == true) {
    (document.getElementById("comPrice").value =
      " $ " + (cages * 7565 * 1.1).toFixed(2));
  }
  if (rdoPRE == true) {
    (document.getElementById("comPrice").value =
      " $ " + (cages * 12345 * 1.13).toFixed(2));
  }
  if (rdoEX == true) {
    (document.getElementById("comPrice").value =
      " $ " + (cages * 15400 * 1.16).toFixed(2));
  }
}

//Corporate quote

function corpQuote() {
  if (
    $("#corpOccupantsNb").val() &&
    $("#corpFloorsNb").val() &&
    $("#corpBsmtNb").val()
  ) {
    var occupants = parseInt($("#corpOccupantsNb").val()) || 0;
    var floors = parseInt($("#corpFloorsNb").val()) || 0;
    var basements = parseInt($("#corpBsmtNb").val()) || 0;
    var rdoSTD = $("#corpStandard").is(":checked");
    var rdoPRE = $("#corpPremium").is(":checked");
    var rdoEX = $("#corpExcelium").is(":checked");

    var elevator = Math.ceil((occupants * (floors + basements)) / 1000);
    var nelevator = Math.ceil((floors + basements) / 20);
    var bcages = Math.ceil(elevator / nelevator);
    var cages = (document.getElementById("corpElev").value =
      nelevator * bcages);

    if (rdoSTD == true) {
      var total = (document.getElementById("corpPrice").value =
        " $ " + (cages * 7565 * 1.1).toFixed(2));
    }
    if (rdoPRE == true) {
      (document.getElementById("corpPrice").value =
        " $ " + (cages * 12345 * 1.13).toFixed(2));
    }
    if (rdoEX == true) {
      (document.getElementById("corpPrice").value =
        " $ " + (cages * 15400 * 1.16).toFixed(2));
    }
  } else {
    $("#corpElev").val("");
    $("#corpPrice").val("");
  }
}

//Hybrid quote

function hybQuote() {
  if (
    $("#hybOccupantsNb").val() &&
    $("#hybFloorsNb").val() &&
    $("#hybBsmtNb").val()
  ) {
    var occupants = parseInt($("#hybOccupantsNb").val()) || 0;
    var floors = parseInt($("#hybFloorsNb").val()) || 0;
    var basements = parseInt($("#hybBsmtNb").val()) || 0;
    var rdoSTD = $("#hybStandard").is(":checked");
    var rdoPRE = $("#hybPremium").is(":checked");
    var rdoEX = $("#hybExcelium").is(":checked");

    var elevator = Math.ceil((occupants * (floors + basements)) / 1000);
    var nelevator = Math.ceil((floors + basements) / 20);
    var bcages = Math.ceil(elevator / nelevator);
    var cages = (document.getElementById("hybElev").value = nelevator * bcages);

    if (rdoSTD == true) {
      var total = (document.getElementById("hybPrice").value =
        " $ " + (cages * 7565 * 1.1).toFixed(2));
    }
    if (rdoPRE == true) {
      (document.getElementById("hybPrice").value =
        " $ " + (cages * 12345 * 1.13).toFixed(2));
    }
    if (rdoEX == true) {
      (document.getElementById("hybPrice").value =
        " $ " + (cages * 15400 * 1.16).toFixed(2));
    }
  } else {
    $("#hybElev").val("");
    $("#hybPrice").val("");
  }
}

function verifHours() {
  var hours = document.getElementById("hybHoursNb");

  if (hours.value > 24) {
    hours.value = 24;
  }

  if (hours.value < 0) {
    hours = 0;
  }
  hybQuote();
}
