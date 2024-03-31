
Program Ejercicio4;

Type 
    lista =   ^nodo;
    nodo =   Record
        num :   integer;
        sig :   lista;
    End;
Procedure armarNodo(Var L: lista; v: integer);

Var 
    aux :   lista;
Begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
End;

Procedure maximo(Var l: lista; Var max: Integer);

Var 
    aux:   lista;
Begin
    max := -32768;
    aux := l;
    While (aux <> Nil) Do
        Begin
            If (aux^.num > max) Then
                max := aux^.num;
            aux := aux^.sig;
        End;
End;

Procedure minimo(Var l: lista; Var min: Integer);

Var 
    aux:   lista;
Begin
    min := 32767;
    aux := l;
    While (aux <> Nil) Do
        Begin
            If (aux^.num < min) Then
                min := aux^.num;
            aux := aux^.sig;
        End;
End;

Procedure multiplo(Var l: lista; num: Integer; Var cant: Integer);

Var 
    aux:   lista;
Begin
    cant := 0;
    aux := l;
    While (aux <> Nil) Do
        Begin
            If (aux^.num Mod num = 0) Then
                Begin
                    cant := cant + 1;
                End;
            aux := aux^.sig;
        End;
End;

Var 
    l :   lista;
    valor, max, min, mul, cantMul:   integer;
Begin
    l := Nil;
    writeln('Ingrese un numero');
    read(valor);
    While (valor <> 0) Do
        Begin
            armarNodo(l, valor);
            writeln('Ingrese un numero');
            Read(valor);
        End;
    maximo(l, max);
    WriteLn(max);
    minimo(l, min);
    WriteLn(min);
    WriteLn('Ingrese un numero');
    ReadLn(mul);
    multiplo(l, mul, cantMul);
    WriteLn(cantMul);
End.
