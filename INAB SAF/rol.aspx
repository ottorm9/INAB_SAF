<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="rol.aspx.cs" Inherits="INAB_SAF.rol" %>


<asp:Content ID="ContentRol" ContentPlaceHolderID="ContenidoSAF" runat="server">
		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Nuevo Rol de Usuario</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    
                                        <div class="form-group">
                                            <label for="exampleInputName2">Nombre</label>
                                            <asp:TextBox ID="NombreRol" class="form-control NombreRol"  runat="server"></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                                            <asp:Button ID="GuardarRol" class="btn btn-default" runat="server" Text="Guardar" OnClick="InsertRol" />
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
					
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Roles de Usuario Creados
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
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
                                            <asp:TextBox ID="nombreRol1" class="form-control nombreRol1" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="idRolSaf" class="form-control idRolSaf" runat="server"></asp:TextBox>
                                        </div>
                                        
                                        <div class="form-group">
                                            <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                            <asp:Button ID="Modificar" class="btn btn-default" runat="server" Text="Modificar" OnClick="UpdateRol"/>
                                            
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
                                            <asp:TextBox ID="idRol1" class="form-control idRol1" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <!--<button type="submit" class="btn btn-default">Guardar</button>-->
                                            <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Eliminar" OnClick="DeleteRol"/>
                                            
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
