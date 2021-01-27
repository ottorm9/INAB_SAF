<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="INAB_SAF.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login - SAF - INAB</title>
    <link href="Content/style.css" rel="stylesheet" type="text/css" />
    


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
        function guardarbien() {
            alertify.set('notifier', 'position', 'top-center');
            alertify.success('Registro Guardado');
        }
         function datoIncorrecto() {
            alertify.set('notifier', 'position', 'top-center');
            alertify.error('Usuario o contraseña incorrecto, intente nuevamente');
        }
         function FaltaDato() {
            alertify.set('notifier', 'position', 'top-center');
            alertify.notify('Favor de ingresar usuario y contraseña.', 'custom', 2, function () { console.log('dismissed'); });
        }
     </script>
</head>
<body>
    <form id="form1" runat="server" asp-controller="login" method="post">

        <div class="modal fade" id="recuperarPass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Recuperar Contraseña</h4>
                                        </div>
                                        <div class="modal-body">
                                            Si usted no recuerda su contraseña, ingrese su correo institucional, por medio de correo electronico recibira su nueva contraseña con el que podra ingresar.
                                            <label for="password">Correo institucional</label>
                                            <asp:TextBox ID="mailInstitu" class="form-control" runat="server" type="email" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <button type="button" class="btn btn-primary">Recuperar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
        
        <div>
            <div class="page">
              <div class="container1">
                <div class="left">
                  <div class="login">Inicio de sesion</div>
                  <div class="eula">Bienvenido al sistema administrativo financiero de INAB
                  </div>
                    <a href="#" class="eula1" data-toggle="modal" data-target="#recuperarPass">¿No recuerdas tu contraseña?</a>
                </div>
                <div class="right">
                  <svg viewBox="0 0 320 300">
                    <defs>
                      <linearGradient
                                      inkscape:collect="always"
                                      id="linearGradient"
                                      x1="13"
                                      y1="193.49992"
                                      x2="307"
                                      y2="193.49992"
                                      gradientUnits="userSpaceOnUse">
                        <stop
                              style="stop-color:#9eff01;"
                              offset="0"
                              id="stop876" />
                        <stop
                              style="stop-color:#086310;"
                              offset="1"
                              id="stop878" />
                      </linearGradient>
                    </defs>
                    <path d="m 40,120.00016 239.99984,-3.2e-4 c 0,0 24.99263,0.79932 25.00016,35.00016 0.008,34.20084 -25.00016,35 -25.00016,35 h -239.99984 c 0,-0.0205 -25,4.01348 -25,38.5 0,34.48652 25,38.5 25,38.5 h 215 c 0,0 20,-0.99604 20,-25 0,-24.00396 -20,-25 -20,-25 h -190 c 0,0 -20,1.71033 -20,25 0,24.00396 20,25 20,25 h 168.57143" />
                  </svg>
                  <div class="form">
                    
                    <!--<input type="email" id="email">-->

                    <label for="email">Correo institucional</label>
                    <asp:TextBox ID="email" runat="server" type="email" TextMode="SingleLine"></asp:TextBox>
                    
                    <label for="password">Contraseña</label>
                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                    <!--<input type="submit" onclick="Button1_Click" id="submit" value="Entrar"> -->
                    <asp:Button ID="submit" runat="server"  Text="Entrar" OnClick="submit_Click" />
                    </div>
                </div>
              </div>
            </div>
        </div>
    
    
    </form>
    <script src='Scripts/anime.min.js'></script>
    <script  src="Scripts/login.js"></script>
    
    <script src="Scripts/jquery-1.10.2.js"></script>

    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
