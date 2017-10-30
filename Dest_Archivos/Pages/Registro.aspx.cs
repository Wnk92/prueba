using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dest_Archivos.Datos;

namespace Dest_Archivos.Pages
{
    public partial class Registro : System.Web.UI.Page
    {
        DDatos objDat = new DDatos();
        private string Ruta = "~/Upload/";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargaClientes();
            }
        }

        private void CargaClientes()
        {
            cmbCliente.DataSource = objDat.ListaClientes();
            cmbCliente.TextField = "nomcliente";
            cmbCliente.ValueField = "idcliente";
            cmbCliente.DataBindItems();
        }

        protected void cmbCCosto_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            objDat.IdCliente = e.Parameter;
            cmbCCosto.DataSource = objDat.ListaCCosto();
            cmbCCosto.TextField = "centrocosto";
            cmbCCosto.ValueField = "centrocosto";
            cmbCCosto.DataBindItems();
        }

        protected void uplImagen_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            try
            {

            }
            catch(Exception ex)
            {

            }
        }//fin uplImagen_FileUploadComplete

        protected void cGraba_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            try
            {
                string[] Parametros = e.Parameter.Split(';');
                objDat.NomArchivo= Parametros[0].ToString();
                objDat.IdUsr = "";
                objDat.IdCliente= Parametros[1].ToString();
                objDat.CCosto= Parametros[2].ToString();
                objDat.Imagen= Parametros[4].ToString();
                objDat.Observaciones= Parametros[3].ToString();
                objDat.GrabaLog();
                e.Result = "OK";
            }
            catch(Exception ex)
            {
                e.Result = ex.Message;
            }
        }//fin cGraba_Callback
    }
}