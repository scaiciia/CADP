Program Ejercicio2;

var
    num: Integer;

begin
    WriteLn('Escribir un numero');
    ReadLn(num);
    if (num < 0) then
        num:= num * -1;
    WriteLn('El valor absoluto es: ', num);
end.