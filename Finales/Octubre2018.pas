program Octubre2018;

const
    dimF = 100;
    dimAlF = 27;

type
    alfabeto = 'a'..'z';
    vector = array[1..dimF] of alfabeto;
    caracter = record
        letra: alfabeto;
        cant: Integer;
    end;
    cantCarac = array[1..dimAlf] of caracter;

procedure cargarVector(var v: vector; var dimL: Integer);
    var
        i, j: Integer;
        rta: Char;
        letra: alfabeto;
    begin
        WriteLn('Desea ingresar un caracter? (S/N)');
        ReadLn(rta);
        while ((rta = 'S') or (rta = 's') and (dimL < dimF)) do begin
            WriteLn('Ingrese el caracter alfabetico');
            ReadLn(letra);
            if (dimL = 0) then
                v[dimL+1]:= letra
            else begin
                i:= 1;
                while ((letra > v[i]) and (i <= dimL)) do
                    i:= i + 1;
                for j:= dimL+1 downto i do
                    v[j]:= v[j-1];
                v[i]:= letra;
            end;
            dimL:= dimL + 1;
            WriteLn('Desea ingresar un caracter? (S/N)');
            ReadLn(rta);
        end;
        for i:= 1 to dimL do
            Write(' | ', v[i]);
        WriteLn(' | ');
    end;

procedure contarCaracteres(var cant: cantCarac; var dimAlL: Integer; v: vector; dimL: Integer);
    var
        i: Integer;
        aux: caracter;
    begin
        i:= 1;
        while (i < dimL) do begin
            aux.letra:= v[i];
            aux.cant:= 0;
            while (v[i] = aux.letra) do begin
                aux.cant:= aux.cant + 1;
                i:= i + 1;
            end;
            cant[dimAlL+1]:= aux;
            dimAlL := dimAlL + 1;
        end;
        WriteLn(dimAlL);
    end;

procedure imprimir(cant: cantCarac; dimAlL: Integer);
    var
        i: Integer;
    begin
        for i:= 1 to dimAlL do begin
            WriteLn('Letra: ', cant[i].letra, ' - cantidad: ', cant[i].cant);
        end;
    end;

var
    v: vector;
    cant: cantCarac;
    dimL, dimAlL: Integer;

begin
    dimL:= 0;
    dimAlL:= 0;
    cargarVector(v, dimL);
    contarCaracteres(cant, dimAlL, v, dimL);
    imprimir(cant, dimAlL);
end.