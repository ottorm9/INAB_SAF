<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="asigRol.aspx.cs" Inherits="INAB_SAF.asigRol" %>

<asp:Content ID="ContentAsigRol" ContentPlaceHolderID="ContenidoSAF" runat="server">
		
				    <div class="row">
                        <div class="col-xs-12">					
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">Asignar permiso y rol de usuario</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                        
                                        <div class="form-group">
                                            <label for="etnia">Usuario</label>
                                            <asp:DropDownList ID="usuario" runat="server" class="selectbox" OnLoad="Page_Load">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Perfil de usuario</label>
                                            <asp:DropDownList ID="perfil" runat="server" class="selectbox" OnLoad="Page_Load">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Rol de usuario</label>
                                            <asp:DropDownList ID="rol" runat="server" class="selectbox" OnLoad="Page_Load">
                                            </asp:DropDownList>
                                        </div>

                                        



                                         <div class="panel-group" id="accordion">
                                          <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Solicitud de compra</a>
                                              </h4>
                                            </div>
                                            <div id="collapse1" class="panel-collapse collapse in">
                                              <div class="panel-body">
                                                  
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Crear
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Modificar
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Eliminar
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Imprimir
                                                    </label>
                                                  </div>

                                              </div>
                                            </div>
                                          </div>
                                          <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Presupuesto</a>
                                              </h4>
                                            </div>
                                            <div id="collapse2" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Emitir cuadro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Validar cuadro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Autorizar cuadro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Consignar partida
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Aprobar partida
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>
                                          <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Facturas</a>
                                              </h4>
                                            </div>
                                            <div id="collapse3" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Crear
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Modificar
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Generar Constancia
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">Viaticos</a>
                                              </h4>
                                            </div>
                                            <div id="collapse4" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Anticipo
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Liquidacion
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">Almacen</a>
                                              </h4>
                                            </div>
                                            <div id="collapse5" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Registro ingreso
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Registro salida
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Imprimir constancia
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>

                                             <div class="panel panel-default">
                                            <div class="panel-heading">
                                              <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">Consultas y Reportes</a>
                                              </h4>
                                            </div>
                                            <div id="collapse6" class="panel-collapse collapse">
                                              <div class="panel-body">
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-1" checked="">
                                                    <label for="checkbox-fa-light-1">
                                                      Generar y editar libro
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-2" checked="">
                                                    <label for="checkbox-fa-light-2">
                                                      Generar y edigar Arqueo
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-3" checked="">
                                                    <label for="checkbox-fa-light-3">
                                                      Liquidar Caja Chica
                                                    </label>
                                                  </div>
                                                  <div class="checkbox3 checkbox-success checkbox-inline checkbox-check checkbox-round  checkbox-light">
                                                    <input type="checkbox" id="checkbox-fa-light-4" checked="">
                                                    <label for="checkbox-fa-light-4">
                                                      Reportes de consulta
                                                    </label>
                                                  </div>
                                              </div>
                                            </div>
                                          </div>



                                        </div> 

                                        
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-default">Guardar</button>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
					
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Usuarios con permisos y roles asignados
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Usuario</th>
                                            <th>Perfil</th>
                                            <th>Rol</th>
                                            <th>Modulo</th>
                                            <th>Permiso</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Crear</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Modificar</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>                                        
                                        <tr class="even gradeC">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Eliminar</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>                                        
                                        <tr class="even gradeC">
                                            <td>Nilson Reguan</td>
                                            <td>Administrador Nacional</td>
                                            <td>Super Usuario</td>
                                            <td class="center">Solicitud de compra</td>
                                            <td class="center">Imprimir</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>

                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Emitir cuadro</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Validar cuadro</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Autorizar cuadro</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Consignar partida</td>
                                            <td><button class="btn btn-danger"><i class="fa fa-pencil"></i> Eliminar</button></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>Otto Hernandez</td>
                                            <td>Director Subregional</td>
                                            <td>Administrador Nacional</td>
                                            <td class="center">Presupuesto</td>
                                            <td class="center">Aprobar partida</td>
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
				
  </asp:Content>	
