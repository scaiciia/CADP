program Ejercicio11;

procedure inicializar(var max1NumInsc, max2NumInsc, min1NumInsc, min2NumInsc, cant, cantPar, suma: Integer);
    begin
        max1NumInsc:= -1;
        max2NumInsc:= -1;
        min1NumInsc:= 32767;
        min2NumInsc:= 32767;
        cant:= 0;
        cantPar:= 0;
        suma:= 0;
    end;

procedure calcularMaximo(numInsc: Integer; nom: String; var max1NumInsc, max2NumInsc: Integer; var max1Nom, max2Nom: String);
    begin
        if (numInsc > max1NumInsc) then begin
            max2NumInsc:= max1NumInsc;
            max2Nom:= max1Nom;
            max1NumInsc:= numInsc;
            max1Nom:= nom;
        end else begin
            if (numInsc > max2NumInsc) then begin
                max2NumInsc:= numInsc;
                max2Nom:= nom;
            end;
        end;
    end;

procedure calcularMinimo(numInsc: Integer; nom: String; var min1NumInsc, min2NumInsc: Integer; var min1Ape, min2Ape: String);
    begin
        if (numInsc < min1NumInsc) then begin
            min2NumInsc:= min1NumInsc;
            min2Ape:= min1Ape;
            min1NumInsc:= numInsc;
            min1Ape:= nom;
        end else begin
            if (numInsc < min2NumInsc) then begin
                min2NumInsc:= numInsc;
                min2Ape:= nom;
            end;
        end;
    end;

procedure informar(max1Nom, max2Nom, min1Ape, min2Ape: String; porcen: Real);
    begin
        WriteLn('Los 2 nombres de alumnos con el mayor numero de inscripcion son:');
        WriteLn('1- ', max1Nom);
        WriteLn('2- ', max2Nom);
        WriteLn('----------------------------------------------------------------------');
        WriteLn('Los 2 apellidos de los alumnos con el menor numero de inscripcion son:');
        WriteLn('1- ', min1Ape);
        WriteLn('2- ', min2Ape);
        WriteLn('----------------------------------------------------------------------');
        WriteLn('El porcentaje de alumnos con numero de inscripcion par es:', porcen:5:2, '%');
    end;

var
    numInsc, max1NumInsc, max2NumInsc, min1NumInsc, min2NumInsc, suma, cantPar, cant: Integer;
    ape, min1Ape, min2Ape, nom, max1Nom, max2Nom: String;
    porcen: Real;

begin
    inicializar(max1NumInsc, max2NumInsc, min1NumInsc, min2NumInsc, cant, cantPar, suma);
    repeat
        WriteLn('Ingrese el numero de inscripcion');
        ReadLn(numInsc);
        WriteLn('Ingrese el nombre de alumno');
        ReadLn(nom);
        WriteLn('Ingrese el apellido de alumno');
        ReadLn(ape);
        calcularMaximo(numInsc, nom, max1NumInsc, max2NumInsc, max1Nom, max2Nom);
        calcularMinimo(numInsc, ape, min1NumInsc, min2NumInsc, min1Ape, min2Ape);
        cant:= cant + 1;
        if (numInsc mod 2 = 0) then
            cantPar:= cantPar + 1;
    until (numInsc = 1200);
    porcen:= (cantPar * 100) / cant;
    informar(max1Nom, max2Nom, min1Ape, min2Ape, porcen);
end.