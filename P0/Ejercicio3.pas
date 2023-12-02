Program Ejercicio3;

var
    num1, num2, res: real;

begin
    WriteLn('Ingrese un numero');
    ReadLn(num1);
    WriteLn('Ingrese un numero');
    ReadLn(num2);
    res:= num1 / num2;
    WriteLn('El resultado de dividir ', num1:3:1, ' por ', num2:3:1, ' es ', res:4:2);
end.