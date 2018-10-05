//need to create object
var projecttype, producttype;
var quoteparams = [];

var form;

var quote_first_name;
var quote_last_name;
var quote_email;
var quote_company;
var quote_project_name;
var quote_project_location;

//residential link
var quote_res_nbunit;
var quote_res_nbfloor;
var quote_res_nbbasement;

//commercial link
var quote_com_nbbusiness;
var quote_com_floors;
var quote_com_basement;
var quote_com_nbparking;
var quote_com_nbshaft;

//corporative link
var quote_corp_nbbusiness;
var quote_corp_floors;
var quote_corp_basement;
var quote_corp_nbparking;
var quote_corp_pplefloors;

//hybrid link
var quote_hybrid_nbbusiness;
var quote_hybrid_floors;
var quote_hybrid_basement;
var quote_hybrid_nbparking;
var quote_hybrid_pplefloors;
var quote_hybrid_hrsactivity;

//results link
var quote_nbshafttotal;
var quote_result_unitcost;
var quote_result_installcost;
var quote_result_totalcost;

var temp_nbshafttotal;
var temp_unitcost;
var temp_installcost;
var temp_totalcost;

const stardardcost = 7565, premiumcost = 12345, exceliumcost = 15400;

function validatevalue(itemToCheck) {
    var badvalue, required;
    var item = $(itemToCheck).val();
    var status = []

    if (!item || parseInt(item) === 0 || isNaN(item)) {
        if (!$(itemToCheck).hasClass('required')) {
            $(itemToCheck).val(0);
            required = false;
            badvalue = false;
        } else {
            $(itemToCheck).addClass("badinput");
            required = true;
            badvalue = true;
        };

    } else {
        //if ($(itemToCheck).hasClass("badinput")){
        $(itemToCheck).removeClass("badinput");
        //};
        badvalue = false;
        required = false;
    };

    status[0] = badvalue;
    status[1] = required;

    return status;
};

function getElement(){
    form = document.getElementById('quoteform');

    quote_first_name = document.getElementById('contact_first_name');
    quote_last_name = document.getElementById('contact_last_name');
    quote_email = document.getElementById('contact_email');
    quote_company = document.getElementById('contact_company');
    quote_project_name = document.getElementById('project_name');
    quote_project_location = document.getElementById('project_location');

    //residential link
    quote_res_nbunit = document.getElementById('res_nbapartment');
    quote_res_nbfloor = document.getElementById('res_floors');
    quote_res_nbbasement = document.getElementById('res_basement');

    //commercial link
    quote_com_nbbusiness = document.getElementById('com_nbbusiness')
    quote_com_floors = document.getElementById('com_floors')
    quote_com_basement = document.getElementById('com_basement')
    quote_com_nbparking = document.getElementById('com_nbparking')
    quote_com_nbshaft = document.getElementById('com_nbshaft')

    //corporative link
    quote_corp_nbbusiness = document.getElementById('corp_nbbusiness')
    quote_corp_floors = document.getElementById('corp_floors')
    quote_corp_basement = document.getElementById('corp_basement')
    quote_corp_nbparking = document.getElementById('corp_nbparking')
    quote_corp_pplefloors = document.getElementById('corp_pplefloors')

    //hybrid link
    quote_hybrid_nbbusiness = document.getElementById('hybrid_nbbusiness')
    quote_hybrid_floors = document.getElementById('hybrid_floors')
    quote_hybrid_basement = document.getElementById('hybrid_basement')
    quote_hybrid_nbparking = document.getElementById('hybrid_nbparking')
    quote_hybrid_pplefloors = document.getElementById('hybrid_pplefloors')
    quote_hybrid_hrsactivity = document.getElementById('hybrid_hrsactivity')

    //results link
    quote_nbshafttotal = document.getElementById('result_nbshaft');
    quote_result_unitcost = document.getElementById('result_unitcost');
    quote_result_installcost = document.getElementById('result_installcost');
    quote_result_totalcost = document.getElementById('result_totalcost');
}


