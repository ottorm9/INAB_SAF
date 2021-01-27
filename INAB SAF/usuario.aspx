<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="usuario.aspx.cs" Inherits="INAB_SAF.usuario" %>

<asp:Content ID="ContentUsuario" ContentPlaceHolderID="ContenidoSAF" runat="server">
		
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
                                            <label for="exampleInputName2">Nombre</label>
                                            <!--<input type="text" class="form-control" id="username" placeholder="Nombre del usuario">-->
                                            <asp:TextBox ID="nombre" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Correo institucional</label>
                                            <asp:TextBox ID="correoInstitucional" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">Correo personal</label>
                                            <asp:TextBox ID="correoPersonal" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">DPI</label>
                                            <asp:TextBox ID="dpi" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputName2">Contraseña</label>
                                            <asp:TextBox ID="contrasenia" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Etnia</label>
                                            <asp:DropDownList ID="etnia" runat="server" class="selectbox" OnLoad="Page_Load">
                                                
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="etnia">Idioma</label>
                                            <asp:DropDownList ID="idioma" class="selectbox" runat="server">

                                            </asp:DropDownList>
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
            
</asp:Content>			
                	
			
		