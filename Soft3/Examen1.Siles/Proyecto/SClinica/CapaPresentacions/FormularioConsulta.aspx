<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="FormularioConsulta.aspx.cs" Inherits="CapaPresentacions.FormularioConsulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="row">
        <div class="col-md-6">

            <asp:Panel ID="ErrorPanel" runat="server" Visible="false"
                CssClass="alert alert-danger" role="alert">
                Error al Guardar el Atencion de Consulta
            </asp:Panel>

            <div class="form-group">
                <label>Fecha</label>
                <asp:TextBox ID="fechaTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="fechaTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Fecha">
                </asp:RequiredFieldValidator>
                <br />
                <br />

                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="136px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="306px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>


            </div>
            

             <div class="form-group">
                <label>Observacion</label>
                <asp:TextBox ID="observacionTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="observacionTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Observacion">
                </asp:RequiredFieldValidator>
            </div>

             <div class="form-group">
                <label>Diagnostico</label>
                <asp:TextBox ID="DiagnosticoTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="DiagnosticoTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Diagnostico">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label>Estudio</label>
                <asp:TextBox ID="EstudioTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="EstudioTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Estudio">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label>Id Cita</label>
                <asp:TextBox ID="cita_IdTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="cita_IdTextBox"
                    Display="Dynamic"
                    ForeColor="Red"
                    ValidationGroup="Consulta"
                    ErrorMessage="Debe ingresar el Id Cita">
                </asp:RequiredFieldValidator>
            </div>


            <asp:LinkButton ID="SaveButton" runat="server"
                CssClass="btn btn-primary"
                ValidationGroup="Consulta"
                OnClick="SaveButton_Click">
                Guardar
            </asp:LinkButton>

           

             <asp:HyperLink runat="server" CssClass="btn"
                NavigateUrl="~/ListaAtencionConsultas.aspx">
                Cancelar
            </asp:HyperLink>

            <asp:HiddenField ID="ConsultaIdHiddenField" runat="server" Value="0" />
        </div>
    </section>

</asp:Content>
