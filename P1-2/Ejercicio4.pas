Program Ejercicio4;

var
    i, num, min1, min2: Integer;

begin
    for i:= 1 to 1000 do
        begin
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
        end;
    WriteLn('Los dos numeros minimos leidos son: ', min1, ' y ', min2);
end.