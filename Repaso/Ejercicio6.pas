
Program Ejercicio6;

Type 
    categoria =   1..7;

    puntero =   ^ nodo;

    objetos =   Record
        cod:   Integer;
        cat:   categoria;
        nom:   String;
        dist:   Real;
        Desc:   String;
        anioDesc:   Integer;
    End;

    nodo =   Record
        datos:   objetos;
        sig:   puntero;
    End;

    lista =   Record
        ini:   puntero;
        fin:   puntero;
    End;

Procedure cargarDatos(Var datos: objetos);
Begin
    WriteLn('Ingrese categoria (1:estrellas, 2:planetas, 3:satélites, 4:galaxias, 5:asteroides, 6:cometas, 7:nebulosas)');
    ReadLn(datos.cat);
    WriteLn('Ingrese nombre del objeto');
    ReadLn(datos.nom);
    WriteLn('Ingrese la distancia en años luz');
    ReadLn(datos.dist);
    WriteLn('Ingrese nombre del descubridor');
    ReadLn(datos.Desc);
    WriteLn('Ingrese el año de descubrimiento');
    ReadLn(datos.anioDesc);
End;

Procedure cargar(Var l: lista);

Var 
    datos:   objetos;
    n:   puntero;
Begin
    WriteLn('Ingrese el codigo del objeto. -1 para salir');
    ReadLn(datos.cod);
    While (datos.cod <> -1) Do
        Begin
            cargarDatos(datos);
            new(n);
            n^.datos := datos;
            If (l.ini = Nil) Then
                Begin
                    n^.sig := l.ini;
                    l.ini := n;
                    l.fin := l.ini;
                End
            Else
                Begin
                    n^.sig := l.fin^.sig;
                    l.fin^.sig := n;
                    l.fin := l.fin^.sig;
                End;
            WriteLn('Ingrese el codigo del objeto. -1 para salir');
            ReadLn(datos.cod);
        End;
End;

Var 
    l:   lista;
    aux:   puntero;
Begin
    l.ini := Nil;
    l.fin := Nil;
    cargar(l);

End.
