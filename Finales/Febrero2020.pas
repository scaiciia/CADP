program febrero2020;

type
    tipoPublicacion = 1..12;
    publicacion = record
        titulo: String[20];
        autor: String[30];
        DNI: Integer;
        tipo: tipoPublicacion;
    end;

    lista = ^ nodo;

    nodo = record
        dato: publicacion;
        psig: lista;
    end;

    vector = array[tipoPublicacion] of Integer;

procedure inicializar(var l: lista; var v: vector);
    var
        i: Integer;
    begin
        l:= nil;
        for i:= 1 to 12 do begin
          v[i]:= 0;
        end;
    end;

procedure insertarOrdenado(var l: lista; aux: publicacion);
    var
        n, act, ant: lista;
    begin
        new(n);
        n^.dato:= aux;
        act:= l;
        while ((act <> Nil) and (act^.dato.DNI > l^.dato.DNI)) do begin
            ant:= act;
            act:= act^.psig;
        end;
        n^.psig:= act;
        if (act = l) then begin
            l:= n;
        end else begin
            ant^.psig:= n;
        end;
    end;

procedure ingresarDatos (var l: lista; var v: vector);
    var
        aux: publicacion;
    begin
        WriteLn('Ingrese DNI del autor');
        ReadLn(aux.DNI);
        while (aux.DNI <> 0) do begin
            WriteLn('Ingrese el nombre del autor');
            ReadLn(aux.autor);
            WriteLn('Ingrese el titulo de la publicación');
            ReadLn(aux.titulo);
            WriteLn('Ingrese el tipo de publicación');
            ReadLn(aux.tipo);
            v[aux.tipo]:= v[aux.tipo] + 1;
            insertarOrdenado(l, aux);
            WriteLn('Ingrese DNI del autor');
            ReadLn(aux.DNI);
        end;
    end;

function tipoMayorPublicaciones(v: vector): Integer;
    var
        cant, i, tipo: Integer;
    begin
        cant:= -1;
        tipo:= 0;
        for i:= 1 to 12 do begin
            if (v[i] > cant) then begin
                cant:= v[i];
                tipo:= i;
            end;
        end;
        tipoMayorPublicaciones:= tipo;
    end;

procedure cantPublicacionesPorAutor (var l: lista);
    var
        aux: lista;
        dni, cant: Integer;
    begin
        aux:= l;
        while (aux <> Nil) do begin
            dni:= aux^.dato.DNI;
            cant:= 0;
            while (aux^.dato.DNI = dni) do begin
                cant:= cant + 1;
                aux:= aux^.psig;
            end;
            WriteLn('La cantidad de publicaciones del DNI ', dni, ' es de: ', cant, ' publicaciones.');
        end;
    end;

var
    l: lista;
    v: vector;
begin
    inicializar(l, v);
    ingresarDatos(l, v);
    WriteLn('El tipo de publicaciones con mayor cantidad de publicaciones es: ', tipoMayorPublicaciones(v));
    cantPublicacionesPorAutor(l);
end.