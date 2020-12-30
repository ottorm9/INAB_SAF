<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="unidadAdmin.aspx.cs" Inherits="INAB_SAF.home" %>

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
                            Modulo administrativo <small>Mantenimiento de unidades</small>
                        </h1>
						
									
		</div>
            <div id="page-inner">

               
				
		
			
		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Nueva Unidad Administrativa</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form class="form-inline">
                                        <div class="form-group">
                                            <label for="etnia">Unidad</label>
                                            <select class="selectbox">
                                                <optgroup label="Unidades">
                                                    <option value="CA">Junta Directiva</option>
                                                    <option value="NV">Gerencia</option>
                                                    <option value="OR">Subgerencia</option>
                                                    <option value="WA">Direccion de desarrollo forestal</option>
                                                    <option value="WA">Departamento de fortalecimiento forestal, municipal y comunal</option>
                                                    <option value="WA">Departamento de investigacion forestal</option>
                                                    <option value="WA">Coordinacion probosque</option>
                                                    <option value="WA">Coordinacion pinpep</option>
                                                    <option value="WA">Direccion de manejo y conservacion de bosques</option>
                                                    <option value="WA">Departamento de proteccion forestal</option>
                                                    <option value="WA">Departamento de manejo de bosques naturales</option>
                                                </optgroup>
                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Municipio</label>
                                            <select class="selectbox">
                                                <optgroup label="Municipio">
                                                    <option value="CA">Cobán</option>
                                                    <option value="NV">Santa Cruz Verapaz</option>
                                                    <option value="OR">Sant Cristóbal Verapaz</option>
                                                    <option value="WA">Tactic</option>
                                                    <option value="WA">Tamahú</option>
                                                    <option value="WA">Tucurú</option>
                                                    <option value="WA">Panzóz</option>
                                                    <option value="WA">Senahú</option>
                                                    <option value="WA">San Pedro Carchá</option>
                                                    <option value="WA">San Juan Chamelco</option>
                                                    <option value="WA">Lanquín</option>
                                                </optgroup>
                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Region</label>
                                            <select class="selectbox">
                                                <optgroup label="Regiones">
                                                    <option value="CA">Metropolitana</option>
                                                    <option value="NV">Coban</option>
                                                    <option value="OR">Zacapa</option>
                                                    <option value="WA">Jutiapa</option>
                                                    <option value="WA">Chimaltenango</option>
                                                    <option value="WA">Quetzaltenango</option>
                                                    <option value="WA">Quiche</option>
                                                </optgroup>                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Sub Region</label>
                                            <select class="selectbox">
                                                <optgroup label="subregiones">
                                                    <option value="CA">Metropolitana</option>
                                                    <option value="NV">Tactic</option>
                                                    <option value="OR">Rabinal</option>
                                                    <option value="WA">Cobán</option>
                                                    <option value="WA">San Jeronimo</option>
                                                    <option value="WA">Fray bartolomé de las casas</option>
                                                    <option value="WA">Ixcán, Playa Grande</option>
                                                </optgroup>                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputName2">Codigo</label>
                                            <input type="text" class="form-control" id="username" placeholder="Codigo de unidad">
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
                                Unidades creadas
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Nombre</th>
                                            <th>Municipio</th>
                                            <th>Region</th>
                                            <th>Subregion</th>
                                            <th>Modificar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>JD</td>
                                            <td>Junta Directiva</td>
                                            <td>Guatemala</td>
                                            <td>Metropolitana</td>
                                            <td>Metropolitana</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Modificar</button></td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>GER</td>
                                            <td>Gerencia</td>
                                            <td>Guatemala</td>
                                            <td>Metropolitana</td>
                                            <td>Metropolitana</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Modificar</button></td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>SBG</td>
                                            <td>Subgerencia</td>
                                            <td>Guatemala</td>
                                            <td>Metropolitana</td>
                                            <td>Metropolitana</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Modificar</button></td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>DF</td>
                                            <td>Direccion de desarrollo forestal</td>
                                            <td>Guatemala</td>
                                            <td>Metropolitana</td>
                                            <td>Metropolitana</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Modificar</button></td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>DFFNC</td>
                                            <td>Departamento de fortalecimiento forestal, municipal y comunal</td>
                                            <td>Guatemala</td>
                                            <td>Metropolitana</td>
                                            <td>Metropolitana</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Modificar</button></td>
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
