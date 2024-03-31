
Program Ejercicio15;

Type 
    puntero =   ^ nodo;
    alumno =   Record
        DNI:   String[8];
        ape:   String;
        nom:   String;
        nota:   Real;
    End;

    nodo =   Record
        dato:   alumno;
        sig:   puntero;
    End;

    arreglo =   array[1..5] Of puntero;

    vector =   array[1..5] Of Integer;

Procedure cargarDatos(Var datos: alumno);
Begin
    WriteLn('Ingrese DNI');
    ReadLn(datos.DNI);
    WriteLn('Ingrese apellido');
    ReadLn(datos.ape);
    WriteLn('Ingrese nombre');
    ReadLn(datos.nom);
    WriteLn('Ingrese nota');
    ReadLn(datos.nota);
End;

Procedure cargarLista(Var l: puntero; datos: alumno);

Var 
    n:   puntero;
Begin
    new(n);
    n^.dato := datos;
    n^.sig := l;
    l := n;
End;

Procedure cargar(Var a: arreglo; v: vector);

Var 
    datos:   alumno;
    rta:   char;
Begin
    WriteLn('Desea ingresar un alumno?');
    ReadLn(rta);
    While ((rta = 's') Or (rta = 'S')) Do
        Begin
            cargarDatos(datos);
            If (datos.nota > 5) Then
                Begin
                    If (datos.nota >= 8) Then
                        Begin
                            If (v[1] <= v[4]) Then
                                Begin
                                    cargarLista(a[1], datos);
                                    v[1] := v[1] + 1;
                                End
                            Else
                                Begin
                                    cargarLista(a[4], datos);
                                    v[4] := v[4] + 1;
                                End;
                        End
                    Else
                        Begin
                            If (v[2]<= v[3]) Then
                                Begin
                                    cargarLista(a[2], datos);
                                    v[2] := v[2] + 1;
                                End
                            Else
                                Begin
                                    If (v[3]<=v[5]) Then
                                        Begin
                                            cargarLista(a[3], datos);
                                            v[3] := v[3] + 1;
                                        End
                                    Else
                                        Begin
                                            cargarLista(a[5], datos);
                                            v[5] := v[5] + 1;
                                        End;
                                End;
                        End;
                End;
            WriteLn('Desea ingresar un alumno?');
            ReadLn(rta);
        End;
End;

Procedure imprimir(Var a: arreglo);

Var 
    aux:   puntero;
    i:   Integer;
Begin
    For i:= 1 To 5 Do
        Begin
            WriteLn('Turno ', i, ':');
            aux := a[i];
            While (aux <> Nil) Do
                Begin
                    WriteLn('Apellido y nombre: ', aux^.dato.ape, ', ', aux^.dato.nom, ' - DNI: ', aux^.dato.DNI, ' - Nota: ', aux^.dato.nota:4:2);
                    WriteLn();
                    aux := aux^.sig;
                End;
            WriteLn();
        End;
End;

Var 
    a:   arreglo;
    v:   vector;
    i:   Integer;

Begin
    For i:= 1 To 5 Do
        Begin
            a[i] := Nil;
            v[i] := 0;
        End;
    cargar(a, v);
    imprimir(a);
End.
