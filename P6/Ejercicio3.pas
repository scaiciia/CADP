
Program Ejercicio3;

Type 
    puntero =   ^ nodo;
    nodo =   Record
        num :   integer;
        sig :   puntero;
    End;
    lista =   Record
        pri:   puntero;
        ult:   puntero;
    End;

Procedure agregarAtras(Var l: lista; v: integer);

Var 
    aux :   puntero;
Begin
    new(aux);
    aux^.num := v;
    If (l.pri = Nil) Then
        Begin
            aux^.sig := l.pri;
            l.pri := aux;
            l.ult := aux;
        End
    Else
        Begin
            aux^.sig := l.ult^.sig;
            l.ult^.sig := aux;
            l.ult := l.ult^.sig;
        End;
End;

Procedure imprimir(Var l: lista);

Var 
    aux:   puntero;
Begin
    aux := l.pri;
    While (aux <> Nil) Do
        Begin
            Write(aux^.num, ' | ');
            aux := aux^.sig;
        End;
End;

Var 
    l :   lista;
    valor :   integer;
Begin
    l.pri := Nil;
    l.ult := Nil;
    writeln('Ingrese un numero');
    ReadLn(valor);
    While (valor <> 0) Do
        Begin
            agregarAtras(l, valor);
            writeln('Ingrese un numero');
            ReadLn(valor);
        End;
    imprimir(l);
End.
