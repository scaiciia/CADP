Program Ejercicio6;

var
    codmin1, codmin2, cod, cant16par, i: Integer;
    min1, min2, precio: Real;

begin
    min1:= 32767;
    codmin1:= 0;
    min2:= 32767;
    codmin2:= 0;
    cant16par:= 0;
    for i:= 1 to 200 do
        begin
            WriteLn('Ingrese codigo del producto');
            ReadLn(cod);
            WriteLn('Ingrese precio del producto');
            ReadLn(precio);
            if (min1 > precio) then
                begin
                    min2:= min1;
                    codmin2:= codmin1;
                    min1:= precio;
                    codmin1:= cod;
                end
            else
                begin
                    if (min2 > precio) then
                        begin
                            min2:= precio;
                            codmin2:= cod;
                        end;
                end;
            if ((precio > 16) and (cod mod 2 = 0)) then
                cant16par:= cant16par + 1;
        end;
    WriteLn('Los codigos de los productos mas baratos son: ', codmin1, ' y ', codmin2, '.');
    WriteLn('La cantidad de productos de mas de 16 pesos con codigo par es: ', cant16par);
end.