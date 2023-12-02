Program Ejercicio5;

function dobleDeA (numA: Integer; numB: Integer) : Boolean;
    begin
        if (numA * 2 = numB) then
            dobleDeA:= True
        else
            dobleDeA:= False;
    end;

var
    numA, numB, c, cDob: Integer;

begin
    c:= 0;
    cDob:= 0;
    WriteLn('Ingrese un numero');
    ReadLn(numA);
    WriteLn('Ingrese otro numero');
    ReadLn(numB);
    while ((numA <> 0) or (numB <> 0)) do begin
        c:= c + 1;
        if (dobleDeA(numA, numB)) then
            cDob:= cDob + 1;
        WriteLn('Ingrese un numero');
        ReadLn(numA);
        WriteLn('Ingrese otro numero');
        ReadLn(numB);
    end;
    WriteLn('Cantidad de pares leidos: ', c);
    WriteLn('Cantidad de pares en la que numB es el doble de numA: ', cDob);
end.