Program Ejercicio3;

var
    num1, num2, num3: Integer;

begin
    WriteLn('Ingrese el primer numero');
    ReadLn(num1);
    WriteLn('Ingrese el segundo numero');
    ReadLn(num2);
    WriteLn('Ingrese el tercer numero');
    ReadLn(num3);
    if (num1 > num2) then
        if (num1 > num3) then
            begin
                WriteLn(num1);
                if (num2 > num3) then
                    begin
                        WriteLn(num2);
                        WriteLn(num3)
                    end
                else
                    begin
                        WriteLn(num3);
                        WriteLn(num2)
                    end;
            end
        else
            begin
                WriteLn(num3);
                WriteLn(num1);
                WriteLn(num2)
            end
    else
        if (num2 > num3) then
            begin
                WriteLn(num2);
                if (num1 > num3) then
                    begin
                      WriteLn(num1);
                      WriteLn(num3)
                    end
                else
                    begin
                        WriteLn(num3);
                        WriteLn(num1)
                    end;
            end
        else
            begin
                WriteLn(num3);
                WriteLn(num2);
                WriteLn(num1)
            end;
end.