Program Ejercicio6;

var
    leg, cantAlu, prom65, prom85leg2500: Integer;
    prom: Real;

begin
    cantAlu:= 0;
    prom65:= 0;
    prom85leg2500:= 0;
    WriteLn('Ingrese numero de legajo');
    ReadLn(leg);
    while (leg <> -1) do
        begin
            WriteLn('Ingrese el promedio');
            ReadLn(prom);
            cantAlu:= cantAlu + 1;
            if (prom > 6.5) then
                prom65:= prom65 + 1;
            if ((prom > 8.5) and (leg < 2500)) then
                prom85leg2500:= prom85leg2500 + 1;
            WriteLn('Ingrese un nuevo legajo');
            ReadLn(leg)
        end;
    WriteLn('La cantidad de alumnos leida: ', cantAlu);
    WriteLn('La cantidad de alumnos cuyo promedio supera 6.5: ', prom65);
    WriteLn('Porcentaje de alumnos destacados cuyo legajo sea menor a 2500: ', ((prom85leg2500 * 100) / cantAlu):5:2, '%');
end.