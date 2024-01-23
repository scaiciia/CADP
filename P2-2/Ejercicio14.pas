program Ejercicio14;

const
    precio = 320;

procedure inicializar(var cant3deFeb, cant: Integer; var rendimientoMayor, rendimientoMenor, suma: Real);
    begin
        cant3deFeb:= 0;
        rendimientoMayor:= -1;
        rendimientoMenor:= 99999;
        suma:= 0;
        cant:= 0;
    end;

procedure leerDatos(var localidad: String; var ha, tipo: Integer);
    begin
        WriteLn('Ingrese la localidad del campo');
        ReadLn(localidad);
        WriteLn('Ingrese la cantidad de hectarias sembradas');
        ReadLn(ha);
        WriteLn('Ingrese el tipo de zona');
        ReadLn(tipo);
    end;


function calcularRendimiento(ha, tipo: Integer; precio: Real): Real;
    var
        rendimientoZona: Real;
    begin
        case tipo of
            1: rendimientoZona:= 6;
            2: rendimientoZona:= 2.6;
            3: rendimientoZona:= 1.4;
        end;
        calcularRendimiento:= (ha * rendimientoZona) * precio;
    end;

procedure mayorRendimiento(rendimiento: Real; localidad: String; var localidadMayor: String; var rendimientoMayor: Real);
    begin
        if (rendimiento > rendimientoMayor) then begin
            localidadMayor:= localidad;
            rendimientoMayor:= rendimiento;
        end;
    end;

procedure menorRendimiento(rendimiento: Real; localidad: String; var localidadMenor: String; var rendimientoMenor: Real);
    begin
        if (rendimiento < rendimientoMenor) then begin
            localidadMenor:= localidad;
            rendimientoMenor:= rendimiento;
        end;
    end;

procedure informar(cant3deFeb: Integer; localidadMayor, localidadMenor: String; prom: Real);
    begin
        WriteLn('La cantidad de campos de Tres de Febrero con un rendimiento estimado superior a U$S10.000 son: ', cant3deFeb);
        WriteLn('La localidad con el campo de mayor rendimiento economico esperado es: ', localidadMayor);
        WriteLn('La localidad con el campo de menor rendimiento economico esperado es: ', localidadMenor);
        WriteLn('El rendimiento economico promedio es: U$S', prom:10:2);
    end;

var
    ha, tipo, cant3deFeb, cant: Integer;
    localidad, localidadMayor, localidadMenor: String;
    rendimiento, rendimientoMayor, rendimientoMenor, suma, prom: Real;

begin
    inicializar(cant3deFeb, cant, rendimientoMayor, rendimientoMenor, suma);
    repeat
        leerDatos(localidad, ha, tipo);
        rendimiento:= calcularRendimiento(ha, tipo, precio);
        if ((localidad = 'Tres de Febrero') and (rendimiento > 10000)) then
            cant3deFeb:= cant3deFeb + 1;
        mayorRendimiento(rendimiento, localidad, localidadMayor, rendimientoMayor);
        menorRendimiento(rendimiento, localidad, localidadMenor, rendimientoMenor);
        suma:= suma + rendimiento;
        cant:= cant + 1
    until ((ha = 900) and (localidad = 'Saladillo'));
    prom:= suma / cant;
    informar(cant3deFeb, localidadMayor, localidadMenor, prom);
end.