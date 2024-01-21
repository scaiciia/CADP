program Ejercicio9;

procedure analizarNumero(num: Integer; var cant, suma: Integer);
    var
        aux: Integer;
    begin
        while (num <> 0) do begin
            aux:= num mod 10;
            suma:= suma + aux;
            cant:= cant + 1;
            num:= num div 10
        end;
    end;

var
    suma, cant, sumaLeidos, num: Integer;

begin
    sumaLeidos:= 0;
    while (sumaLeidos < 10) do begin
        WriteLn('Ingrese un numero');
        ReadLn(num);
        cant:= 0;
        suma:= 0;
        analizarNumero(num, cant, suma);
        WriteLn('El numero ', num, ' contiene ', cant, ' de digitos. La suma de sus digitos es: ', suma, '.');
        sumaLeidos:= sumaLeidos + suma;
    end;
end.