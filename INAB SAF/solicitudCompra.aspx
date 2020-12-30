<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="solicitudCompra.aspx.cs" Inherits="INAB_SAF.home" %>

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
                            <li>
                                <a href="solicitudCompra.aspx">Solicitud de compra</a>
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
                            Modulo Compras <small>Solicitud de compras de vienes, suministros y servicios</small>
                        </h1>
						
									
		</div>
            <div id="page-inner">

               
				
		
			
		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Nueva Solicitud</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form class="form-inline">
                                        <div class="form-group">
                                            <label for="exampleInputName2">Lugar y fecha</label>
                                            <input type="text" class="form-control" id="username" placeholder="Lugar y fecha" value="Guatemala 29 de Diciembre del 2020">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Correlativo</label>
                                            <input type="email" class="form-control" id="email" value="DAF-002-2020">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Unidad Administrativa</label>
                                            <input type="email" class="form-control" id="Peremail" value="Direccion Administrativa y Financiera">
                                        </div>
                                        
                                        
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Cantidad</label>
                                            <input type="number" class="form-control" id="dpi">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputName2">Descripcion</label>
                                            <input type="text" class="form-control" id="pass">
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Renglon presupuestario</label>
                                            <select class="selectbox">
                                                <optgroup label="Renglon">
                                                    <option value="CA">081 - Personal administrativo, tecnico, profesional y operativo</option>
                                                    <option value="NV">111 - Energia electrica</option>
                                                    <option value="OR">112 - Agua</option>
                                                    <option value="WA">113 - Telefonia</option>
                                                    <option value="WA">114 - Correos y telegrafos</option>
                                                </optgroup>
                                            
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-default">Agregar</button>
                                        </div>

                                        <div class="form-group">
                                            <label for="etnia">Solicitante</label>
                                            <select class="selectbox">
                                                <optgroup label="Solicitante">
                                                    <option value="CA">Nilson Reguan</option>
                                                    <option value="NV">Otto Hernandez</option>
                                                </optgroup>
                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Autorizado</label>
                                            <select class="selectbox">
                                                <optgroup label="Autorizado">
                                                    <option value="CA">Nilson Reguan</option>
                                                    <option value="NV">Otto Hernandez</option>
                                                </optgroup>
                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Vo.Bo.</label>
                                            <select class="selectbox">
                                                <optgroup label="Vo.Bo.">
                                                    <option value="CA">Nilson Reguan</option>
                                                    <option value="NV">Otto Hernandez</option>
                                                </optgroup>
                                            
                                            </select>
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
                                Solicitudes creadas
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Correlativo</th>
                                            <th>Ver</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>29/12/2020</td>
                                            <td>DAF-000-2020</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Ver</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>29/12/2020</td>
                                            <td>DAF-001-2020</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Ver</button></td>
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
