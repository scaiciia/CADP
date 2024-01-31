Program Ejercicio4;

const
    precioMin = 3.40;
    precioMB = 1.35;

type
    cliente = record
        nom: String;
        cantLineas: Integer;
    end;

    linea = record
        num: Integer;
        min: Real;
        MB: Real;
    end;

procedure leerCliente(var cli: cliente);
    begin
        WriteLn('Ingrese el nombre del cliente');
        ReadLn(cli.nom);
        WriteLn('Ingrese la cantidad de lineas a su nombre');
        ReadLn(cli.cantLineas);
    end;

procedure leerLinea(var li: linea);
    begin
        WriteLn('Ingrese el numero de la linea');
        ReadLn(li.num);
        WriteLn('Ingrese los minutos consumidos');
        ReadLn(li.min);
        WriteLn('Ingrese los MB consumidos');
        ReadLn(li.MB);
    end;

procedure informar(min, MB: Real);
    begin
        WriteLn('Monto minutos: $', min:5:2);
        WriteLn('Monto MB: $', MB:5:2);
        WriteLn('TOTAL: $', min+MB:5:2);
    end;

procedure facturar(cli: cliente; var min, MB: Real);
    var
        i: Integer;
        li: linea;
        sumaMin, sumaMB: Real;

    begin
        sumaMin:= 0;
        sumaMB:= 0;
        for i:= 1 to cli.cantLineas do begin
            leerLinea(li);
            sumaMin:= sumaMin + li.min;
            sumaMB:= sumaMB + li.MB;
            informar(li.min*precioMin, li.MB*precioMB);
        end;
        min:= sumaMin * precioMin;
        MB:= sumaMB * precioMB;
    end;


var
    i: Integer;
    min, MB: Real;
    cli: cliente;

begin
    for i:= 1 to 9300 do begin
        leerCliente(cli);
        facturar(cli, min, MB);
        WriteLn('SUMA TOTAL:');
        informar(min, MB);
    end;
end.