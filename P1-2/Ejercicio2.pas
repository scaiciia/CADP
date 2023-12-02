Program Ejercicio2;

var
    i, num, mayor, pos: Integer;

begin
    mayor:= -32768;
    for i:= 1 to 10 do
        begin
            WriteLn('Ingrese un numero');
            ReadLn(num);
            if (num > mayor) then
                begin
                    mayor:= num;
                    pos:= i;
                end;
        end;
    WriteLn('El mayor numero leido fue el ', mayor, ' en la posicion ', pos);
end.