<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="perfil.aspx.cs" Inherits="INAB_SAF.perfil" %>


<asp:Content ID="ContentPerfil" ContentPlaceHolderID="ContenidoSAF" runat="server">


		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Nuevo Perfil</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    
                                        <div class="form-group">
                                            <label for="exampleInputName2">Nombre</label>
                                            <asp:TextBox ID="username" class="form-control" runat="server"></asp:TextBox>
                                            <!--<input type="text" class="form-control" id="username" placeholder="Nombre del perfil">-->
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Nivel</label>
                                            <asp:DropDownList ID="DropDownList1" class="selectbox" runat="server">
                                                 <asp:ListItem Text="Nacional" Value="Nacional" />
                                                 <asp:ListItem Text="Regional" Value="Regional" />
                                                 <asp:ListItem Text="SubRegional" Value="SubRegional" />
                                            </asp:DropDownList>

                                             <!--<select class="selectbox" dir="auto">
                                                <optgroup label="Nivel">
                                                    <option value="CA">Nacional</option>
                                                    <option value="NV">Regional</option>
                                                    <option value="OR">SubRegional</option>
                                                </optgroup>
                                            
                                            </select>-->
                                        </div>
                                        <div class="form-group">
                                            <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                            <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Guardar" OnClick="Button1_Click"/>
                                            
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
                                            <th>Nombre</th>
                                            <th>Nivel</th>
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
                                            <asp:TextBox ID="nombreFuente" class="form-control nombreFuente" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="idPerfilSaf" class="form-control idPerfilSaf" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Nivel</label>
                                            <asp:DropDownList ID="nivelFuente" class="form-control nivelFuente" runat="server">
                                                 <asp:ListItem Text="Nacional" Value="0" />
                                                 <asp:ListItem Text="Regional" Value="1" />
                                                 <asp:ListItem Text="SubRegional" Value="2" />
                                            </asp:DropDownList>
                                            
                                        </div>
                                        <div class="form-group">
                                            <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                            <asp:Button ID="Modificar" class="btn btn-default" runat="server" Text="Modificar" OnClick="UpdatePerfil"/>
                                            
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
                                            <asp:TextBox ID="idPerfilSaf1" class="form-control idPerfilSaf1" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Nivel: </label>
                                            <asp:Label ID="lblNivel" runat="server" Text="Label"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                            <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Eliminar" OnClick="DeletePerfil"/>
                                            
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
		
