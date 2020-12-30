﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asigRol.aspx.cs" Inherits="INAB_SAF.home" %>

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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>


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
                            Modulo administrativo <small>Asignacion de permisos y roles de usuario</small>
                        </h1>
						
									
		</div>
            <div id="page-inner">

               
				
		
			
		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Asignar permiso y rol de usuario</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form class="form-inline">
                                        
                                        <div class="form-group">
                                            <label for="etnia">Usuario</label>
                                            <select class="selectbox">
                                                <optgroup label="Usuario">
                                                    <option value="CA">Nilson Reguan</option>
                                                    <option value="NV">Otto Hernandez</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Perfil de usuario</label>
                                            <select class="selectbox">
                                                <optgroup label="Perfil">
                                                    <option value="CA">Administrador Nacional</option>
                                                    <option value="NV">Director Subregional</option>
                                                    <option value="CA">Secretaria Regional</option>
                                                    <option value="NV">Secretaria Subregional</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Rol de usuario</label>
                                            <select class="selectbox">
                                                <optgroup label="Rol">
                                                    <option value="CA">Administrador Nacional</option>
                                                    <option value="NV">Nacional</option>
                                                    <option value="CA">Super Usuario</option>
                                                </optgroup>
                                            </select>
                                        </div>

                                        



                                         <div class="panel-group" id="accordion">
                                          <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Solicitud de compra</a>
                                              </h4>
                                            </div>
                                            <div id="collapse1" class="panel-collapse collapse in">
                                              <div class="panel-body">
                                                  
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Crear
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Modificar
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Eliminar
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Imprimir
                                                    </label>
                                                  </div>

                                              </div>
                                            </div>
                                          </div>
                                          <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Presupuesto</a>
                                              </h4>
                                            </div>
                                            <div id="collapse2" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Emitir cuadro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Validar cuadro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Autorizar cuadro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Consignar partida
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Aprobar partida
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>
                                          <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Facturas</a>
                                              </h4>
                                            </div>
                                            <div id="collapse3" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Crear
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Modificar
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Generar Constancia
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Viaticos</a>
                                              </h4>
                                            </div>
                                            <div id="collapse4" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Anticipo
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Liquidacion
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Almacen</a>
                                              </h4>
                                            </div>
                                            <div id="collapse5" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Registro ingreso
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Registro salida
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Imprimir constancia
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>

                                             <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Consultas y Reportes</a>
                                              </h4>
                                            </div>
                                            <div id="collapse6" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Generar y editar libro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Generar y edigar Arqueo
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Liquidar Caja Chica
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Reportes de consulta
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>



                                        </div> 

                                        
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-default">Guardar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
					
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Usuarios con permisos y roles asignados
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Usuario</th>
                                            <th>Perfil</th>
                                            <th>Rol</th>
                                            <th>Modulo</th>
                                            <th>Permiso</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Crear</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Modificar</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>                                        
                                        <tr class="even gradeC">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Eliminar</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>                                        
                                        <tr class="even gradeC">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Imprimir</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>

                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Emitir cuadro</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Validar cuadro</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Autorizar cuadro</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Consignar partida</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Aprobar partida</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                    </tbody>
                                </table>
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

    <script src="Scripts/jquery-1.10.2.js"></script>

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
        });
    </script>

    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
