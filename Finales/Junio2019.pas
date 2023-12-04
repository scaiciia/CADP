program Junio2019;

type
    producto = record
        codVenta: Integer;
        codProd: Integer;
        cant: Integer;
    end;

    lista = ^ nodo;

    nodo = record
        dato: producto;
        psig: lista
    end;

procedure inicializar(var l: lista);
    begin
        l:= nil;
    end;

procedure insertarOrdenado(var l: lista; aux: producto);
    var
        n, ant, act: lista;
    begin
        new(n);
        n^.dato:= aux;
        act:= l;
        while ((act <> nil) and (n^.dato.codProd > act^.dato.codProd)) do begin
            ant:= act;
            act:= act^.psig;
        end;
        n^.psig:= act;
        if (act = l) then
            l:= n
        else
            ant^.psig:= n;
    end;

procedure cargarLista(var l: lista);
    var
        aux: producto;
    begin
        WriteLn('Ingresar el codigo de venta');
        ReadLn(aux.codVenta);
        while (aux.codVenta <> 9999) do begin
            WriteLn('Ingresar el codigo de producto');
            ReadLn(aux.codProd);
            WriteLn('Ingresar la cantidad vendida');
            ReadLn(aux.cant);
            insertarOrdenado(l, aux);
            WriteLn('Ingresar el codigo de venta');
            ReadLn(aux.codVenta);
        end;
    end;

procedure infCantProdVendidos(var l: lista; cod: Integer);
    var
        aux: lista;
        suma: Integer;
    begin
        suma:= 0;
        aux:= l;
        while ((aux^.dato.codProd <> cod) and (aux <> nil)) do
            aux:= aux^.psig;
        while ((aux^.dato.codProd = cod) and (aux <> nil)) do begin
            suma:= suma + aux^.dato.cant;
            aux:= aux^.psig;
        end;
        WriteLn('La cantidad de productos vendidos del producto con codigo ', cod, ' es: ', suma);
    end;

var
    l: lista;
    cod: Integer;

begin
    inicializar(l);
    cargarLista(l);
    WriteLn('Ingrese el codigo del producto que desee ver la cantidad vendida');
    ReadLn(cod);
    infCantProdVendidos(l, cod);
end.