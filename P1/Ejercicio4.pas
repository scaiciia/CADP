Program Ejercicio4;

var
    valor, num: Real;

begin
    WriteLn('Ingrese el valor');
    ReadLn(valor);
    WriteLn('Ingrese un numero');
    ReadLn(num);
    while (num <> (valor * 2)) do
        begin
            WriteLn('Ingrese un numero');
            ReadLn(num)
        end;
end.