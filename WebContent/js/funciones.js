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
   tecla = String.fromCharCode(key).toUpperCase();
   letras = " áéíóúabcdefghijklmnñopqrstuvwxyzÁÉÍÓÚABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
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


function envia(obj)
{
	if(
	(parseInt(document.getElementById("salarioMinimo").value,10)<parseInt(document.getElementById("salarioMaximo").value,10))
	&& !isNaN(parseInt(document.getElementById("salarioMinimo").value,10))
	&& !isNaN(parseInt(document.getElementById("salarioMaximo").value,10))
	){
	 obj.submit();
	 return true;
	}else{
	alert("El salario Maximo debe ser mayor al salario Minimo");
	return false;
	}
}

//FUNCIONES PARA MOSTRAR VALORES EN INPUTS Y DIVS
function getFecha(id)
{
	var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    document.getElementById(id).value = today;
}

function getHora(id)
{
	var date = new Date();
	var currentTime = ("0"+date.getHours()).slice(-2) + ':' + ("0"+date.getMinutes()).slice(-2);
	document.getElementById(id).value = currentTime;
}


function mostrarValor(idelemento,valor)
{
	document.getElementById(idelemento).value = valor+"";
}

function mostrarPlaceholder(idelemento,valor)
{
	document.getElementById(idelemento).placeholder = valor;
}

function mostrarImagen(idelemento,idimagen)
{
	document.getElementById(idelemento).src = 'IMGPersona?idfoto='+idimagen;
}

function rellenarEmpleado(id,nombre,apaterno,amaterno,sexo,
	fcon,fnac,salario,nss,ecivil,dvac,dper,idfoto,direccion,
	colonia,cp,escolaridad,porcom,estatus,iddep,idpue,idciu,idsuc)
{
	console.log({id,nombre,apaterno,amaterno,sexo,
		fcon,fnac,salario,nss,ecivil,dvac,dper,idfoto,direccion,
		colonia,cp,escolaridad,porcom,estatus,iddep,idpue,idciu,idsuc});
	mostrarValor('edit_id',id);
	mostrarValor('edit_nombre',nombre);
	mostrarValor('edit_apaterno',apaterno);
	mostrarValor('edit_amaterno',amaterno);
	mostrarValor('edit_sexo',sexo);
	mostrarValor('edit_fecha-contratacion',fcon);
	mostrarValor('edit_fecha-nacimiento',fnac);
	mostrarValor('edit_salario',salario)
	mostrarValor('edit_nss',nss);
	mostrarValor('edit_estado-civil',ecivil);
	mostrarValor('edit_dias-vacaciones',dvac);
	mostrarValor('edit_dias-permiso',dper);
	mostrarImagen('edit_foto',idfoto);
	mostrarValor('edit_direccion',direccion);
	mostrarValor('edit_colonia',colonia);
	mostrarValor('edit_codigo-postal',cp);
	mostrarValor('edit_escolaridad',escolaridad);
	mostrarValor('edit_porcentaje-comision',porcom);
	mostrarValor('edit_departamento',iddep);
	mostrarValor('edit_puesto',idpue);
	mostrarValor('edit_ciudad',idciu);
	mostrarValor('edit_sucursal',idsuc);
}


//FUNCIONES PARA OCULTAR/MOSTRAR DIV

function OcultarDiv(idDiv)
{
	document.getElementById(idDiv).style.display = 'none';
}

function MostrarDiv(idDiv)
{
	document.getElementById(idDiv).style.display = 'block';
}



function validarFechas()
{
   var hoy = new Date();
   var plazo = new Date()+10;
   var fechaInicio = document.getElementById("fechaInicio").value;
   var fechaFin = document.getElementById("fechaFin").value;

   if(Date.parse(fechaInicio)<=Date.parse(hoy) || Date.parse(fechaInicio)>=Date.parse(plazo) && Date.parse(fechaInicio)< Date.parse(fechaFin) ) {
	   return true;
	 
} else {
	alert("fechas incorrectas");
	return false; 
	

}
}

//FUNCIONES PARA CLONAR Y ELIMINAR ELEMENTOS DEL HTML
function clonar(iddondeclonar,idelementoclonar)
{
	document.getElementById(iddondeclonar).appendChild(idelementoclonar);
}


