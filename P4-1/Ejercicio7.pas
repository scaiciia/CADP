Program Ejercicio7;

type
    vector = array[1..10] of Integer;

procedure inicializar(var v: vector);
    var
        i: Integer;
    begin
        for i:= 1 to 10 do
            v[i]:= 0;
    end;

procedure cargar(var v: vector);
    var
        rta, aux: Integer;
    begin
        WriteLn('Ingrese un numero');
        ReadLn(rta);
        while (rta <> -1) do begin
            while (rta > 9) do begin
                aux:= rta mod 10;
                v[aux+1]:= v[aux+1] + 1;
                rta:= rta div 10;
            end;
            v[rta+1]:= v[rta+1] + 1;
            WriteLn('Ingrese un numero');
            ReadLn(rta);
        end;
    end;

procedure imprimir(v: vector);
    var
        vAux: vector;
        dimL, i, masLeido, cantMasLeido: Integer;
    begin
        dimL:= 0;
        masLeido:= -1;
        cantMasLeido:= -1;
        for i:= 1 to 10 do begin
            if (v[i] = 0) then begin
                dimL:= dimL + 1;
                vAux[dimL]:= i - 1;
            end else begin
                WriteLn('Numero ', i-1, ': ', v[i], ' veces');
                if (v[i] > cantMasLeido) then begin
                    masLeido:= i-1;
                    cantMasLeido:= v[i];
                end;
            end;
        end;
        WriteLn('El digito mas leido fue el ', masLeido, '.');
        if (dimL > 0) then begin
            Write('Los digitos que no tuvieron ocurrencias son: ');
            for i:= 1 to dimL-1 do
                Write(vAux[i], ', ');
            Write(vAux[dimL]);
        end;
    end;

var
    v: vector;

begin
    inicializar(v);
    cargar(v);
    imprimir(v);
end.