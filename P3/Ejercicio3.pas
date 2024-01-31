Program Ejercicio3;

type
    escuela = record
        CUE: Integer;
        nombre: String;
        cantDoc: Integer;
        cantAlum: Integer;
        localidad: String;
    end;

    mayor = record
        CUE: Integer;
        nombre: String;
        relacion: Integer;
    end;

procedure leer(var esc: escuela);
    begin
        WriteLn('Ingrese el CUE de la institucion');
        ReadLn(esc.CUE);
        WriteLn('Ingrese el nombre de la institucion');
        ReadLn(esc.nombre);
        WriteLn('Ingrese la cantidad de docentes');
        ReadLn(esc.cantDoc);
        WriteLn('Ingrese la cantidad de alumnos');
        ReadLn(esc.cantAlum);
        WriteLn('Ingrese la localidad de la institucion');
        ReadLn(esc.localidad);
    end;

function calcularRelacion(docentes: Integer; alumnos: Integer): Integer;
    begin
        calcularRelacion:= alumnos div docentes;
    end;

procedure mayores(esc: escuela; relacion: Integer; var mayor1, mayor2: mayor);
    begin
        if (relacion > mayor1.relacion) then begin
            mayor2.CUE:= mayor1.CUE;
            mayor2.nombre:= mayor1.nombre;
            mayor2.relacion:= mayor1.relacion;
            mayor1.CUE:= esc.CUE;
            mayor1.nombre:= esc.nombre;
            mayor1.relacion:= relacion;
        end else begin
            if (relacion > mayor2.relacion) then begin
                mayor2.CUE:= esc.CUE;
                mayor2.nombre:= esc.nombre;
                mayor2.relacion:= relacion;
            end;
        end;
    end;

procedure informar(cant: Integer; mayor1, mayor2: mayor);
    begin
        WriteLn('La cantidad de escuelas de La Plata con una relacion alumno/docente mayor a la sugerida por la UNESCO es: ', cant);
        WriteLn('Datos de la escuelas con mejor relacion:');
        WriteLn('CUE: ', mayor1.CUE, ' - Nombre: ', mayor1.nombre, ' - Alumno/Docente: ', mayor1.relacion);
        WriteLn('CUE: ', mayor2.CUE, ' - Nombre: ', mayor2.nombre, ' - Alumno/Docente: ', mayor2.relacion);
    end;

var
    relacion, i, cant: Integer;
    esc: escuela;
    mayor1, mayor2: mayor;

begin
    cant:= 0;
    mayor1.relacion:= -1;
    mayor2.relacion:= -1;
    for i:= 1 to 2400 do begin
        leer(esc);
        relacion:= calcularRelacion(esc.cantDoc, esc.cantAlum);
        if (esc.localidad = 'La Plata') then begin
            if (relacion > 23435) then
                cant:= cant + 1;
        end;
        mayores(esc, relacion, mayor1, mayor2);
    end;
    informar (cant, mayor1, mayor2);
end.