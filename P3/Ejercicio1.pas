program Ejercicio1;

type
    str20 = string[20];
    alumno = record
        codigo: Integer;
        nombre: str20;
        promedio: Real
    end;

    mejorPromedio = record
        nombre: str20;
        promedio: Real;
    end;

procedure leer(var alu: alumno);
    begin
        WriteLn('Ingrese el codigo del alumno');
        ReadLn(alu.codigo);
        if (alu.codigo <> 0) then begin
            WriteLn('Ingrese el nombre del alumno');
            ReadLn(alu.nombre);
            WriteLn('Ingrese el promedio del alumno');
            ReadLn(alu.promedio);
        end;
    end;

procedure mayorPromedio(a: alumno; var prom: mejorPromedio);
    begin
        if (a.promedio > prom.promedio) then begin
            prom.nombre:= a.nombre;
            prom.promedio:= a.promedio;
        end;
    end;

var
    a: alumno;
    cant: Integer;
    prom: mejorPromedio;

begin
    prom.promedio:= -1;
    cant:= 0;
    leer(a);
    while (a.codigo <> 0) do begin
        cant:= cant + 1;
        mayorPromedio(a, prom);
        leer(a);
    end;
    WriteLn('La cantidad de alumnos leidos es: ', cant);
    WriteLn('El nombre del alumno con mejor promedio es: ', prom.nombre, ', con un promedio de: ', prom.promedio:5:2);
end.