Program Ejercicio8;

procedure inicializar (var codBar1, codBar2, codCar, cont: Integer; var masBar1, masBar2, masCar, suma: Real);
    begin
        codBar1:= 0;
        codBar2:= 0;
        masCar:= -1;
        masBar1:= 32767;
        masBar2:= 32767;
        suma:= 0;
        cont:= 0;
    end;

procedure masBaratos (var codBar1: Integer; var masBar1: Real; var codBar2: Integer; var masBar2: Real; precio: Real; cod: Integer);
    begin
        if (precio < masBar1) then
            begin
                codBar2:= codBar1;
                masBar2:= masBar1;
                codBar1:= cod;
                masBar1:= precio;
            end
        else
            begin
                if (precio < masBar2) then
                    begin
                        codBar2:= cod;
                        masBar2:= cod;
                    end;
            end;
    end;

procedure masCaro (var codCar: Integer; var masCar: Real; cod: Integer; precio: Real);
    begin
        if (precio > masCar) then begin
            codCar:= cod;
            masCar:= precio;
        end;
    end;

function promedio (suma: Real; cant: Integer) : Real;
    begin
        promedio:= suma / cant;
    end;

procedure imprimir (codBar1, codBar2, codCar: Integer; prom: Real);
    begin
        WriteLn('Los códigos de los dos productos más baratos son: ', codBar1, ' y ', codBar2, '.');
        WriteLn('El código del producto de tipo “pantalón” más caro es: ', codCar);
        WriteLn('El precio promedio es: ', prom);
    end;

var
    codBar1, codBar2, codCar, cont, i, cod: Integer;
    masBar1, masBar2, masCar, suma, precio, prom: Real;
    tipo: String;

begin
    inicializar(codBar1, codBar2, codCar, cont, masBar1, masBar2, masCar, suma);
    for i:=1 to 100 do begin
        WriteLn('Ingrese codigo');
        ReadLn(cod);
        WriteLn('Ingrese precio');
        ReadLn(precio);
        WriteLn('Ingrese Tipo');
        ReadLn(tipo);
        masBaratos(codBar1, masBar1, codBar2, masBar2, precio, cod);
        if (tipo = 'pantalón') then
            masCaro(codCar, masCar, cod, precio);
        suma:= suma + precio;
        cont:= cont + 1;
    end;
    prom:= promedio(suma, cont);
    imprimir(codBar1, codBar2, codCar, prom);
end.