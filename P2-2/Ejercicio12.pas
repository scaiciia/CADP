program Ejercicio12;

function esVocal(letra: String): Boolean;
    var
        resultado: Boolean;
    begin
        resultado:= False;
        if ((letra = 'a') or (letra = 'A')) then
            resultado:= True;
        if not (resultado) then
            if ((letra = 'e') or (letra = 'E')) then
                resultado:= True;
        if not (resultado) then
            if ((letra = 'i') or (letra = 'I')) then
                resultado:= True;
        if not (resultado) then
            if ((letra = 'o') or (letra = 'O')) then
                resultado:= True;
        if not (resultado) then
            if ((letra = 'u') or (letra = 'U')) then
                resultado:= True;
        esVocal:= resultado;
    end;

function cumplePatron(cadena: String): Boolean;
    var
        resultado: Boolean;
        posicion, i: Integer;
        A, B: String;

    begin
        resultado:= True;
        posicion:= Pos('$', cadena);
        A:= Copy(cadena, 1, posicion-1);
        B:= Copy(cadena, posicion+1, (Length(cadena) - (posicion) - 1));
        WriteLn(A);
        WriteLn(B);
        i:= 1;
        while ((i <= Length(A)) and (resultado)) do begin
            if not (esVocal(A[i])) then
                resultado:= False
            else
                i:= i + 1;
        end;
        if (resultado) then begin
            i:= 1;
            while ((i <= Length(B)) and (resultado)) do begin
                if (esVocal(B[i])) then
                    resultado:= False
                else
                    i:= i + 1;
            end;
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