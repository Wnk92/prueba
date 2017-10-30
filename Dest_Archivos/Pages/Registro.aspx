<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Dest_Archivos.Pages.Registro" %>
<%@ Register Src="~/UserControls/Mensaje.ascx" TagPrefix="dx" TagName="Mensaje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script id="dxis_jsRegistro" type="text/javascript" src="../Scripts/jsRegistro.js"></script>
    <div class="title page-header">                    
        <h3>Registro destrucción de archivos</h3>
    </div>
    <dx:BootstrapFormLayout runat="server" LayoutType="Vertical" ID="blRegistro">
        <Items>
            <dx:BootstrapLayoutItem ColSpanMd="4" Caption="Nombre del archivo">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapTextBox runat="server" ID="txtNomArchivo" ClientInstanceName="txtNomArchivo" MaxLength="50">
                            <ValidationSettings ValidationGroup="valGrabar">
                                <RequiredField IsRequired="true" ErrorText="El nombre del archivo es requerido." />
                            </ValidationSettings>
                        </dx:BootstrapTextBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem ColSpanMd="1" ShowCaption="False">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapButton ID="btnGraba" ClientInstanceName="btnGraba" runat="server" AutoPostBack="false" ValidationGroup="valGrabar" CssClasses-Icon="glyphicon glyphicon-floppy-disk">
                            <CssClasses Icon="glyphicon glyphicon-floppy-disk"></CssClasses>
                            <ClientSideEvents Click="function(s, e) {GrabaLog();}" />
                        </dx:BootstrapButton>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem Caption="Cliente" ColSpanMd="6" BeginRow="true">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapComboBox ID="cmbCliente" ClientInstanceName="cmbCliente" runat="server" IncrementalFilteringMode="Contains" CallbackPageSize="25" EnableCallbackMode="true">
                            <ValidationSettings ValidationGroup="valGrabar">
                                <RequiredField IsRequired="true" ErrorText="Por favor seleccionar el cliente" />
                            </ValidationSettings>
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {carga_cmbCCosto();}" />
                        </dx:BootstrapComboBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem Caption="Centro de costos" ColSpanMd="5">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapComboBox ID="cmbCCosto" runat="server" ClientInstanceName="cmbCCosto" OnCallback="cmbCCosto_Callback">                            
                            <ClientSideEvents Validation="validaCentroCost" />
                        </dx:BootstrapComboBox>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem Caption="Observaciones" BeginRow="true" ColSpanMd="11">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapMemo ID="txtObserva" ClientInstanceName="txtObserva" runat="server"></dx:BootstrapMemo>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
            <dx:BootstrapLayoutItem BeginRow="true" Caption="Evidencia" ColSpanMd="6">
                <ContentCollection>
                    <dx:ContentControl>
                        <dx:BootstrapUploadControl ID="uplImagen" runat="server" ClientInstanceName="uplImagen" ShowUploadButton="true" OnFileUploadComplete="uplImagen_FileUploadComplete"></dx:BootstrapUploadControl>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:BootstrapLayoutItem>
        </Items>
    </dx:BootstrapFormLayout>
    <dx:Mensaje runat="server" />
    <dx:ASPxCallback ID="cGraba" ClientInstanceName="cGraba" runat="server" OnCallback="cGraba_Callback"></dx:ASPxCallback>
    <dx:ASPxHiddenField ID="hfEstado" ClientInstanceName="hfEstado" runat="server"></dx:ASPxHiddenField>
</asp:Content>
