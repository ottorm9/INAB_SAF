<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="subregion.aspx.cs" Inherits="INAB_SAF.subregion" %>

<asp:Content ID="ContentSubregion" ContentPlaceHolderID="ContenidoSAF" runat="server">


    <div id="not visible" style="display: none;">
        <asp:TextBox ID="txtError" runat="server"></asp:TextBox>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="card-title">
                        <div class="title">Nueva SubRegión</div>
                    </div>
                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label for="lblRegionSub">Región</label>
                        <asp:DropDownList ID="ddlIdRegionSub" class="selectbox ddlIdRegionSub" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="lblMunicipioSub">Municipio</label>
                        <asp:DropDownList ID="ddlIdMunicipioSub" class="selectbox ddlIdMunicipioSub" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="lblNombreSub">Nombre</label>
                        <asp:TextBox ID="txtNombreSub" class="form-control txtNombreSub" runat="server" MaxLength="150"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblCodigoSub">Codigo</label>
                        <asp:TextBox ID="txtCodigoSub" class="form-control txtCodigoSub" runat="server" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="lblTipoSub">Tipo</label>
                        <asp:DropDownList ID="ddlTipoSub" class="selectbox ddlTipoSub" runat="server">
                            <asp:ListItem Text="SubRegion" Value="Subregion" />
                            <asp:ListItem Text="SubDireccion" Value="Subdireccion" />
                        </asp:DropDownList>
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
                                        <th>Region</th>
                                        <th>Municipio</th>
                                        <th>Departamento</th>
                                        <th>Nombre</th>
                                        <th>Codigo</th>
                                        <th>Tipo</th>
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
                                                <label for="lblRegionModSub">Región</label>
                                                <asp:DropDownList ID="ddlIdRegionModSub" class="form-control ddlIdRegionModSub" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblMunicipioModSub">Municipio</label>
                                                <asp:DropDownList ID="ddlIdMunicipioModSub" class="form-control ddlIdMunicipioModSub" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblNombreModSub">Nombre</label>
                                                <asp:TextBox ID="txtNombreModSub" class="form-control txtNombreModSub" runat="server" MaxLength="150"></asp:TextBox>
                                                <asp:TextBox ID="txtIdSubRegionModSub" class="form-control txtIdSubRegionModSub" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblCodigoMod">Codigo</label>
                                                <asp:TextBox ID="txtCodigoModSub" class="form-control txtCodigoModSub" runat="server" MaxLength="50"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="lblTipoModSub">Tipo</label>
                                                <asp:DropDownList ID="ddlTipoModSub" class="form-control ddlTipoModSub" runat="server">
                                                    <asp:ListItem Text="SubRegion" Value="0" />
                                                    <asp:ListItem Text="SubDireccion" Value="1" />
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
                                                <label for="exampleInputEmail2">Región: </label>
                                                <asp:Label ID="lblIdRegionElSub" class="lblIdRegionElSub" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Municipio: </label>
                                                <asp:Label ID="lblIdMunicipioElSub" class="lblIdMunicipioElSub" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Nombre: </label>
                                                <asp:Label ID="lblNombreElSub" class="lblNombreElSub" runat="server" Text="Label"></asp:Label>
                                                <asp:TextBox ID="txtIdSubRegionElSub" class="form-control txtIdSubRegionElSub" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Codigo: </label>
                                                <asp:Label ID="lblCodigoElSub" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputEmail2">Tipo: </label>
                                                <asp:Label ID="lblTipoElSub" runat="server" Text="Label"></asp:Label>
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
