<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Dest_Archivos.Pages.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
        <div class="col-md-4">
            <div class="thumbnail">
                <img src="../Content/imagenes/if_office-20_809598.png" alt="" />
                <div class="caption">
                    <h3>Destucción de archivos</h3>
                    <p>Registro de la destrucción de archivos</p>
                </div>
            </div>
        </div>
    </div>
    <dx:ASPxHiddenField ID="hfSess" ClientInstanceName="hfSess" runat="server"></dx:ASPxHiddenField>
</asp:Content>
