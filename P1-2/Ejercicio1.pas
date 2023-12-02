Program Ejercicio1;

var
    num, suma, cont, i: Integer;

begin
    suma:= 0;
    cont:= 0;
    for i:= 1 to 10 do
        begin
            WriteLn('Ingrese un numero');
            ReadLn(num);
            if (num > 5) then
                cont:= cont + 1;
            suma:= suma + num;
        end;
    WriteLn('La suma de los numeros ingresados es: ', suma);
    WriteLn('La cantidad de numeros ingresados mayores a 5 es: ', cont);
end.