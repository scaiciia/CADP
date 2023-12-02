Program Ejercicio1;

var
    num1, num2: Integer;

begin
    WriteLn ('Ingrese un numero');
    ReadLn (num1);
    WriteLn ('Ingrese otro numero');
    ReadLn (num2);
    if (num1 > num2) then
        WriteLn ('El numero 1 es mayor que el 2')
    else
        if (num2 > num1) then
            WriteLn ('El numero 2 es mayor que el 1')
        else
            WriteLn ('Los numeros leidos son iguales');
end.