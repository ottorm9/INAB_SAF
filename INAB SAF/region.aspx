<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="region.aspx.cs" Inherits="INAB_SAF.region" %>

<asp:Content ID="ContentRegion" ContentPlaceHolderID="ContenidoSAF" runat="server">

    <div id="not visible" style="display: none;">
        <asp:TextBox ID="txtError" runat="server"></asp:TextBox>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="card-title">
                        <div class="title">Nueva Región</div>
                    </div>
                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label for="lblNombreReg">Nombre</label>
                        <asp:TextBox ID="txtNombreReg" class="form-control" runat="server" MaxLength="150"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblCodigoReg">Codigo</label>
                        <asp:TextBox ID="txtCodigoReg" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblTipoReg">Tipo</label>
                        <asp:DropDownList ID="DropDownList1Reg" class="selectbox" runat="server">
                            <asp:ListItem Text="Región" Value="Region" />
                            <asp:ListItem Text="Dirección" Value="Direccion" />
                            <asp:ListItem Text="Unidad" Value="Unidad" />
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="lblActividadReg">Actividad</label>
                        <asp:TextBox ID="txtActividadReg" class="form-control" runat="server" MaxLength="20"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblJerarquiaReg">Jerarquia</label>
                        <asp:TextBox ID="txtJerarquiaReg" class="form-control" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator"
                            ControlToValidate="txtJerarquiaReg" ValidationExpression="^\d+$" EnableClientScript="true"
                            ErrorMessage="Por favor ingresar solo numeros" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnGuardar" class="btn btn-default" runat="server" Text="Guardar" OnClick="Button1_Click" />

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
                                        <th>Codigo</th>
                                        <th>Nombre</th>
                                        <th>Tipo</th>
                                        <th>Actividad</th>
                                        <th>Jerarquia</th>
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
                                                <label for="lblNombreModReg">Nombre</label>
                                                <asp:TextBox ID="txtNombreModReg" class="form-control txtNombreModReg" runat="server" MaxLength="150"></asp:TextBox>
                                                <asp:TextBox ID="txtidRegionModReg" class="form-control txtidRegionModReg" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblCodigoModReg">Codigo</label>
                                                <asp:TextBox ID="txtCodigoModReg" class="form-control txtCodigoModReg" runat="server" MaxLength="50"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblTipoModReg">Tipo</label>
                                                <asp:DropDownList ID="ddlTipoModReg" class="form-control ddlTipoModReg" runat="server">
                                                    <asp:ListItem Text="Región" Value="0" />
                                                    <asp:ListItem Text="Dirección" Value="1" />
                                                    <asp:ListItem Text="Unidad" Value="2" />
                                                </asp:DropDownList>


                                            </div>
                                            <div class="form-group">
                                                <label for="lblActividadModReg">Actividad</label>
                                                <asp:TextBox ID="txtActividadModReg" class="form-control txtActividadModReg" runat="server" MaxLength="20"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblJerarquiaModReg">Jerarquia</label>
                                                <asp:TextBox ID="txtJerarquiaModReg" class="form-control txtJerarquiaModReg" runat="server" type=""></asp:TextBox>
                                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2"
                                                    ControlToValidate="txtJerarquiaModReg" ValidationExpression="^\d+$" EnableClientScript="true"
                                                    ErrorMessage="Por favor ingresar solo numeros" Display="Dynamic" SetFocusOnError="True" ForeColor="Red" />
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
                                                <asp:Label ID="lblNombreElReg" class="lblNombreElReg" runat="server" Text="Label"></asp:Label>
                                                <asp:TextBox ID="txtidRegionElReg" class="form-control txtidRegionElReg" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Codigo: </label>
                                                <asp:Label ID="lblCodigoElReg" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Tipo: </label>
                                                <asp:Label ID="lblTipoElReg" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Actividad: </label>
                                                <asp:Label ID="lblActividadElReg" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Jerarquia: </label>
                                                <asp:Label ID="lblJerarquiaElReg" runat="server" Text="Label"></asp:Label>
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
