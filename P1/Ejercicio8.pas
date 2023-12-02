Program Ejercicio8;

var
    letra1, letra2, letra3: Char;

begin
    WriteLn('Ingrese la primera letra');
    ReadLn(letra1);
    WriteLn('Ingrese la segunda letra');
    ReadLn(letra2);
    WriteLn('Ingrese la tercera letra');
    ReadLn(letra3);
    if ((letra1 = 'a') or (letra1 = 'e') or (letra1 = 'i') or (letra1 = 'o') or (letra1 = 'u')) then
        begin
            if ((letra2 = 'a') or (letra2 = 'e') or (letra2 = 'i') or (letra2 = 'o') or (letra2 = 'u')) then
                begin
                    if ((letra3 = 'a') or (letra3 = 'e') or (letra3 = 'i') or (letra3 = 'o') or (letra3 = 'u')) then
                        begin
                            WriteLn('Los tres son vocales');
                        end
                    else
                        WriteLn('Al menos un carácter no era vocal');
                end
            else
                WriteLn('Al menos un carácter no era vocal');
        end
    else
        WriteLn('Al menos un carácter no era vocal');
end.