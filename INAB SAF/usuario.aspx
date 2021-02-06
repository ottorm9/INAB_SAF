<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usuario.aspx.cs" Inherits="INAB_SAF.usuario" %>

<asp:Content ID="ContentUsuario" ContentPlaceHolderID="ContenidoSAF" runat="server">


    <div id="not visible" style="display: none;">
        <asp:TextBox ID="txtError" runat="server"></asp:TextBox>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="card-title">
                        <div class="title">Nuevo Usuario</div>
                    </div>
                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label for="lblNombreUsu">Nombre</label>
                        <asp:TextBox ID="txtNombreUsu" class="form-control txtNombreUsu" runat="server" MaxLength="150"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblCorreoUsu">Correo</label>
                        <asp:TextBox ID="txtCorreoUsu" class="form-control txtCorreoUsu"  type="email" TextMode="SingleLine" runat="server" MaxLength="150"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblDpiUsu">Dpi</label>
                        <asp:TextBox ID="txtDpiUsu" class="form-control txtDpiUsu" runat="server" MaxLength="18"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator"
                            ControlToValidate="txtDpiUsu" ValidationExpression="^\d+$" EnableClientScript="true"
                            ErrorMessage="Por favor ingresar solo numeros" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label for="lblPuestoUsu">Puesto</label>
                        <asp:TextBox ID="txtPuestoUsu" class="form-control txtPuestoUsu" MaxLength="150" TextMode="SingleLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblUsuarioUsu">Usuario</label>
                        <asp:TextBox ID="txtUsuarioUsu" class="form-control txtUsuarioUsu"  type="email" MaxLength="150" TextMode="SingleLine" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblContraseniaUsu">Contraseña</label>
                        <asp:TextBox ID="txtContraseniaUsu" class="form-control txtContraseniaUsu" runat="server" TextMode="Password" MaxLength="30"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblConfirmarContraseniaUsu">Confirmar Contraseña</label>
                        <asp:TextBox ID="txtConfirmarContraseniaUsu" class="form-control txtConfirmarContraseniaUsu" runat="server" TextMode="Password" MaxLength="30"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblSubregionUsu">Subregión</label>
                        <asp:DropDownList ID="ddlIdSubregionUsu" class="selectbox ddlIdSubregionUsu" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="lblEtniaUsu">Etnia</label>
                        <asp:DropDownList ID="ddlIdEtniaUsu" class="selectbox ddlIdEtniaUsu" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="lblIdiomaUsu">Idioma</label>
                        <asp:DropDownList ID="ddlIdIdiomaUsu" class="selectbox ddlIdIdiomaUsu" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnGuardar" class="btn btn-default" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />

                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Perfiles creados
                </div>
                <div class="panel-body">
                    <div class="panel-body">
                        <div class="table-responsive">

                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Usuario</th>
                                        <th>Nombre</th>
                                        <th>Correo</th>
                                        <th>Dpi</th>
                                        <th>Puesto</th>
                                        <th>Subregión</th>
                                        <th>Región</th>
                                        <th>Municipio</th>
                                        <th>Departamento</th>
                                        <th>Idioma</th>
                                        <th>Etnia</th>
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
                                                <label for="lblNombreModUsu">Nombre</label>
                                                <asp:TextBox ID="txtNombreModUsu" class="form-control txtNombreModUsu" runat="server" MaxLength="150"></asp:TextBox>
                                                <asp:TextBox ID="txtIdUsuarioModUsu" class="form-control txtIdUsuarioModUsu" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblCorreoModUsu">Correo</label>
                                                <asp:TextBox ID="txtCorreoModUsu" class="form-control txtCorreoModUsu"  type="email" TextMode="SingleLine" runat="server" MaxLength="150"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblDpiModUsu">Dpi</label>
                                                <asp:TextBox ID="txtDpiModUsu" class="form-control txtDpiModUsu" runat="server" MaxLength="18"></asp:TextBox>
                                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
                                                    ControlToValidate="txtDpiModUsu" ValidationExpression="^\d+$" EnableClientScript="true"
                                                    ErrorMessage="Por favor ingrese solo numeros" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" />
                                            </div>
                                            <div class="form-group">
                                                <label for="lblPuestoModUsu">Puesto</label>
                                                <asp:TextBox ID="txtPuestoModUsu" class="form-control txtPuestoModUsu" MaxLength="150" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblUsuarioModUsu">Usuario</label>
                                                <asp:TextBox ID="txtUsuarioModUsu" class="form-control txtUsuarioModUsu"  type="email" TextMode="SingleLine" runat="server" MaxLength="150"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblContraseniaModUsu">Contraseña</label>
                                                <asp:TextBox ID="txtContraseniaModUsu" class="form-control txtContraseniaModUsu" runat="server" TextMode="Password" MaxLength="30"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblConfirmarContraseniaModUsu">Confirmar Contraseña</label>
                                                <asp:TextBox ID="txtConfirmarContraseniaModUsu" class="form-control txtConfirmarContraseniaModUsu" runat="server" TextMode="Password" MaxLength="30"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblSubregionModUsu">Subregión</label>
                                                <asp:DropDownList ID="ddlIdSubregionModUsu" class="form-control ddlIdSubregionModUsu" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblEtniaModUsu">Etnia</label>
                                                <asp:DropDownList ID="ddlIdEtniaModUsu" class="form-control ddlIdEtniaModUsu" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblIdiomaModUsu">Idioma</label>
                                                <asp:DropDownList ID="ddlIdIdiomaModUsu" class="form-control ddlIdIdiomaUsu" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnModificar" class="btn btn-default" runat="server" Text="Modificar" OnClick="btnModificar_Click" />

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
                                                <label for="exampleInputEmail2">Nombre: </label>
                                                <asp:Label ID="lblNombreElUsu" class="lblNombreElUsu" runat="server" Text="Label"></asp:Label>
                                                <asp:TextBox ID="txtIdUsuarioElUsu" class="form-control txtIdUsuarioElUsu" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Correo: </label>
                                                <asp:Label ID="lblCorreoElUsu" class="lblCorreoElUsu" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Dpi: </label>
                                                <asp:Label ID="lblDpiElUsu" class="lblDpiElUsu" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Puesto: </label>
                                                <asp:Label ID="lblPuestoElUsu" class="lblPuestoElUsu" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Usuario: </label>
                                                <asp:Label ID="lblUsuarioElUsu" class="lblUsuarioElUsu" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Subregion: </label>
                                                <asp:Label ID="lblIdSubregionElUsu" class="lblIdSubregionElUsu" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Etnia: </label>
                                                <asp:Label ID="lblIdEtniaElUsu" class="lblIdEtniaElUsu" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Idioma: </label>
                                                <asp:Label ID="lblIdIdiomaElUsu" class="lblIdIdiomaElUsu" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnEliminar" class="btn btn-default" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />

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



</asp:Content>
