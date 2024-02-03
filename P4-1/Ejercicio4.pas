Program Ejercicio4;

const
    tamanio = 100;

type
    dimF = -1..tamanio;
    vector = array[1..tamanio] of Integer;

procedure cargarVector(var v: vector; var dimL: dimF);
    var
        rta: Char;
    begin
        dimL:= 0;
        WriteLn('Desea ingresar algún dato? (S/N)');
        ReadLn(rta);
        while ((rta = 's') or (rta = 'S')) do begin
            dimL:= dimL + 1;
            WriteLn('Ingrese un numero');
            ReadLn(v[dimL]);
            WriteLn('Desea ingresar algún otro dato? (S/N)');
            ReadLn(rta);
        end;
    end;

function posicion(x, dimL: dimF; v: vector): Integer;
    var
        valor, i: Integer;
    begin
        valor:= -1;
        i:= 0;
        repeat
            i:= i + 1;
            if (v[i] = x) then
                valor:= i;
        until ((v[i] <> x) or (i > dimL));
        posicion:= valor;
    end;

procedure intercambio(x, y: dimF; var v: vector);
    var
        aux: Integer;
    begin
        aux:= v[x];
        v[x]:= v[y];
        v[y]:= aux;
    end;

function sumaVector(v: vector; dimL: dimF): Integer;
    var
        i: dimF;
        suma: Integer;
    begin
        suma:= 0;
        for i:= 1 to dimL do
          suma:= suma + v[i];
        sumaVector:= suma;
    end;

function promedio(v: vector; dimL: dimF): Real;
    var
        prom: Real;
    begin
        prom:= sumaVector(v, dimL) / dimL;
        promedio:= prom;
    end;

function elementoMaximo(v: vector; dimL: dimF): dimF;
    var
        max: Integer;
        i, iMax: dimF;
    begin
        max:= -32768;
        iMax:= -1;
        for i:= 1 to dimL do begin
            if (v[i] > max) then begin
                iMax:= i;
                max:= v[i];
            end;
        end;
    end;

function elementoMinimo(v: vector; dimL: dimF): dimF;
    var
        min: Integer;
        i, iMin: dimF;
    begin
        min:= 32767;
        iMin:= -1;
        for i:= 1 to dimL do begin
            if (v[i] < min) then begin
                iMin:= i;
                min:= v[i];
            end;
        end;
    end;

procedure imprimirVector(v: vector; dimL: dimF);
    var
        i: dimF;
    begin
        Write('| ');
        for i:= 1 to dimL do
            Write(v[i], ' | ');
    end;

var
    v: vector;
    dimL, pos1, pos2: dimF;
    x: Integer;
begin
    cargarVector(v, dimL);
    WriteLn('Ingrese el valor a buscar');
    ReadLn(x);
    WriteLn('pos: ', posicion(x, dimL, v));
    WriteLn('Ingrese una posicion');
    ReadLn(pos1);
    WriteLn('Ingrese otra posicion');
    ReadLn(pos2);
    intercambio(pos1, pos2, v);
    imprimirVector(v, dimL);
    WriteLn('Suma: ', sumaVector(v, dimL));
    WriteLn('Promedio: ', promedio(v, dimL));
    WriteLn('Posicion mayor elemento: ', elementoMaximo(v, dimL));
    WriteLn('Posicion menor elemento: ', elementoMinimo(v, dimL));
end.