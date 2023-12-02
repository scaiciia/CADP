Program Ejercicio9;

var
    rta, num: Integer;
    signo: Char;

begin
    WriteLn('Ingrese un signo (+ o -)');
    ReadLn(signo);
    if ((signo = '+') or (signo = '-')) then
        begin
            WriteLn('Ingrese un numero');
            ReadLn(num);
            rta:= num;
            while (num <> 0) do
                begin
                    WriteLn('Ingrese un numero');
                    ReadLn(num);
                    if (signo = '+') then
                        rta:= rta + num
                    else
                        rta:= rta - num;
                end;
            WriteLn(rta);
        end
    else
        WriteLn('Error! No ingreso el signo correcto.');
end.