
Program Abril2023;

Const 
    cantidad =   2000;

Type 
    cantFacturas =   1..cantidad;

    factura =   Record
        num:   Integer;
        codCliente:   Integer;
        codSucursal:   Integer;
        monto:   Real;
    End;

    vector =   array[cantFacturas] Of factura;

Function mayorFacturacion(v: vector; dimL: Integer):   Integer;

Var 
    cant, cantMax, cod, codMax, i:   Integer;
Begin
    cantMax := -1;
    codMax := 0;
    For i:= 1 To dimL Do
        Begin
            cod := v[i].codSucursal;
            cant := 0;
            While (v[i].codSucursal = cod) Do
                cant := cant + 1;
            If (cant > cantMax) Then
                Begin
                    cantMax := cant;
                    codMax := cod;
                End;
        End;
    mayorFacturacion := codMax;
End;

Var 
    v:   vector;
    dimL:   Integer;

Begin
    cargarVector(v, dimL);
    If (dimL > 0) Then
        WriteLn('El codigo de sucursal con mayor cantidad de factura es: ', mayorFacturacion(v, dimL))
    Else
        WriteLn('No hay facturacion');
End.
