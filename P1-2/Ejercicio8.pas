Program Ejercicio8;

var
    suma, monto: Real;
    i, dia, c, max: Integer;

begin
    max:= -32768;
    dia:= 0;
    suma:= 0;
    for i:= 1 to 31 do begin
        c:= 0;
        WriteLn('Ingrese un monto');
        ReadLn(monto);
        while (monto <> 0) do begin
            c:= c + 1;
            suma:= suma + monto;
        end;
        if (c > max) then
            begin
                max:= c;
                dia:= i;
            end;
        WriteLn('La cantidad de ventas en el dia es: ', c);
    end;
    WriteLn('El monto total en el mes es de $', suma:5:2);
    WriteLn('El dia con mayor ventes fue el dia ', dia);
end.