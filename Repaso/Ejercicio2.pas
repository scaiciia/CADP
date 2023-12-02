Program Ejercicio2;
type

    cliente = record
        cod: Integer;
        dni: Integer;
        ape: String;
        nom: String;
        codPoliza: Integer;
        monto: Real;
    end;

    lista = ^ nodo;

    nodo = record
        dato: cliente;
        psig: lista;
    end;

    vector = array[1..6] of Real;

procedure inicializar(var l: lista; var v: vector);
    var
        i: Integer;
    begin
        l:= nil;
        for i:= 1 to 6 do begin
            WriteLn('Ingrese el monto para la poliza ', i);
            ReadLn(v[i]);
        end;
    end;

procedure cargarDatos(var l: lista);
    var
        n: lista;
        aux: cliente;
    begin
        repeat
            WriteLn('Ingrese codigo de cliente');
            ReadLn(aux.cod);
            WriteLn('Ingrese DNI del cliente');
            ReadLn(aux.dni);
            WriteLn('Ingrese Apellido del cliente');
            ReadLn(aux.ape);
            WriteLn('Ingrese Nombre del cliente');
            ReadLn(aux.nom);
            WriteLn('Ingrese el codigo de poliza');
            ReadLn(aux.codPoliza);
            WriteLn('Ingrese el monto basico');
            ReadLn(aux.monto);
            new(n);
            n^.dato:= aux;
            n^.psig:= l;
            l:= n;
        until (aux.cod = 1122);
    end;

procedure imprimir(var l: lista; v: vector);
    var
        act: lista;
        total: Real;
    begin
        act:= l;
        while (act <> nil) do begin
            total:= act^.dato.monto + v[act^.dato.codPoliza];
            WriteLn('DNI: ', act^.dato.dni);
            WriteLn('Apellido: ', act^.dato.ape);
            WriteLn('Nombre: ', act^.dato.nom);
            WriteLn('Monto total a pagar: $', total);
            act:= act^.psig;
        end;
    end;

procedure imprimirDosNueve(var l: lista);
    var
        act: lista;
        dni, cNueve, n: Integer;
    begin
        act:= l;
        while (act <> nil) do begin
            dni:= act^.dato.dni;
            cNueve:= 0;
            while ((dni <> 0) and (cNueve < 2)) do begin
                n:= dni mod 10;
                if (n = 9) then
                    cNueve:= cNueve + 1;
                dni:= dni div 10;
            end;
            if (cNueve = 2) then begin
                WriteLn('Apellido: ', act^.dato.ape);
                WriteLn('Nombre: ', act^.dato.nom);
            end;
            act:= act^.psig;
        end;
    end;

procedure eliminarCliente(var l: lista);
    var
        ant, act: lista;
        cod: Integer;
    begin
        WriteLn('Ingrese el codigo de cliente a eliminar');
        ReadLn(cod);
        act:= l;
        while (act^.dato.cod = cod) do begin
            ant:= act;
            act:= act^.psig;
        end;
        if (act = l) then
            l:= act^.psig
        else
            ant^.psig:= act^.psig;
        Dispose(act);
    end;

var
    l: lista;
    v: vector;

begin
    inicializar(l, v);
    cargarDatos(l);
    imprimir(l, v);
    imprimirDosNueve(l);
    eliminarCliente(l);
end.