<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Mensaje.ascx.cs" Inherits="Dest_Archivos.UserControls.Mensaje" %>
<dx:BootstrapPopupControl runat="server" ID="bpopMensaje" ClientInstanceName="bpopMensaje" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="false" 
    CloseAction="CloseButton" HeaderText="Mensaje" Width="350" CloseOnEscape="True">
    <ContentCollection>
        <dx:ContentControl>
            <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server" SettingsItems-ShowCaption="False">
                <SettingsItems ShowCaption="False"></SettingsItems>
                    <Items>
                        <dx:BootstrapLayoutItem ShowCaption="False" ColSpanMd="12">
                            <ContentCollection>
                                <dx:ContentControl>
                                    <dx:ASPxLabel ID="lblMensaje" runat="server" ClientInstanceName="lblMensaje"></dx:ASPxLabel>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:BootstrapLayoutItem>                                          
                    </Items>
                </dx:BootstrapFormLayout>                            
            </dx:ContentControl>
        </ContentCollection>
</dx:BootstrapPopupControl>