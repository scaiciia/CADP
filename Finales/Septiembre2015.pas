program Septiembre2015;

const
    dimF = 300;

type
    nroProductos = 1..300;

    producto = record
        num: nroProductos;
        cant: Real;
        nom: String;
    end;

    lista = ^ nodo;

    nodo = record
        dato: producto;
        psig: lista;
    end;

    tablaPrecios = array[nroProductos] of Real;

procedure inicializar (var l: lista; var precios: tablaPrecios);
    var
        i: Integer;
    begin
        l:= nil;
        for i:= 1 to dimF do begin
            WriteLn('Ingrese el precio del producto nro.: ', i);
            ReadLn(precios[i]);
        end;
    end;

procedure insertarOrdenado (var l: lista; aux: producto);
    var
        n, ant, act: lista;
    begin
        new(n);
        n^.dato:= aux;
        act:= l;
        while ((act <> nil) and (n^.dato.num > act^.dato.num)) do begin
            ant:= act;
            act:= act^.psig;
        end;
        n^.psig:= act;
        if (act = l) then
            l:= n
        else
            ant^.psig:= n;
    end;

procedure ingresarVentas(var l: lista);
    var
        rta: Char;
        aux: producto;
    begin
        WriteLn('Desea ingresar una venta? (S/N)');
        ReadLn(rta);
        while ((rta = 'S') or (rta = 's')) do begin
            WriteLn('Ingrese el numero del producto');
            ReadLn(aux.num);
            WriteLn('Ingrese la cantidad vendida');
            ReadLn(aux.cant);
            WriteLn('Ingrese el nombre del producto');
            ReadLn(aux.nom);
            insertarOrdenado(l, aux);
            WriteLn('Desea ingresar una venta? (S/N)');
            ReadLn(rta);
        end;  
    end;

procedure productoMenorGanancia (var l: lista; precios: tablaPrecios);
    var
        aux: lista;
        suma, precio: Real;
        nomAct, nom: String;
    begin
        precio:= 99999;
        nom:= '';
        aux:= l;
        while (aux <> nil) do begin
            suma:= 0;
            nomAct:= aux^.dato.nom;
            while (aux^.dato.nom = nomAct) do begin
                suma:= suma + (aux^.dato.cant * precios[aux^.dato.num]);
                aux:= aux^.psig;
            end;
            if (precio > suma) then begin
                precio:= suma;
                nom:= nomAct;
            end;
        end;
        WriteLn('El nombre del producto con menor ganancia es: ', nom, '. Con una recaudacion de: $', precio:7:2);
    end;

var
    l: lista;
    precios: tablaPrecios;

begin
    inicializar(l, precios);
    ingresarVentas(l);
    productoMenorGanancia(l, precios);
end.