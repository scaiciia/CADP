Program Ejercicio3;

type

    viaje = record
        num: Integer;
        cod: Integer;
        dirOrigen: String;
        dirDestino: String;
        km: Real;
    end;

    lista = ^ nodo;

    nodo = record
        dato: viaje;
        psig: lista;
    end;

procedure cargarLista(var l: lista);
    var
        n, act, ant: lista;
        aux: viaje;
        rta: String;
    begin
        WriteLn('Desea ingresar un viaje? (S/N)');
        ReadLn(rta);
        while ((rta = 'S') or (rta = 's')) do begin
            WriteLn('Ingrese numero de viaje');
            ReadLn(aux.num);
            WriteLn('Ingrese codigo de auto');
            ReadLn(aux.cod);
            WriteLn('Ingrese dirección de origen');
            ReadLn(aux.dirOrigen);
            WriteLn('Ingrese dirección de destino');
            ReadLn(aux.dirDestino);
            WriteLn('Ingrese km recorridos');
            ReadLn(aux.km);
            new(n);
            n^.dato:= aux;
            act:= l;
            while ((n^.dato.cod > l^.dato.cod) and (act <> nil)) do begin
                ant:= act;
                act:= act^.psig;
            end;
            if (act = l) then begin
                n^.psig:= l;
                l:= n;
            end
            else begin
                n^.psig:= act;
                ant^.psig:= n;
            end;
            WriteLn('Desea ingresar otro viaje? (S/N)');
            ReadLn(rta);
        end;
    end;

procedure masKilometros(var l: lista);
    var
        act: lista;
        cod1, cod2, cod: Integer;
        km1, km2, suma: Real;
    begin
        km1:= -1;
        km2:= -1;
        act:= l;
        cod:= -1;
        suma:= 0;
        while (act <> nil) do begin
            if (act^.dato.cod = cod) then begin
                suma:= suma + act^.dato.km;
            end
            else begin
                if (suma > km1) then begin
                    km2:= km1;
                    cod2:= cod1;
                    km1:= suma;
                    cod1:= cod;
                end
                else begin
                    if (suma > km2) then begin
                        km2:= suma;
                        cod2:= cod;
                    end;
                end;
                cod:= act^.dato.cod;
                suma:= 0;
            end;
            act:= act^.psig;
        end;
        WriteLn('Los codigos de auto que mas km recorrieron son: ', cod1, ' y ', cod2);
    end;

procedure generarLista5km(var l: lista; var l5km: lista);
    var
        n, act, ant5km, act5km: lista;
    begin
        l5km:= nil;
        act:= l;
        while (act <> nil) do begin
            if (act^.dato.km > 5) then begin
                new(n);
                n^.dato:= act^.dato;
            end;
            act5km:= l5km;
            while ((n^.dato.num > act5km^.dato.num) and (act5km <> nil)) do begin
                ant5km:= act5km;
                act5km:= act5km^.psig;
            end;
            if (act5km = l5km) then begin
                n^.psig:= l5km;
                l5km:= n;
            end
            else begin
                n^.psig:= act5km;
                ant5km^.psig:= n;
            end;
            act:= act^.psig;
        end;
    end;

var
    l, l5km: lista;

begin
    cargarLista(l);
    masKilometros(l);
    generarLista5km(l, l5km);
end.