Program Ejercicio6;

var
    monto, dolar, comision: Real;

begin
    WriteLn('Ingrese el monto de la transaccion');
    ReadLn(monto);
    WriteLn('Ingrese el valor del dolar');
    ReadLn(dolar);
    WriteLn('ingrese el porcentaje de la comision');
    ReadLn(comision);
    comision:= (comision / 100) + 1;
    WriteLn('La transaccion sera de ', (monto * dolar * comision):7:2, ' Pesos Argentinos.');
end.