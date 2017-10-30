function validaCentroCost(s,e)
{
    var CCosto = e.value;
    if (cmbCCosto.GetItemCount() > 0)
    {
        if (CCosto.length == 0)
        {
            e.isValid = false;
            e.errorText = "Se debe seleccionar un centro de costos";
        }
    }
}//fin validaCentroCost

function GrabaLog()
{
    var datos = txtNomArchivo.GetText() + ';' + cmbCliente.GetValue() + ';' + cmbCCosto.GetValue() + ';' + txtObserva.GetText() + ';' + uplImagen.GetText();
    cGraba.PerformCallback(datos);
}

function complet_cGraba(s,e)
{
    if (e.result === 'OK')
    {
        bpopMensaje.Show();
        lblMensaje.SetText("Registro grabado");
        Limpiar();
    }
}

function carga_cmbCCosto()
{
    cmbCCosto.PerformCallback(cmbCliente.GetValue());
}

function Limpiar()
{
    txtNomArchivo.SetText('');
    cmbCliente.SetValue('');
    cmbCCosto.SetValue('');
    txtObserva.SetText('');
    uplImagen.SetText('');
}
