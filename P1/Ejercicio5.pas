Program Ejercicio5;

var
    valor, num: Real;
    i: Integer;

begin
    WriteLn('Ingrese el valor');
    ReadLn(valor);
    WriteLn('Ingrese un numero');
    ReadLn(num);
    i:= 1;
    while ((num <> (valor * 2)) and (i < 10)) do
        begin
            WriteLn('Ingrese un numero');
            ReadLn(num);
            i:= i + 1
        end;
    if (num <> (valor * 2)) then
        WriteLn('No se ha ingresado el doble de X');
end.