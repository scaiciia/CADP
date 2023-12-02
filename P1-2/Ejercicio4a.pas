Program Ejercicio4a;

var
    num, min1, min2: Integer;

begin
    repeat
        WriteLn('Ingrese un numero');
        ReadLn(num);
        if (min1 > num) then
            begin
                min2:= min1;
                min1:= num;
            end
        else
            begin
                if (min2 > num) then
                    min2:= num;
            end;
    until (num = 0);
    WriteLn('Los dos numeros minimos leidos son: ', min1, ' y ', min2);
end.