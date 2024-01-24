program Ejercicio2;

type
    int1_31 = 1..31;
    int1_12 = 1..12;
    int19_20 = 2019..2020;
    fecha = record
        day: int1_31;
        month: int1_12;
        age: int19_20;
    end;
    meses = record
        ene: Integer;
        feb: Integer;
        mar: Integer;
        abr: Integer;
        may: Integer;
        jun: Integer;
        jul: Integer;
        ago: Integer;
        sep: Integer;
        oct: Integer;
        nov: Integer;
        dic: Integer;
    end;

procedure inicializar(var cantVerano: Integer; var cantMeses: meses);
    begin
        cantVerano:= 0;
        cantMeses.ene:= 0;
        cantMeses.feb:= 0;
        cantMeses.mar:= 0;
        cantMeses.abr:= 0;
        cantMeses.may:= 0;
        cantMeses.jun:= 0;
        cantMeses.jul:= 0;
        cantMeses.ago:= 0;
        cantMeses.sep:= 0;
        cantMeses.oct:= 0;
        cantMeses.nov:= 0;
        cantMeses.dic:= 0;
    end;

procedure leer(var f: fecha);
    begin
        WriteLn('Ingrese el año de casamiento');
        ReadLn(f.age);
        if (f.age <> 2020) then begin
            WriteLn('Ingrese el mes');
            ReadLn(f.month);
            WriteLn('Ingrese el dia');
            ReadLn(f.day);
        end;
    end;

procedure imprimir(cantVerano: Integer; cantMeses: meses);
    begin
        WriteLn('La cantidad de casamientos en los meses de verano son: ', cantVerano);
        WriteLn('Cantidad de casamientos en los primeros 10 dias de cada mes:');
        WriteLn('Enero: ', cantMeses.ene);
        WriteLn('Febrero: ', cantMeses.feb);
        WriteLn('Marzo: ', cantMeses.mar);
        WriteLn('Abril: ', cantMeses.abr);
        WriteLn('Mayo: ', cantMeses.may);
        WriteLn('Junio: ', cantMeses.jun);
        WriteLn('Julio: ', cantMeses.jul);
        WriteLn('Agosto: ', cantMeses.ago);
        WriteLn('Septiembre', cantMeses.sep);
        WriteLn('Octubre: ', cantMeses.oct);
        WriteLn('Noviembre: ', cantMeses.nov);
        WriteLn('Diciembre: ', cantMeses.dic);
    end;

var
    f: fecha;
    cantVerano: Integer;
    cantMeses: meses;

begin
    inicializar (cantVerano, cantMeses);
    leer(f);
    while (f.age <> 2020) do begin
        if ((f.month = 1) or (f.month = 2) or (f.month = 3)) then
            cantVerano:= cantVerano + 1;
        if (f.day < 10) then begin
            case f.month of
                1: cantMeses.ene:= cantMeses.ene + 1;
                2: cantMeses.feb:= cantMeses.feb + 1;
                3: cantMeses.mar:= cantMeses.mar + 1;
                4: cantMeses.abr:= cantMeses.abr + 1;
                5: cantMeses.may:= cantMeses.may + 1;
                6: cantMeses.jun:= cantMeses.jun + 1;
                7: cantMeses.jul:= cantMeses.jul + 1;
                8: cantMeses.ago:= cantMeses.ago + 1;
                9: cantMeses.sep:= cantMeses.sep + 1;
                10: cantMeses.oct:= cantMeses.oct + 1;
                11: cantMeses.nov:= cantMeses.nov + 1;
                12: cantMeses.dic:= cantMeses.dic + 1;
            end;
        end;
    end;
    imprimir (cantVerano, cantMeses);
end.