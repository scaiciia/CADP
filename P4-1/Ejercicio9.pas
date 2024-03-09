
Program Ejercicio9;

Const 
    cantidad =   400;

Type 
    alumno =   Record
        no:   Integer;
        DNI:   Integer;
        apellido:   String;
        nombre:   String;
        anoNac:   Integer;
    End;

    vector =   array[1..cantidad] Of alumno;

Procedure cargar(Var v: vector; Var dimL: Integer);

Var 
    aux:   alumno;
    i:   Integer;
Begin
    dimL := 0;
    WriteLn('Ingrese DNI');
    ReadLn(aux.DNI);
    While ((aux.DNI <> -1) And (dimL < cantidad)) Do
        Begin
            WriteLn('Ingrese el numero de inscripcion');
            ReadLn(aux.no);
            WriteLn('Ingrese apellido del alumno');
            ReadLn(aux.apellido);
            WriteLn('Ingrese el nombre del alumno');
            ReadLn(aux.nombre);
            WriteLn('Ingrese el año de nacimiento');
            ReadLn(aux.anoNac);
            dimL := dimL + 1;
            v[dimL] := aux;
            WriteLn('Ingrese DNI');
            ReadLn(aux.DNI);
        End;
End;

Function esPar(dni: Integer):   boolean;

Var 
    rta:   boolean;
    aux :   Integer;
Begin
    rta := true;
    While ((dni <> 0) And (rta = true)) Do
        Begin
            aux := dni Mod 10;
            If (aux Mod 2 = 0) Then
                dni := dni Div 10
            Else
                rta := false;
        End;
    esPar := rta;
End;

Procedure procesar(Var cantPar, iMay1, iMay2, dimL: Integer; v: vector);

Var 
    i, may1, may2:   Integer;
Begin
    cantPar := 0;
    may1 := 2024;
    may2 := 2024;
    For i:= 1 To dimL Do
        Begin
            If (esPar(v[i].DNI)) Then
                cantPar := cantPar + 1;
            If (v[i].anoNac < may1) Then
                Begin
                    may2 := may1;
                    iMay2 := iMay1;
                    may1 := v[i].anoNac;
                    iMay1 := i;
                End
            Else
                Begin
                    If (v[i].anoNac < may2) Then
                        Begin
                            may2 := v[i].anoNac;
                            iMay2 := i;
                        End;
                End;
        End;
End;

Procedure imprimir(v: vector; cantPar, iMay1, iMay2, dimL: Integer);
Begin
    WriteLn('Porcentaje de alumnos con DNI compuesto solo por pares: ', ((
            cantPar*100)/dimL):   5:   2, '%');
    WriteLn('Alumnos de mayor edad:');
    WriteLn(' - ', v[iMay2].apellido, ', ', v[iMay2].nombre);
    WriteLn(' - ', v[iMay1].apellido, ', ', v[iMay1].nombre);
End;

Var 
    v:   vector;
    iMay1, iMay2, cantPar, dimL:   Integer;

Begin
    cargar(v, dimL);
    procesar(cantPar, iMay1, iMay2, dimL, v);
    imprimir(v, cantPar, iMay1, iMay2, dimL);
End.
