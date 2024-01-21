program Ejercicio10;

procedure analizarNumeros(num: Integer; var sumaPar, cantImpar: Integer);
    var
        aux: Integer;
    begin
        while (num <> 0) do begin
            aux:= num mod 10;
            WriteLn(aux);
            if (aux mod 2 = 0) then
                sumaPar:= sumaPar + aux
            else
                cantImpar:= cantImpar + 1;
            num:= num div 10
        end;
    end;

procedure imprimir(num, sumaPar, cantImpar: Integer);
    begin
        WriteLn('El numero ', num, ' contiene ', cantImpar, ' de numeros impares, y la suma de sus numeros pares es: ', sumaPar);
    end;

var
    num, sumaPar, cantImpar: Integer;

begin
    WriteLn('Ingrese un numero');
    ReadLn(num);
    while (num <> 123456) do begin
        sumaPar:= 0;
        cantImpar:= 0;
        analizarNumeros(num, sumaPar, cantImpar);
        imprimir(num, sumaPar, cantImpar);
        WriteLn('Ingrese otro numero');
        ReadLn(num);
    end;
end.