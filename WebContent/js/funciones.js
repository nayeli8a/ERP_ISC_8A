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

function mostrarSegunTipo(tipo,div)
{
	//solo el admin puede modificar datos en las rutinas
	if(tipo=="A")
	{
			//debe mostrar los botones de editar y eliminar
			document.getElementById(div).style.display='block';
	}
	else{
			//solo muestra la informacion necesaria
			document.getElementById(div).style.display='none';
	}
}

function OcultarFormularioClientes(idtipomem,idfechaape,idfechapag)
{
	document.getElementById(idtipomem).style.display = 'none';
	document.getElementById(idfechaape).style.display = 'none';
	document.getElementById(idfechapag).style.display = 'none';
}

function MostrarFormularioClientes(idtipomem,idfechaape,idfechapag)
{
	document.getElementById(idtipomem).style.display = 'block';
	document.getElementById(idfechaape).style.display = 'block';
	document.getElementById(idfechapag).style.display = 'block';
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

function muestrasegunselect(idinput,precio)
{
	//alert(precio+"");
	//$('#input_precio').text(precio+"");
	document.getElementById(idinput).value = precio; 
	document.getElementById(idinput).placeholder = "$ "+precio; 
}

///Aqui no funciona :(
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

function clonar() {
	  cantidad = 0;
	  myForm = document.getElementsByTagName('form');
	  //myForm = document.getElementById('nodo_producto')
	  cant = myForm.length;
	  clonForm = myForm[0].cloneNode(true);
	  clonForm.id = "form" + cant;
	  document.getElementById("contenedor").appendChild(clonForm);
	}




