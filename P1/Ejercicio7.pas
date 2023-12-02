Program Ejercicio7;

var
    cod: Integer;
    fin: Boolean;
    precioAct, precioNuevo: Real;

begin
    WriteLn('Ingrese el codigo del producto');
    ReadLn(cod);
    fin:= false;
    while (fin = false) do
        begin
            WriteLn('Ingrese el precio actual');
            ReadLn(precioAct);
            WriteLn('Ingrese el nuevo precio');
            ReadLn(precioNuevo);
            if ((precioAct * 1.10) < precioNuevo) then
                WriteLn('El aumento de precio del producto ', cod, ' es superior al 10%')
            else
                WriteLn('El aumento de precio del producto ', cod, ' no supera el 10%');
            if (cod = 32767) then
                fin:= true;
            if (fin = false) then
                begin
                    WriteLn('Ingrese el codigo del producto');
                    ReadLn(cod);
                end;
        end;
end.