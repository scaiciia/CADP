Program Ejercicio5;

const
    tamanio = 100;

type
    dimF = 0..tamanio;
    vector = array[1..tamanio] of Integer;

procedure cargarVector(var v: vector; var dimL: dimF);
    var
        rta: Integer;
    begin
        dimL:= 0;
        WriteLn('Ingrese un numero');
        ReadLn(rta);
        while ((rta <> 0) and (dimL < dimF)) do begin
            dimL:= dimL + 1;
            v[dimL]:= rta;
            WriteLn('Ingrese un numero');
            ReadLn(rta);
        end;
    end;

procedure intercambio(x, y: dimF; var v: vector);
    var
        aux: Integer;
    begin
        aux:= v[x];
        v[x]:= v[y];
        v[y]:= aux;
    end;

function elementoMaximo(v: vector; dimL: dimF): dimF;
    var
        max: Integer;
        i, iMax: dimF;
    begin
        max:= -32768;
        iMax:= 0;
        for i:= 1 to dimL do begin
            if (v[i] > max) then begin
                iMax:= i;
                max:= v[i];
            end;
        end;
        elementoMaximo:= iMax;
    end;

function elementoMinimo(v: vector; dimL: dimF): dimF;
    var
        min: Integer;
        i, iMin: dimF;
    begin
        min:= 32767;
        iMin:= 0;
        for i:= 1 to dimL do begin
            if (v[i] < min) then begin
                iMin:= i;
                min:= v[i];
            end;
        end;
        elementoMinimo:= iMin;
    end;

procedure intercambiarMaxMin(var v: vector; dimL: dimF);
    var
        max, min: Integer;
        iMax, iMin: dimF;
    begin
        iMax:= elementoMaximo(v, dimL);
        max:= v[iMax];
        iMin:= elementoMinimo(v, dimL);
        min:= v[iMin];
        intercambio(iMax, iMin, v);
        WriteLn('El elemento maximo ', max, ' que se encontraba en la posicion ', iMax, ' fue intercambiado con el elemento minimo ', min, ' que se encontraba en la posicion ', iMin);
    end;

var
    v: vector;
    dimL: dimF;

begin
    cargarVector(v, dimL);
    intercambiarMaxMin(v, dimL);
end.