<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usuario.aspx.cs" Inherits="INAB_SAF.home" %>

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
                            Modulo administrativo <small>Mantenimiento de usuarios</small>
                        </h1>
						
									
		</div>
            <div id="page-inner">

               
				
		
			
		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Nuevo Usuario</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <form class="form-inline">
                                        <div class="form-group">
                                            <label for="exampleInputName2">Nombre</label>
                                            <input type="text" class="form-control" id="username" placeholder="Nombre del usuario">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Correo institucional</label>
                                            <input type="email" class="form-control" id="email" placeholder="ejemplo@inab.gob.gt">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Correo personal</label>
                                            <input type="email" class="form-control" id="Peremail" placeholder="ejemplo@gmail.com">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">DPI</label>
                                            <input type="number" class="form-control" id="dpi" placeholder="2288">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputName2">Contraseña</label>
                                            <input type="password" class="form-control" id="pass" placeholder="Contraseña">
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Etnia</label>
                                            <select class="selectbox">
                                                <optgroup label="Etnias">
                                                    <option value="CA">Maya</option>
                                                    <option value="NV">Garifuna</option>
                                                    <option value="OR">Xinka</option>
                                                    <option value="WA">Ladino/Mestizo</option>
                                                </optgroup>
                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Idioma</label>
                                            <select class="selectbox">
                                                <optgroup label="Idioma">
                                                    <option value="CA">Achi</option>
                                                    <option value="NV">Akateko</option>
                                                    <option value="OR">Chalchiteko</option>
                                                    <option value="WA">Ch'orti'</option>
                                                    <option value="WA">Chuj</option>
                                                    <option value="WA">Garinagu/Gafifuna</option>
                                                    <option value="WA">Itza'</option>
                                                    <option value="WA">Ixil</option>
                                                    <option value="WA">Jakalteko/Popti'</option>
                                                    <option value="WA">Kaqchikel</option>
                                                    <option value="WA">K'iche'</option>
                                                    <option value="WA">Mam</option>
                                                    <option value="WA">Mopan</option>
                                                    <option value="WA">Poqoman</option>
                                                    <option value="WA">Poqomchi'</option>
                                                </optgroup>
                                            
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Unidad Administrativa</label>
                                            <select class="selectbox">
                                                <optgroup label="Unidad Administrativa">
                                                    <option value="CA">Junta Directiva</option>
                                                    <option value="NV">Gerencia</option>
                                                    <option value="OR">Subgerencia</option>
                                                    <option value="WA">Direccion de desarrollo forestal</option>
                                                    <option value="WA">Departamento de fortalecimiento forestal, municipal y comunal</option>
                                                    <option value="WA">Departamento de investigacion forestal</option>
                                                    <option value="WA">Departamento de capacitacion y extension forestal</option>
                                                    <option value="WA">Coordinacion Probosque</option>
                                                    <option value="WA">Coordinacion PINPEP</option>
                                                    <option value="WA">Direccion de manejo y conservacion de bosques</option>
                                                    <option value="WA">Departamento de proteccion forestal</option>
                                                    <option value="WA">Departamento de manejo de bosques naturales</option>
                                                    <option value="WA">Departamento de conservacion y ecosistemas forestales estrategicos</option>
                                                    <option value="WA">Departamento de silvicultura</option>
                                                    <option value="WA">Departamento de certificacion de fuentes y semillas forestales</option>
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
                                Usuarios creados
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Usuario</th>
                                            <th>DPI</th>
                                            <th>Unidad Admin.</th>
                                            <th>Modificar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>Nilson Reguan</td>
                                            <td>nilsonreguan@gmail.com</td>
                                            <td>2299256680101</td>
                                            <td class="center">Gerente</td>
                                            <td><button class="btn btn-primary"><i class="fa fa-edit "></i> Modificar</button></td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>Otto Hernandez</td>
                                            <td>ottoguate@gmail.com</td>
                                            <td>2244246680101</td>
                                            <td class="center">Gerente</td>
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
