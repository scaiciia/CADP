Program Ejercicio5;

var
    min, max, suma, num: Integer; 

begin
    min:= 32767;
    max:= -32768;
    suma:= 0;
    repeat
        WriteLn('Ingrese un numero');
        ReadLn(num);
        if (num < min) then
            min:= num;
        if (num > max) then
            max := num;
        suma:= suma + num;
    until (num = 100);
    WriteLn('El numero maximo leido es el ', max);
    WriteLn('El numero minimo leido es el ', min);
    WriteLn('La suma total de los numeros leidos es ', suma);
end.