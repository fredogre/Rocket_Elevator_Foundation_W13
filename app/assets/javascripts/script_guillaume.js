$(document).ready(function(){
  //initialise quote radio button
  $('input:radio[name=project_type]:nth(0)').attr('checked', true);
  $('input:radio[name=product_type]:nth(0)').attr('checked', true);
  });

function show_form_section(id_show,id_hide1,id_hide2,id_hide3){
    document.getElementById(id_show).style.display ='block';
    document.getElementById(id_hide1).style.display ='none';
    document.getElementById(id_hide2).style.display ='none';
    document.getElementById(id_hide3).style.display ='none';
  }



function testhidden(){

var temp = document.quoteform.project_type_temp.value
alert(temp);

}

function testjquery(){
    var badvalue,required;
    var item = $('#res_nbapartment').val();
    var status = new Array();

    if (!item || parseInt(item) === 0 || isNaN(item)) {       
        if (!$('#res_nbapartment').hasClass('required')){
            $('#res_nbapartment').val(0);
            required = false;
            badvalue = true;
        } else {
            $('#res_nbapartment').addClass("badinput");
            required = true;
            badvalue = false;
        };
    } else {
        $('#res_nbapartment').removeClass("badinput");
        badvalue = false;
        required = false;
    };

    return status;
};

$('#quoteform').on('keyup keypress', function(e) {
  var keyCode = e.keyCode || e.which;
  if (keyCode === 13) { 
    e.preventDefault();
    return false;
  }
});

function tata(param){
  $(param).addClass("badinput");
};








