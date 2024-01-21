program Ejercicio6;

procedure numeroAlto();
    var
        maxPar, num: Integer;
    begin
        maxPar:= 0;
        repeat
            WriteLn('Ingrese un numero');
            ReadLn(num);
            if (num mod 2 = 0) then begin
                if (num > maxPar) then
                    maxPar:= num
            end;
        until (num < 0);
        WriteLn('El numero par mas alto es: ', maxPar)
    end;

begin
    numeroAlto();
end.