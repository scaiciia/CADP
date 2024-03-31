
Program Ejercicio16;

Type 
    puntero =   ^ nodo;
    corredor =   Record
        nom:   String;
        ape:   String;
        dist:   Real;
        tiempo:   Integer;
        pais:   String;
        ciudadIni:   String;
        ciudadFin:   String;
    End;
    nodo =   Record
        dato:   corredor;
        sig:   puntero;
    End;

    mayorConvocacion =   Record
        ciudad:   String;
        cant:   Integer;
        km:   Real;
    End;

Procedure cargarDatos(Var datos: corredor);
Begin
    WriteLn('Ingrese nombre');
    ReadLn(datos.nom);
    WriteLn('Ingrese apellido');
    ReadLn(datos.ape);
    WriteLn('Ingrese tiempo');
    ReadLn(datos.tiempo);
    WriteLn('Ingrese pais');
    ReadLn(datos.pais);
    WriteLn('Ingrese ciudad donde inicio');
    ReadLn(datos.ciudadIni);
    WriteLn('Ingrese ciudad donde finalizo');
    ReadLn(datos.ciudadFin);
End;

Procedure insertarOrdenado(Var l: puntero; datos: corredor);

Var 
    n, ant, act:   puntero;
Begin
    act := l;
    While ((act <> Nil) And (datos.pais > act^.dato.pais) And (datos.ciudadIni > act^.dato.ciudadIni)) Do
        Begin
            ant := act;
            act := act^.sig;
        End;
    new(n);
    n^.dato := datos;
    n^.sig := act;
    If (act = l) Then
        Begin
            l := n;
        End
    Else
        Begin
            ant^.sig := n;
        End;
End;

Procedure cargar(Var l: puntero);

Var 
    datos:   corredor;
Begin
    WriteLn('Ingrese distancia recorrida');
    readln(datos.dist);
    While (datos.dist <> -1) Do
        Begin
            cargarDatos(datos);
            insertarOrdenado(l, datos);
            WriteLn('Ingrese distancia recorrida');
            readln(datos.dist);
        End;
End;

Procedure recorrer(Var l: puntero);

Var 
    aux:   puntero;
    mayor:   mayorConvocacion;
    ciudad:   String;
    kmTotal, kmBrasil, kmBoston, kmCiudad, distPromBrasil, pasoPromBoston:   Real;
    totalCorre, tiempoTotal, cantBrasil, cantDistIniFin, cantBoston, minBoston, cantCorreCiudad:   Integer;
Begin
    aux := l;
    totalCorre := 0;
    kmTotal := 0;
    tiempoTotal := 0;
    mayor.cant := -1;
    cantBrasil := 0;
    kmBrasil := 0;
    cantDistIniFin := 0;
    cantBoston := 0;
    kmBoston := 0;
    minBoston := 0;
    While (aux <> Nil) Do
        Begin
            ciudad := aux^.dato.ciudadIni;
            cantCorreCiudad := 0;
            kmCiudad := 0;
            While ((aux <> Nil) And (ciudad = aux^.dato.ciudadIni)) Do
                Begin
                    totalCorre := totalCorre + 1;
                    tiempoTotal := tiempoTotal + aux^.dato.tiempo;
                    cantCorreCiudad := cantCorreCiudad + 1;
                    kmCiudad := kmCiudad + aux^.dato.dist;
                    If (aux^.dato.pais = 'Brasil') Then
                        Begin
                            cantBrasil := cantBrasil + 1;
                            kmBrasil := kmBrasil + aux^.dato.dist;
                        End;
                    If (aux^.dato.ciudadIni <> aux^.dato.ciudadFin) Then
                        cantDistIniFin := cantDistIniFin + 1;
                    If (aux^.dato.ciudadIni = 'Boston') Then
                        Begin
                            cantBoston := cantBoston + 1;
                            kmBoston := kmBoston + aux^.dato.dist;
                            minBoston := minBoston + aux^.dato.tiempo;
                        End;
                    aux := aux^.sig;
                End;
            kmTotal := kmTotal + kmCiudad;
            If (cantCorreCiudad > mayor.cant) Then
                Begin
                    mayor.ciudad := ciudad;
                    mayor.cant := cantCorreCiudad;
                    mayor.km := kmCiudad;
                End;
        End;
    distPromBrasil := kmBrasil / cantBrasil;
    pasoPromBoston := (minBoston/kmBoston) / cantBoston;
    WriteLn('Total de Corredores: ', totalCorre, ' - Distancia total: ', kmTotal, ' - Tiempo total: ', tiempoTotal);
    WriteLn('Nombre de la ciudad que mas convoco: ', mayor.ciudad, '. Con una cantidad de ', mayor.cant, ' corredores y ', mayor.km:7:2, 'Km recorridos.');
    WriteLn('La distancia promedio de Brasil es de: ', distPromBrasil:7:2);
    WriteLn('La cantidad de corredores que partieron de una ciudad y finalizaron en otra es de: ', cantDistIniFin);
    WriteLn('El paso promedio de la ciudad de Boston es de: ', pasoPromBoston);
End;

Var 
    l:   puntero;

Begin
    l := Nil;
    cargar(l);
    recorrer(l);
End.