function checkformvalue() {
    var projecttype, badvalue = false;
    var checkresult = [];


    projecttype = document.querySelector('input[name="project_type"]:checked').value


    //validation for residential
    if (projecttype === "residential") {
        checkresult[0] = validatevalue('#res_nbapartment');
        checkresult[1] = validatevalue('#res_floors');
        checkresult[2] = validatevalue('#res_basement');


    } else if (projecttype === "commercial") { //validation for commercial
        checkresult[0] = validatevalue('#com_nbbusiness');
        checkresult[1] = validatevalue('#com_floors');
        checkresult[2] = validatevalue('#com_basement');
        checkresult[3] = validatevalue('#corp_nbparking');
        checkresult[4] = validatevalue('#com_nbshaft');

    } else if (projecttype === "corpo") { //validation for corporate
        checkresult[0] = validatevalue('#corp_nbbusiness');
        checkresult[1] = validatevalue('#corp_floors');
        checkresult[2] = validatevalue('#corp_basement');
        checkresult[3] = validatevalue('#corp_nbparking');
        checkresult[4] = validatevalue('#corp_pplefloors');

    } else { //validation for hybrid
        checkresult[0] = validatevalue('#hybrid_nbbusiness');
        checkresult[1] = validatevalue('#hybrid_floors');
        checkresult[2] = validatevalue('#hybrid_basement');
        checkresult[3] = validatevalue('#hybrid_nbparking');
        checkresult[4] = validatevalue('#hybrid_pplefloors');
        checkresult[5] = validatevalue('#hybrid_hrsactivity');
    };

    for (let index1 = 0; index1 < checkresult.length; index1++) {
        if ((checkresult[index1][0] == true) && (checkresult[index1][1] == true)) {
            //alert('Please fill all the required information')
            badvalue = true;
            document.getElementById("quoteform_submit").disabled = true
            break;
        };
    };

    if (badvalue === false) {
        document.getElementById("quoteform_submit").disabled = false
        shaftcalculation();
    };
};
function shaftcalculation(){
    var nbunit,nbfloor,nbbasement,nbshafttotal,projecttype,pplefloor,producttype,nbshaft;
    var tempo1,tempo2,tempo3,tempo4;
    var resultNbShaft,resultNbElevator;
    var unitcost, installcost, totalcost;

    getElement();

    projecttype = document.querySelector('input[name="project_type"]:checked').value
    
    //calculation for residential
    if (projecttype === "residential"){
        nbunit = parseInt(quote_res_nbunit.value);
        nbfloor = parseInt(quote_res_nbfloor.value);
        
        tempo1 = Math.ceil((nbunit/nbfloor)/6);
        if (nbfloor > 20){
            resultNbShaft = Math.ceil(nbfloor/20);
            resultNbElevator = tempo1 * resultNbShaft;
        } else{
            resultNbElevator = tempo1;
        };
        console.log(tempo1);
        
    } else if (projecttype === "commercial"){ //calculation for commercial
        nbunit = parseInt(quote_com_nbshaft.value);
        
        resultNbElevator = nbunit;    
    
    } else if (projecttype === "corpo"){ //calculation for corporate
        nbunit = parseInt(quote_corp_nbbusiness.value);
        nbfloor = parseInt(quote_corp_floors.value);    
        nbbasement = parseInt(quote_corp_basement.value);
        pplefloor = parseInt(quote_corp_pplefloors.value);
        
        tempo1 = pplefloor * (nbfloor + nbbasement);
        console.log(tempo1);
        tempo2 = Math.ceil(tempo1/1000);
        console.log(tempo2);
        tempo3 = Math.ceil((nbfloor + nbbasement)/20);
        console.log(tempo3);
        tempo4 = Math.ceil(tempo2/tempo3);
        resultNbElevator = Math.ceil(tempo4 * tempo3);        

    } else { //calculation for hybrid
        nbunit = parseInt(quote_hybrid_nbbusiness.value);
        nbfloor = parseInt(quote_hybrid_floors.value);    
        nbbasement = parseInt(quote_hybrid_basement.value);
        pplefloor = parseInt(quote_hybrid_pplefloors.value);

        tempo1 = pplefloor * (nbfloor + nbbasement);
        console.log(tempo1);
        tempo2 = Math.ceil(tempo1/1000);
        console.log(tempo2);
        tempo3 = Math.ceil((nbfloor + nbbasement)/20);
        console.log(tempo3);
        tempo4 = Math.ceil(tempo2/tempo3);
        resultNbElevator = Math.ceil(tempo4 * tempo3); 

    };

    if (resultNbElevator > 0 && document.querySelector('input[name="product_type"]:checked').checked){
        producttype = document.querySelector('input[name="product_type"]:checked').value
        console.log(producttype);

        //$.post("http://localhost:3000/api/price",{"id":1,"data1":resultNbElevator})

        if (producttype === "standard") { //calculation for standard
            unitcost = resultNbElevator * stardardcost;
            installcost = unitcost*10/100;
            totalcost = unitcost + installcost;
        } else if (producttype === "premium"){ //calculation for premium
            unitcost = resultNbElevator * premiumcost;
            installcost = unitcost*13/100;
            totalcost = unitcost + installcost;
        } else if (producttype === "excelium"){ //calculation for excelium
            unitcost = resultNbElevator * exceliumcost;
            installcost = unitcost*16/100;
            totalcost = unitcost + installcost;
        };
    }
    
    
    if (!unitcost){
        quote_nbshafttotal.innerText = ''
    } else {
        quote_nbshafttotal.innerText = resultNbElevator;
        temp_nbshafttotal.value = resultNbElevator;
    };
    if (!unitcost){
        quote_result_unitcost.innerText = ''
    } else {
        quote_result_unitcost.innerText = parseInt(unitcost);
        temp_unitcost.value = parseInt(unitcost);
    };
    if (!installcost){
        quote_result_installcost.innerText = ''
    } else {
        quote_result_installcost.innerText = parseInt(installcost);
        temp_installcost.value = parseInt(installcost);

    };
    if (!totalcost){
        quote_result_totalcost.innerText = ''
    } else {
        quote_result_totalcost.innerText = parseInt(totalcost);
        temp_totalcost.value = parseInt(totalcost);
    };
};