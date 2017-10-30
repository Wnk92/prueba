using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Web;
using System.Data;
using System.Configuration;

namespace Dest_Archivos.Datos
{
    public class DDatos
    {
        string Cadena = ConfigurationManager.ConnectionStrings["conexAPP"].ToString();
        private DataTable TSalida = new DataTable();
        private string _NomArchivo = "";
        private string _IdUsr = "";
        private string _IdCliente = "";
        private string _CCosto = "";
        private string _Imagen = "";
        private string _Observaciones = "";
        
        public string NomArchivo
        {
            set { _NomArchivo = value.Trim(); }
        }

        public string IdUsr
        {
            set { _IdUsr = value; }
        }

        public string IdCliente
        {
            set { _IdCliente = value; }
        }

        public string CCosto
        {
            set { _CCosto = value; }
        }

        public string Imagen
        {
            set { _Imagen = value; }
        }

        public string Observaciones
        {
            set { _Observaciones = value.Trim(); }
        }

        public DataTable ListaClientes()
        {
            try
            {
                TSalida.Clear();
                using (MySqlConnection Conex = new MySqlConnection(Cadena))
                {
                    using (MySqlCommand Coman = new MySqlCommand())
                    {
                        Coman.Connection = Conex;
                        Coman.CommandType = CommandType.StoredProcedure;
                        Coman.CommandText = "pa_listaclientes";
                        using (MySqlDataAdapter Adap = new MySqlDataAdapter())
                        {
                            Adap.SelectCommand = Coman;
                            Adap.Fill(TSalida);
                            return TSalida;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar los clientes " + ex.Message);
            }
        }//fin 

        public DataTable ListaCCosto()
        {
            try
            {
                TSalida.Clear();
                using (MySqlConnection Conex = new MySqlConnection(Cadena))
                {
                    using (MySqlCommand Coman = new MySqlCommand())
                    {
                        Coman.Connection = Conex;
                        Coman.CommandType = CommandType.StoredProcedure;
                        Coman.CommandText = "lista_ccsotoidclie";
                        Coman.Parameters.Add("in_idcliente", MySqlDbType.VarChar, 50).Value = _IdCliente;
                        using (MySqlDataAdapter Adap = new MySqlDataAdapter())
                        {
                            Adap.SelectCommand = Coman;
                            Adap.Fill(TSalida);
                            return TSalida;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar los centros de costos " + ex.Message);
            }
        }

        public void GrabaLog()
        {
            try
            {
                using (MySqlConnection Conex = new MySqlConnection(Cadena))
                {
                    using (MySqlCommand Coman = new MySqlCommand())
                    {
                        Coman.Connection = Conex;
                        Coman.CommandType = CommandType.StoredProcedure;
                        Coman.CommandText = "pa_grabalogdestarch";
                        Coman.Parameters.Add("in_nomarchivo", MySqlDbType.VarChar,50).Value = _NomArchivo;
                        Coman.Parameters.Add("in_idusr", MySqlDbType.VarChar,30).Value = _IdUsr;
                        Coman.Parameters.Add("in_idcliente", MySqlDbType.VarChar,50).Value =_IdCliente ;
                        Coman.Parameters.Add("in_ccosto", MySqlDbType.VarChar,50).Value = _CCosto;
                        Coman.Parameters.Add("in_imagen", MySqlDbType.VarChar,50).Value = _Imagen;
                        Coman.Parameters.Add("in_observaciones", MySqlDbType.VarChar,500).Value = _Observaciones;
                        Conex.Open();
                        Coman.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("" + ex.Message);
            }
        }//fin GrabaLog
    }
}