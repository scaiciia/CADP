Program Ejercicio4;

const
    pi= 3.14;

var
    d: Integer;
    r, area, perimetro: Real;

begin
    WriteLn('Ingrese el diametro del circulo');
    ReadLn(d);
    r:= d / 2;
    area:= pi * r * r;
    perimetro:= d * pi;
    WriteLn('El radio del circulo es: ', r:7:2, ', su area: ', area:7:2, ' y su perimetro: ', perimetro:7:2);
end.