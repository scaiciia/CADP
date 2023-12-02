Program Ejercicio3;

var
    cont7, cont8: Integer;
    nota: Real;
    nom: String;

begin
    cont7:= 0;
    cont8:= 0;
    repeat
        WriteLn('Ingrese nombre');
        ReadLn(nom);
        WriteLn('Ingrese nota');
        ReadLn(nota);
        if (nota >= 8) then
            cont8:= cont8 + 1;
        if (nota = 7) then
            cont7:= cont7 + 1;
    until (nom = 'Zidane Zinedine');
    WriteLn('La cantidad de alumnos aprobados (8 o mas) es: ', cont8);
    WriteLn('La cantidad de alumnos que obtubieron 7 es: ', cont7);
end.