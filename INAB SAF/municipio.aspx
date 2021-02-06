<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="municipio.aspx.cs" Inherits="INAB_SAF.municipio" %>

<asp:Content ID="ContentMunicipio" ContentPlaceHolderID="ContenidoSAF" runat="server">


    <div id="not visible" style="display: none;">
        <asp:TextBox ID="txtError" runat="server"></asp:TextBox>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="card-title">
                        <div class="title">Nuevo Municipio</div>
                    </div>
                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label for="lblNombreMun">Nombre</label>
                        <asp:TextBox ID="txtNombreMun" class="form-control" runat="server" MaxLength="100"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblCodigoMun">Codigo</label>
                        <asp:TextBox ID="txtCodigoMun" class="form-control" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblIdDepartamentoMun">Departamento</label>
                        <asp:DropDownList ID="ddlIdDepartamentoMun" class="selectbox" runat="server">
                        </asp:DropDownList>
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
                                        <th>Departamento</th>
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
                                                <label for="lblNombreModMun">Nombre</label>
                                                <asp:TextBox ID="txtNombreModMun" class="form-control txtNombreModMun" runat="server" MaxLength="100"></asp:TextBox>
                                                <asp:TextBox ID="txtIdMunicipioModMun" class="form-control txtIdMunicipioModMun" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblCodigoModMun">Codigo</label>
                                                <asp:TextBox ID="txtCodigoModMun" class="form-control txtCodigoModMun" runat="server" MaxLength="50"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblTipoModMun">Departamento</label>
                                                <asp:DropDownList ID="ddlIdDepartamentoModMun" class="form-control ddlIdDepartamentoModMun" runat="server">
                                                </asp:DropDownList>
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
                                                <asp:Label ID="lblNombreElMun" class="lblNombreElMun" runat="server" Text="Label"></asp:Label>
                                                <asp:TextBox ID="txtIdMunicipioElMun" class="form-control txtIdMunicipioElMun" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Codigo: </label>
                                                <asp:Label ID="lblCodigoElMun" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Departamento: </label>
                                                <asp:Label ID="lblIdDepartamentoElMun" runat="server" Text="Label"></asp:Label>
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
