Program Ejercicio7;

var
    i: Integer;
    n1, n2, n99, n100, t: Real;
    nomn1, nomn2, nomn99, nomn100, nom: String;

begin
    n1:= 0;
    nomn1:= 'zzz';
    n2:= 0;
    nomn2:= 'zzz';
    n99:= 0;
    nomn99:= 'zzz';
    n100:= 0;
    nomn100:= 'zzz';
    for i:= 1 to 100 do
        begin
            WriteLn('Ingrese el nombre del piloto');
            readln(nom);
            WriteLn('Ingrese su tiempo');
            ReadLn(t);
            if (n1 = 0) then
                begin
                    nomn1:= nom;
                    n1:= t;
                end
            else
                begin
                    if (n1 > t) then
                        begin
                            nomn2:= nomn1;
                            n2:= n1;
                            nomn1:= nom;
                            n1:= t;
                        end
                    else
                        begin
                            if ((n2 > t) or (n2 = 0)) then
                                begin
                                    nomn2:= nom;
                                    n2:= t;
                                end;
                        end;
                end;
            if (n100 = 0) then
                begin
                    nomn100:= nom;
                    n100:= t;
                end
            else
                begin
                    if (n100 < t) then
                        begin
                            nomn99:= nomn100;
                            n99:= n100;
                            nomn100:= nom;
                            n100:= t;
                        end
                    else
                        begin
                            if ((n99 < t) or (n99 = 0)) then
                                begin
                                    nomn99:= nom;
                                    n99:= t;
                                end;
                        end;
                end;
        end;
    WriteLn('Primero: ', nomn1, ' - Segundo: ', nomn2);
    WriteLn('anteultimo: ', nomn99, ' - ultimo: ', nomn100);
end.