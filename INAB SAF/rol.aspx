<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rol.aspx.cs" Inherits="INAB_SAF.rol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>INAB - SAF</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <link href="Content/custom-styles.css" rel="stylesheet" />
    <link href="Content/dataTables.bootstrap.css" rel="stylesheet" />
    <link href="Content/select2.min.css" rel="stylesheet" >    

    <script src="Scripts/alertify.min.js"></script>
    <link href="Content/alertify.min.css" rel="stylesheet" />
    <link href="Content/default.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="Content/default.min.css"/>
    <link rel="stylesheet" href="Content/jquery-ui.css"/>



    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <script src="Scripts/jquery.metisMenu.js"></script>

    <script src="Scripts/custom-scripts.js"></script>

    <script src="Scripts/raphael-2.1.0.min.js"></script>

    <script src="Scripts/morris.js"></script>
	
	 <script src="Scripts/jquery.chart.js"></script>

    <script src="Scripts/jquery.dataTables.js"></script>
    <script src="Scripts/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
        </script>
    <script src="Scripts/select2.full.min.js"></script>
	<script type="text/javascript">
        $(document).ready(function () {
            $(".selectbox").select2();
            $(".idRolSaf").hide();
            $(".idRol1").hide();
        });
    </script>
    <script>
        function guardarbien() {
            alertify.set('notifier', 'position', 'top-center');
            alertify.success('Registro Guardado');
        }
        function errorguardar() {
            alertify.set('notifier', 'position', 'top-center');
            alertify.error('Ocurrio un error, refresque la pagina por favor y vuelva a intentarlo');
        }
        function FaltaDato() {
            alertify.set('notifier', 'position', 'top-center');
            alertify.notify('Favor de ingresar el nombre del perfil.', 'custom', 2, function () { console.log('dismissed'); });
        }
    </script>
    <script>
        $(document).ready(function () {
            $(".modificar").click(function () {
                //alert(this.id);
                var data = JSON.stringify({
                    id: this.id
                });
                $.ajax({
                    type: "POST",
                    url: "rol.aspx/consultarDatosdeRol",
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: AjaxSucceeded,
                    error: AjaxFailed
                });
            });
            function AjaxSucceeded(result) {
                var parsedState = JSON.parse(result.d);
                console.log(parsedState);
                console.log(parsedState.nombre);
                $("#nombreRol1").val(parsedState.nombre);
                $("#idRolSaf").val(parsedState.idRol);                
            }
            function AjaxFailed(result) {
                alert('Failed');
            }


            $(".eliminar").click(function () {
                //alert(this.id);
                var data = JSON.stringify({
                    id: this.id
                });
                $.ajax({
                    type: "POST",
                    url: "rol.aspx/consultarDatosdeRol",
                    data: data,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: AjaxSucceededDeleted,
                    error: AjaxFailed
                });
            });
            function AjaxSucceededDeleted(result) {
                var parsedState = JSON.parse(result.d);
                console.log(parsedState);
                console.log(parsedState.nombre);
                $("#lblNombre").html(parsedState.nombre);
                $("#idRol1").val(parsedState.idRol);

            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home.aspx"><strong><i class="fa fa-tree" aria-hidden="true"></i>
 INAB - SAF</strong></a>
				
		<div id="sideNav" href="">
		<i class="fa fa-bars icon"></i> 
		</div>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>Notificacion 1</strong>
                                    <span class="pull-right text-muted">
                                        <em>2020/12*01</em>
                                    </span>
                                </div>
                                <div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil de usuario</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Configuracion</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Cerrar sesion</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="home.aspx"><i class="fa fa-home"></i> Inicio</a>
                    </li>
                    <li>
                        <a href="#" class="active-menu"><i class="fa fa-cogs"></i> Mantenimientos<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="usuario.aspx">Usuario</a>
                            </li>
                            <li>
                                <a href="perfil.aspx">Perfil</a>
                            </li>
                            <li>
                                <a href="rol.aspx">Roles</a>
                            </li>
                            <li>
                                <a href="asigRol.aspx">Asignacionde roles</a>
                            </li>
                            <li>
                                <a href="region.aspx">Region</a>
                            </li>
                            <li>
                                <a href="subregion.aspx">Subregion</a>
                            </li>
                            <li>
                                <a href="municipio.aspx">Municipio</a>
                            </li>
                            <li>
                                <a href="unidad.aspx">Unidad</a>
                            </li>
                            <li>
                                <a href="unidadAdmin.aspx">Unidad Administrativa</a>
                            </li>
                            <li>
                                <a href="renglon.aspx">Renglon</a>
                            </li>
                            <li>
                                <a href="fuente.aspx">Fuente</a>
                            </li>
                            
						</ul>
					</li>	
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
      
		<div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            Modulo administrativo <small>Mantenimiento de roles de usuarios</small>
                        </h1>
						
									
		</div>
            <div id="page-inner">

               
				
		
			
		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Nuevo Rol de Usuario</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    
                                        <div class="form-group">
                                            <label for="exampleInputName2">Nombre</label>
                                            <asp:TextBox ID="NombreRol" class="form-control NombreRol"  runat="server"></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                                            <asp:Button ID="GuardarRol" class="btn btn-default" runat="server" Text="Guardar" OnClick="InsertRol" />
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
					
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Roles de Usuario Creados
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Modificar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                   <tbody>
                                        <%=getWhileLoopData()%>
                                    </tbody>
                                </table>









                                 <div id="Modificar" class="modal fade" role="dialog">
                                  <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Modificar Registro</h4>
                                      </div>
                                      <div class="modal-body">
                                        <div class="form-group">
                                            <label for="exampleInputName2">Nombre</label>
                                            <asp:TextBox ID="nombreRol1" class="form-control nombreRol1" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="idRolSaf" class="form-control idRolSaf" runat="server"></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                                            <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                            <asp:Button ID="Modificar" class="btn btn-default" runat="server" Text="Modificar" OnClick="UpdateRol"/>
                                            
                                        </div>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                      </div>
                                    </div>

                                  </div>
                                </div>




                                <div id="Eliminar" class="modal fade" role="dialog">
                                  <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Eliminar registro de fuente</h4>
                                      </div>
                                      <div class="modal-body">
                                        <div class="form-group">
                                            <label for="exampleInputName2">Nombre: </label>
                                            <asp:Label ID="lblNombre" class="lblNombre" runat="server" Text="Label"></asp:Label>
                                            <asp:TextBox ID="idRol1" class="form-control idRol1" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                            <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Eliminar" OnClick="DeleteRol"/>
                                            
                                        </div>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                      </div>
                                    </div>

                                  </div>
                                </div>










                            </div>
                            
                        </div>
                            </div>						
                        </div>   
                    </div>		 
				</div>
				



                	
			
		
				<footer><p>Instituto Nacional de Bosques: <a href="http://www.inab.gob.gt/">INAB</a> - Sistema Administrativo Financiero 2021</p>
				
        
				</footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
            
        <div>
        </div>
    </form>
</body>
</html>
