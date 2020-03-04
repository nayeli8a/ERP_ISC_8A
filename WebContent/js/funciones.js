function eliminar() 
{
	if (confirm("¿Estás seguro de eliminar este elemento?"))
		alert("Eliminado correctamente");
	return;
}

function getHoraActual()
{
	document.getElementById("fechaactual").innerHTML = Date();
}

function modificar() {
  alert("Se ha modificado correctamente!");
  return;
}


function validarTelefono(cad)
{
	if(/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/.test(cad))
		return '';
	else
		return 'Numero de Telefono invalido<br>';
}

function mostrarValorEnDiv(iddiv,tipo,valor)
{
	//la devuelvo en formato de texto
	document.getElementById(iddiv+tipo).innerHTML="<h5>"+valor+"</h5>";
}

function pasarIdRutinaModal(idmodalimg,imgsrc)
{
	document.getElementById(idmodalimg).src = imgsrc+""; 
}


function buscar(){
	$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});	
}


function soloLetras(e){
   key = e.keyCode || e.which;
   tecla = String.fromCharCode(key).toLowerCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
   especiales = "8-37-39-46";

   tecla_especial = false
   for(var i in especiales){
        if(key == especiales[i]){
            tecla_especial = true;
            break;
        }
    }

    if(letras.indexOf(tecla)==-1 && !tecla_especial){
        return false;
    }


}



