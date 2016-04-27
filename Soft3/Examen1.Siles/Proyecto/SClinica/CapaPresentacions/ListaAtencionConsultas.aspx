<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ListaAtencionConsultas.aspx.cs" Inherits="CapaPresentacions.ListaAtencionConsultas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="row">
        <div class="col-md-12">

            <asp:HyperLink runat="server" NavigateUrl="~/FormularioConsulta.aspx"
                CssClass="btn btn-primary">
                Crear Consulta
            </asp:HyperLink>

            <asp:HyperLink runat="server" NavigateUrl="~/FormularioConsulta.aspx"
                CssClass="btn btn-primary">
                Salir
            </asp:HyperLink>
            <br /><br />
            <asp:GridView ID="MinuevaTabla" runat="server" 
                CssClass="table" GridLines="None"
                AutoGenerateColumns="false" OnRowCommand="MinuevaTabla_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Editar"
                                CommandArgument='<%# Eval("consultaId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Eliminar"
                                OnClientClick="return confirm('Esta seguro que desea eliminar el consultaId seleccionado?')"
                                CommandArgument='<%# Eval("consultaId") %>'>
                                <i class="glyphicon glyphicon-remove"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="fechaHora" HeaderText="Fecha" />
                    <asp:BoundField DataField="observacion" HeaderText="Observacion" />
                    <asp:BoundField DataField="diagnostico" HeaderText="Diagnostico" />
                    <asp:BoundField DataField="estudio" HeaderText="Estudio" />
                    <asp:BoundField DataField="citaId" HeaderText="Id Cita" />

                </Columns>



            </asp:GridView>

        </div>


    </section>

</asp:Content>
