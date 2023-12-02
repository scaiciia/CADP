Program Ejercicio1;

type
    personas = record
        dni: Integer;
        ApeyNom: String;
        edad: Integer;
        cod: Integer;
    end;

    puntero = ^ nodo;

    nodo = record
        dato: personas;
        psig: puntero;
    end;

    vector = array[1..5] of Integer;

procedure inicializar(var l: puntero; var v: vector);
    var
        i: Integer;
    begin
        l:= nil;
        for i:= 1 to 5 do
          v[i]:= 0;
    end;

procedure cargarLista(var l: puntero; var v: vector);
    var
        aux: personas;
        n: puntero;

    begin
        repeat
            WriteLn('Ingrese un numero de documento');
            ReadLn(aux.dni);
            WriteLn('Apellido y Nombre');
            ReadLn(aux.ApeyNom);
            WriteLn('Ingrese edad');
            ReadLn(aux.edad);
            WriteLn('Ingrese codigo (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror)');
            ReadLn(aux.cod);
            v[aux.cod]:= v[aux.cod] + 1;
            new(n);
            n^.dato:= aux;
            n^.psig:= l;
            l:= n;
        until (aux.dni = 33555444);
    end;

procedure masParesqImpares(var l: puntero);
    var
        aux: puntero;
        dni, c, cPar, cImpar, n: Integer;
    begin
        aux:= l;
        c:= 0;
        while (aux <> nil) do begin
            dni:= aux^.dato.dni;
            cPar:= 0;
            cImpar:= 0;
            while (dni <> 0) do begin
                n:= dni mod 10;
                if (n mod 2 = 0) then
                    cPar:= cPar + 1
                else
                    cImpar:= cImpar + 1;
                dni:= dni div 10;
            end;
            if (cPar > cImpar) then
                c:= c + 1;
        end;
        WriteLn('La cantidad de personas cuyo DNI contiene mas numeros par que impar es: ', c);
    end;

procedure generosMasElegidos(v: vector);
    var
        i, uno, dos: Integer;
    begin
        if (v[1] > v[2]) then
            begin
                uno:= 1;
                dos:= 2;
            end
        else
            begin
                uno:= 2;
                dos:= 1;
            end;
        for i:= 3 to 5 do begin
            if (v[i] > v[uno]) then
                begin
                    dos:= uno;
                    uno:= i;
                end
            else
                if (v[i] > v[dos]) then
                    dos:= i;
        end;
        WriteLn('Los dos códigos de género más elegidos son: ', uno, ' y ', dos);
    end;

procedure eliminarPorDNI(var l: puntero);
    var
        ant, act: puntero;
        dni: Integer;
    begin
        WriteLn('Ingrese el DNI a eliminar');
        ReadLn(dni);
        act:= l;
        while ((act <> nil) and (act^.dato.dni <> dni)) do begin
            ant:= act;
            act:= act^.psig;
        end;
        if (act <> nil) then begin
            if (act = l) then
                l:= l^.psig
            else
                ant^.psig:= act^.psig;
            dispose(act);
        end;
    end;

var
    l: puntero;
    v: vector;

begin
    inicializar(l, v);
    cargarLista(l, v);
    masParesqImpares(l);
    generosMasElegidos(v);
    eliminarPorDNI(l);
end.