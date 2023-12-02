Program Ejercicio4;

type

    vector = array[1..42] of Real;

    regPeso = record
        vPeso: vector;
        dimL: Integer;
    end;

    paciente = record
        nom: String;
        ape: String;
        peso: regPeso;
    end;

    lista = ^ nodo;

    nodo = record
        dato: paciente;
        psig: lista;
    end;

procedure cargarLista(var l: lista);
    var
        aux: paciente;
        n: lista;
        rta, rta2: String;
    begin
        WriteLn('Desea ingresar un paciente? (S/N)');
        ReadLn(rta);
        while ((rta = 'S') or (rta = 's')) do begin
            WriteLn('Ingrese nombre');
            ReadLn(aux.nom);
            WriteLn('Ingrese apellido');
            ReadLn(aux.ape);
            aux.peso.dimL:= 0;
            WriteLn('Desea ingresar un peso? (S/N)');
            ReadLn(rta2);
            while ((rta2 = 'S') or (rta2 = 's')) do begin
                aux.peso.dimL:= aux.peso.dimL + 1;
                WriteLn('Ingrese el peso');
                ReadLn(aux.peso.vPeso[aux.peso.dimL]);
                WriteLn('Desea ingresar otro peso? (S/N)');
                ReadLn(rta2);
            end;
            new(n);
            n^.dato:= aux;
            n^.psig:=l;
            l:= n;
            WriteLn('Desea ingresar otro paciente? (S/N)');
            ReadLn(rta);
        end;
    end;

procedure semanaMayorPeso(var l: lista);
    var
        act: lista;
        mayor: Integer;
        mayorAum, aum, total: Real;
        vaux: vector;
        dimL, i: Integer;
    begin
        act:= l;
        while (act <> nil) do begin
            mayor:= 0;
            mayorAum:= -100;
            vaux:= act^.dato.peso.vPeso;
            dimL:= act^.dato.peso.dimL;
            for i:= 2 to dimL do begin
                aum:= vaux[i] - vaux[i-1];
                if (aum > mayorAum) then begin
                    mayor:= i;
                    mayorAum:= aum;
                end;
            end;
            WriteLn('La semana con mayor aumento de peso de la paciente ', act^.dato.ape, ', ', act^.dato.nom, ' es la semana ', mayor);
            total:= vaux[dimL] - vaux[1];
            WriteLn('El aumento total en el embarazo es de: ', total);
            act:= act^.psig;
        end;
    end;



var
    l: lista;

begin
    cargarLista(l);
    semanaMayorPeso(l);
end.