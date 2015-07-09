// JavaScript Document
$(document).on('ready',function(){
        pruebas = function(){
            alert("prueba");
        }
        //pruebas();
	$(".clickableRow td").on('click',function(){
            var cl = $(this).attr("class");
            $('form[name='+cl+']').submit();
	});
        
        $(".clickableRow td").mouseover(function(){
            var cl = $(this).attr("class");
            $("."+cl).css("background-color","#D6D7D8");
        })
        .mouseout(function() {
            var cl = $(this).attr("class");
            $("."+cl).css("background-color","#EEEFF0");
        });

	$("#displayAnswers").on('click',function(){
            $(".answer").slideToggle("slow");
	});
	

        $("#formPage").change(function(){
            $("#formPage").submit();
        });
      
        /* POPUP: http://www.actualidadjquery.es/2012/01/06/fancybox-abrir-imagenes-paginas-web-y-videos-en-ventanas-tipo-popup-con-jquery/ */
        $(".search").on('click',function(){
            var url='/ServidorSIAR/SearchNotification.jsp';
            var ancho = 450;
            var alto = 650;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });
        
        $(".upload").on('click',function(){
            var url='/ServidorSIAR/UploadFile.jsp';
            var ancho = 400;
            var alto = 300;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });
        $(".createType").on('click',function(){
            var url='/ServidorSIAR/Create_Types.jsp';
            var ancho = 500;
            var alto = 400;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });
        $(".createCategory").on('click',function(){
            var url='/ServidorSIAR/Create_Categories.jsp';
            var ancho = 500;
            var alto = 400;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });
        $(".createLocation").on('click',function(){
            var url='/ServidorSIAR/Create_Locations.jsp';
            var ancho = 500;
            var alto = 400;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });
        $(".createApp").on('click',function(){
            var url='/ServidorSIAR/Create_App.jsp';
            var ancho = 500;
            var alto = 400;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });
        $(".createUser").on('click',function(){
            var url='/ServidorSIAR/SignupUser.jsp';
            var ancho = 500;
            var alto = 400;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });

        $(".connectActiveDirectory").on('click',function(){
            var url='/ServidorSIAR/ConnectActiveDirectory.jsp';
            var ancho = 500;
            var alto = 600;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url, "", "width="+ancho+",height="+alto+",menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        });

        /* Abrir adxuntos */
        $(".file").on('click',function(){
            var url = $(this).attr("id");
            var ancho = 800;
            var alto = 600;
            var posicion_x; 
            var posicion_y; 
            posicion_x=(screen.width/2)-(ancho/2); 
            posicion_y=(screen.height/2)-(alto/2); 
            window.open(url,",left="+posicion_x+",top="+posicion_y+"");
        });
        
        $(".delete").on('click',function(){
            var id = $(this).parents("tr").attr("id");
            alert("¿Estás seguro de eliminar este elemento? "+id);
            //$("#"+id).remove();
            $("#"+id).css('color','grey');
            $(this).remove();
            var content = $("input[name='delete']").val();
            if(content!="")
                id = ","+id;
            $("input[name='delete']").val(content+id);
            alert("Para que el borrado sea permanente es necesario pulsar el botón 'Guardar'."+$("input[name='delete']").val());
        });
        
        $(".deleteFile").on('click',function(){
            var id = $(this).prev().attr("id");
            //$("#"+id).remove();
            var content = $("input[name='deleteFile']").val();
            alert("¿Estás seguro de eliminar este archivo? "+id+" Content: "+content);
            $(this).prev().css('color','grey');
            $(this).css('display','none');            
            if(content!="")
                id = ","+id;
            $("input[name='deleteFile']").val(content+id);
            alert("Para que el borrado sea permanente es necesario pulsar el botón 'Guardar'."+$("input[name='deleteFile']").val());
        });
        
        
        
        /* ------------------ Configuración de datos de incidencias: localizacións e categorías -----------------*/
        var oldName;
        var fullName;
        
        $("input[name='data']").focusin(function(){
            oldName = $(this).val();
            fullName = $(this).parent().next().children().val();
            
        });

        /* Modificación de full paths */
        $("input[name='data']").focusout(function(){
            newname=$(this).val();
            $(this).attr('value',newname);
            var path = $("input[name='fullPath']").val();
            
            /*Recorrer os full path para comprobar os que teñen a mesma raíz*/
            var values = $("input[name='fullPath']").map(function(){
                path = $(this).val();
                var newpath = path.replace(oldName,newname);
                $("input[name='fullPath'][value='"+path+"']").attr('value',newpath);
            }).get();
        });
        
        /* Activación dos checkbox de pais/fillos correspondentes para ser activados/desactivados */
        $("input[type='checkbox']").on('click',function(){
            var checked = $(this).prop("checked"); //Comprobar se o checkbox está sendo activado ou desactivado para tratar de igual maneira os "fillos"
            var state = $(this).val();
            fullName = $(this).parent().next().next().children().val(); 
            
            /*Recorrer os full path para comprobar os que teñen a mesma raíz: desactivar todos os fillos*/
            var values = $("input[name='fullPath'][value^='"+fullName+"']").map(function(){
                var path = $(this).val();                
                var string = "input[name='fullPath'][value='"+path+"']";
                if(state == 1 && $(string).attr('id')==1){
                    $(string).parent().prev().prev().children().prop("checked", checked);
                }
            }).get();     
            
            /* Buscar a partir do full path seleccionado todos os pais para activalos tamén */
            var searchFather = fullName.split('/');
            while(searchFather.length>2){
                searchFather.pop();
                var string = "input[name='fullPath'][value='"+searchFather.join('/')+"']";
                //alert("VALOR: "+$(string).val()+". Father: "+string+" -- "+fullName);
                if(state == 0 && $(string).attr('id')==0){
                    $(string).parent().prev().prev().children().prop("checked", checked);
                }
            }
        });
        
        /* Tratamento dos desplegables cando están deshabilitados */   
        $(".closedNotif").mouseover(function(){
            $(this).prop('title', 'Esta incidencia está cerrada. Para modificar algún dato es necesario volver a abrirla.');
        });
        
        /* ESCANEO REDE */
        //http://web.tursos.com/como-hacer-un-formulario-de-contacto-ii-validar-con-jquery/
        //http://viralpatel.net/blogs/html5-datalist-example/
        //http://jqueryui.com/autocomplete/#combobox
        //http://brianreavis.github.io/selectize.js/


        $("input[name=scan]").click(function () {    
            if( $("input[name=scan]:radio").is(':checked')) {
                $("input[name=ipInterval]").prop('disabled', true);
                $(this).next().prop('disabled', false);
            }
        });

        $("input[name=ipInterval]").focusout(function () {    
            if( $(this).val()==="") {
                alert("El campo no puede estar vacío");
            }else{
                if($(this).attr('id')==="network"){
                    if($(this).val().match(/^(([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\/[0-9]{1,3}$/)){
                        $("#scanbutton").prop('disabled',false);
                    }else{
                        alert("El patrón introducido no es correcto. Ejemplo: 192.168.0.0/24");
                    }
                }else{
                    if($(this).val().match(/^(([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])-[0-9]{1,3}$/)){
                        $("#scanbutton").prop('disabled',false);
                    }else{
                        alert("El patrón introducido no es correcto. Ejemplo: 192.168.0.12-65");
                        
                    }
                }
            }
            
        });
        

        
});