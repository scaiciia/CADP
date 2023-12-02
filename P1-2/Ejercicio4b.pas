Program Ejercicio4b;

var
    num, min1, min2: Integer;

begin
    WriteLn('Ingrese un numero');
    ReadLn(num);
    while (num <> 0) do
        begin
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
            WriteLn('Ingrese un numero');
            ReadLn(num);
        end;
    WriteLn('Los dos numeros minimos leidos son: ', min1, ' y ', min2);
end.