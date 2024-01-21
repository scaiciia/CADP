program Ejercicio13;

function cumplePatron(cadena: String): Boolean;
    var
        resultado: Boolean;
        posicion, i, cont: Integer;
        A, B: String;

    begin
        resultado:= True;
        posicion:= Pos('%', cadena);
        A:= Copy(cadena, 1, posicion-1);
        B:= Copy(cadena, posicion + 1, (Length(cadena) - posicion - 1));

        i:= 1;
        while ((i <= Length(A)) and (resultado)) do begin
            if (A[i] = '$') then
                resultado:= False
            else
                i:= i + 1;
        end;
        if (resultado) then begin
            if (Length(A) = Length(B)) then begin
                i:= 1;
                cont:= 0;
                while ((i <= Length(B)) and (resultado)) do begin
                    if (B[i] = '@') then
                        cont:= cont + 1;
                    if (cont > 3) then
                        resultado:= False
                    else
                        i:= i + 1;
                end;
            end else
                resultado:= False;
        end;
        cumplePatron:= resultado;
    end;

var
    cadena: String;

begin
    WriteLn('Ingrese la cadena de caracteres');
    ReadLn(cadena);

    if (cumplePatron(cadena)) then
        WriteLn('La cadena cumple con el patron')
    else
        WriteLn('La cadena no cumple con el patron')
end.