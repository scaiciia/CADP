
Program A_Ejercicio1;

Const 
    dimF =   10000;

Type 
    computadora =   Record
        cod:   Integer;
        ver:   Real;
        cantPaq:   Integer;
        cantUser:   Integer;
    End;

    vector =   array[1..dimF] Of computadora;

Procedure insertar(Var v: vector; Var dimL: integer; aux: computadora);

Var 
    i:   Integer;
Begin
    dimL := dimL + 1;
    i := dimL;
    While ((aux.cod < v[i-1].cod) And (i <> 1)) Do
        Begin
            v[i] := v[i-1];
            i := i-1;
        End;
    v[i] := aux;
End;

Procedure cargar(Var v: vector; Var dimL: Integer);

Var 
    aux:   computadora;
Begin
    WriteLn('Ingrese el codigo de la computadora');
    ReadLn(aux.cod);
    While ((aux.cod <> -1) And (dimL < dimF)) Do
        Begin
            WriteLn('Ingrese la version de Ubuntu');
            ReadLn(aux.ver);
            WriteLn('Ingrese la cantidad de paquetes instalados');
            ReadLn(aux.cantPaq);
            WriteLn('Ingrese la cantidad de usuarios');
            ReadLn(aux.cantUser);
            insertar(v, dimL, aux);
            WriteLn('Ingrese el codigo de la computadora');
            ReadLn(aux.cod);
        End;
End;

Procedure informar(v: vector; dimL: Integer);

Var 
    i, cantVer, mayPaq, suma:   Integer;
    mayVer:   Real;
Begin
    cantVer := 0;
    mayPaq := -1;
    suma := 0;
    For i:= 1 To dimL Do
        Begin
            If ((v[i].ver = 18.04) Or (v[i].ver = 16.04)) Then
                cantVer := cantVer + 1;
            suma := suma + v[i].cantUser;
            If (v[i].cantPaq > mayPaq) Then
                Begin
                    mayPaq := v[i].cantPaq;
                    mayVer := v[i].ver;
                End;
        End;
    WriteLn('La cantidad de computadoras que utilizan las versiones 18.04 o 16.04 son: ', cantVer, '.');
    WriteLn('El promedio de usuarios por computadoras es: ', (suma/dimL):   5:   2, '.');
    WriteLn('La version de Ubuntu de la computadora con mayor cantidad de paquetes es: ', mayVer:4:2, '.');
End;

Procedure eliminar(Var v: vector; Var dimL: Integer; pos: integer);

Var 
    i:   Integer;
Begin
    For i:= pos To dimL Do
        v[i] := v[i+1];
    dimL := dimL - 1;
End;

Procedure eliminarEntre0y500(Var v: vector; Var dimL: Integer);

Var 
    i:   Integer;
Begin
    For i:= 1 To dimL Do
        Begin
            If ((v[i].cod >= 0) And (v[i].cod <= 500)) Then
                eliminar(v, dimL, i);
        End;
End;

Var 
    v:   vector;
    dimL:   Integer;

Begin
    dimL := 0;
    cargar(v, dimL);
    informar(v, dimL);
    eliminarEntre0y500(v, dimL);
End.
