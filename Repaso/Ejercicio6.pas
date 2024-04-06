
Program Ejercicio6;

Const 
    cant =   7;

Type 
    categoria =   1..cant;

    puntero =   ^ nodo;

    objetos =   Record
        cod:   Integer;
        cat:   categoria;
        nom:   String;
        dist:   Real;
        desc:   String;
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

    vector =   array[categoria] Of Integer;

Procedure cargarDatos(Var datos: objetos);
Begin
    WriteLn('Ingrese categoria (1:estrellas, 2:planetas, 3:satélites, 4:galaxias, 5:asteroides, 6:cometas, 7:nebulosas)');
    ReadLn(datos.cat);
    WriteLn('Ingrese nombre del objeto');
    ReadLn(datos.nom);
    WriteLn('Ingrese la distancia en años luz');
    ReadLn(datos.dist);
    WriteLn('Ingrese nombre del descubridor');
    ReadLn(datos.desc);
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

Function masParesQImpares(cod: Integer):   boolean;

Var 
    num, par, impar:   Integer;
    rta:   boolean;
Begin
    par := 0;
    impar := 0;
    rta := false;
    While (cod <> 0) Do
        Begin
            num := cod Mod 10;
            If (num Mod 2 = 0) Then
                par := par + 1
            Else
                impar := impar + 1;
            cod := cod Div 10;
        End;
    If (par > impar) Then
        rta := true;
    masParesQImpares := rta;
End;

Procedure imprimir(Var l: puntero; codMax1, codMax2, cantGG1600: Integer; v: vector);

Var 
    aux:   puntero;
    i:   Integer;
Begin
    WriteLn('Los codigos de los objetos mas lejanos son: ', codMax1, ' y ', codMax2);
    WriteLn('La cantidad de planetas decubiertos por Galileo Galilei antes del año 1600 son: ', cantGG1600);
    For i:= 1 To cant Do
        WriteLn('Cantidad de objetos en categoria ', i, ': ', v[i]);
    aux := l;
    WriteLn('Nombres de estrellas cuyos codigos poseen mas digitos pares que impares:');
    While (aux <> Nil) Do
        Begin
            WriteLn(aux^.datos.nom);
            aux := aux^.sig;
        End;
End;

Procedure analizar(Var l: lista);

Var 
    aux, l2, n:   puntero;
    max1, max2:   Real;
    codMax1, codMax2, cantGG1600, i:   Integer;
    v:   vector;
Begin
    max1 := -1;
    codMax1 := 0;
    max2 := -1;
    codMax2 := 0;
    cantGG1600 := 0;
    l2 := Nil;
    For i:=1 To cant Do
        v[i] := 0;
    aux := l.ini;
    While (aux <> Nil) Do
        Begin
            If (aux^.datos.dist > max1) Then
                Begin
                    max2 := max1;
                    codMax2 := codMax1;
                    max1 := aux^.datos.dist;
                    codMax1 := aux^.datos.cod;
                End
            Else
                Begin
                    If (aux^.datos.dist > max2) Then
                        Begin
                            max2 := aux^.datos.dist;
                            codMax2 := aux^.datos.cod;
                        End;
                End;
            If ((aux^.datos.desc = 'Galileo Galilei') And (aux^.datos.anioDesc < 1600)) Then
                cantGG1600 := cantGG1600 + 1;
            v[aux^.datos.cat] := v[aux^.datos.cat] + 1;
            If ((masParesQImpares(aux^.datos.cod)) And (aux^.datos.cat = 1)) Then
                Begin
                    new(n);
                    n^.datos := aux^.datos;
                    n^.sig := l2;
                    l2 := n;
                End;
            aux := aux^.sig
        End;
    imprimir(l2, codMax1, codMax2, cantGG1600, v);
End;

Var 
    l:   lista;
    aux:   puntero;
Begin
    l.ini := Nil;
    l.fin := Nil;
    cargar(l);
    analizar(l);
End.
