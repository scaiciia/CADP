
Program Octubre2023;

Const 
    cantidad =   5;

Type 
    cantSucursal =   1..cantidad;

    lista =   ^ nodo;

    factura =   Record
        num:   Integer;
        codCli:   Integer;
        suc:   cantSucursal;
        monto:   Real;
    End;

    nodo =   Record
        dato:   factura;
        sig:   lista;
    End;

Procedure eliminarFacturas(Var l: lista; Var cant: Integer; suc: cantSucursal);

Var 
    ant, act:   lista;
Begin
    act := aux;
    While (act <> Nil) Do
        Begin
            If (act^.dato.suc = suc) Then
                Begin
                    If (act = l) Then
                        Begin
                            l := act^.sig;
                            ant := l;
                        End
                    Else
                        ant^.sig := act^.sig;
                    dispose(act);
                    act := ant;
                    cant := cant + 1;
                End
            Else
                Begin
                    ant := act;
                    act := act^.sig;
                End;
        End;
End;

Var 
    l:   lista;
    cant:   Integer;
    suc:   cantSucursal;

Begin
    WriteLn('Ingrese el codigo de sucursal que quiere eliminar las facturas (1-5)');
    ReadLn(suc);
    cant := 0;
    eliminarFacturas(l, cant, suc);
    WriteLn('La cantidad de facturas eliminadas es: ', cant);
End.
