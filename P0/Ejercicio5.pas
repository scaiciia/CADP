Program Ejercicio5;

var
    x, y, cant, resto: Integer;
    monto: Real;

begin
    WriteLn('Ingrese la cantidad de caramelos que posee el kiosquero');
    ReadLn(x);
    WriteLn('Ingrese la cantidad de clientes');
    ReadLn(y);
    cant:= x div y;
    resto:= x mod y;
    WriteLn('A cada cliente le corresponde ', cant, ' caramelos. Al kiosquero le quedaran ', resto, ' caramelos.');
    monto:= cant * 1.60;
    WriteLn('Debera cobrar $', monto:7:2);
end.