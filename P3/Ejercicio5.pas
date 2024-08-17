program Ejercicio5;

type
  
  auto = record
    marca: String;
    modelo: String;
    precio: Real;
  end;

procedure inicializar(var promedio, mayor: auto);
    begin
        promedio.marca:= '';
        promedio.modelo:= '';
        promedio.precio:= 0;
        mayor.marca:= '';
        mayor.modelo:= '';
        mayor.precio:= -1;
    end;

procedure ingresarDatos(promedio, mayor: auto);
    var
        nuevo: auto;
        c: integer;
    begin
        c:= 0;
        WriteLn('Ingrese marca');
        readln(nuevo.marca);
        while (nuevo.marca <> 'ZZZ') do begin
            WriteLn('Ingrese modelo');
            readln(nuevo.modelo);
            WriteLn('Ingrese precio');
            readln(nuevo.precio);
            if (nuevo.marca <> promedio.marca) then begin
                if (c <> 0) then
                    WriteLn('Precio promedio de la marca ', promedio.marca, ' es de $', (promedio.precio / c):7:2);
                promedio.marca:= nuevo.marca;
                promedio.precio:= nuevo.precio;
                c:= 1;
            end else begin
                promedio.precio:= promedio.precio + nuevo.precio;
                c:= c + 1;
            end;
            if (nuevo.precio > mayor.precio) then begin
                mayor.precio:= nuevo.precio;
                mayor.marca:= nuevo.marca;
                mayor.modelo:= nuevo.modelo;
            end;
            WriteLn('Ingrese marca');
            readln(nuevo.marca);
        end;
        WriteLn('El auto mas caro es el ', mayor.modelo, ' de la marca ', mayor.marca, ' con un precio de $', mayor.precio:7:2);
    end;

var
  promedio, mayor: auto;

begin
  inicializar(promedio, mayor);
  ingresarDatos(promedio, mayor);
end.