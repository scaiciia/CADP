Program Ejercicio5;

type
    camion = record
        patente: String;
        anio: Integer;
        capacidad: Real;
    end;

    vector = array[1..100] of camion;

    viaje = record
        codViaje: Integer;
        codCamion: Integer;
        km: Real;
        ciudadDest: String;
        anio: Integer;
        dni: Integer;
    end;

    lista = ^ nodo;

    nodo = record
        datos: viaje;
        psig: lista;
    end;

procedure inicializar(var l: lista; var v: vector);
    var
        aux: viaje;
        n, act, ant: lista;
        i: Integer;
        rta: String;
    begin
        for i:= 1 to 100 do begin
            WriteLn('Ingrese la patente del camion');
            ReadLn(v[i].patente);
            WriteLn('Ingrese el año de fabricacion del camion');
            ReadLn(v[i].anio);
            WriteLn('Ingrese la capacidad del camion');
            ReadLn(v[i].capacidad);
        end;
        l:= nil;
        WriteLn('Desea ingresar un viaje? (S/N)');
        ReadLn(rta);
        while ((rta = 'S') or (rta = 's')) do begin
            WriteLn('Ingrese codigo de viaje');
            ReadLn(aux.codViaje);
            WriteLn('Ingrese codigo del camion');
            ReadLn(aux.codCamion);
            WriteLn('Ingrese los Km recorridos');
            ReadLn(aux.km);
            WriteLn('Ingrese la ciudad de destino');
            ReadLn(aux.ciudadDest);
            WriteLn('Ingrese el año del viaje');
            ReadLn(aux.anio);
            WriteLn('Ingrese el DNI del conductor');
            ReadLn(aux.dni);
            new(n);
            n^.datos:= aux;
            act:= l;
            while ((n^.datos.codCamion > act^.datos.codCamion) and (act <> nil)) do begin
                ant:= act;
                act:= act^.psig;
            end;
            if (act = l) then begin
                n^.psig:= l;
                l:= n;
            end else begin
                n^.psig:= act;
                ant^.psig:= n;
            end;
            WriteLn('Desea ingresar un viaje? (S/N)');
            ReadLn(rta);
        end;
    end;

procedure kmMasMenosRecorridos (var l: lista; v: vector);
    var
        act: lista;
        masKm, menosKm, suma: Real;
        cod: Integer;
        patMasKm, patMenosKm: String;
    begin
        masKm:= 0;
        menosKm:= 32767;
        act:= l;
        cod:= act^.datos.codCamion;
        suma:= 0;
        while (act <> nil) do begin
            if (act^.datos.codCamion = cod) then begin
                suma:= suma + act^.datos.km;
            end else begin
                if (suma > masKm) then  begin
                    masKm:= suma;
                    PatMasKm:= v[cod].patente;
                end;
                if (suma < menosKm) then begin
                    menosKm:= suma;
                    patMenosKm:= v[cod].patente;
                end;
                cod:= act^.datos.codCamion;
                suma:= 0;
            end;
            act:= act^.psig;
        end;
        WriteLn('La patente del camion con mas Km recorridos es: ', patMasKm);
        WriteLn('La patente del camion con menos Km recorridos es: ', patMenosKm);
    end;

procedure cantViajes (var l: lista; v: vector);
    var
        act: lista;
        c, anio: Integer;
        cap: Real;
    begin
        act:= l;
        c:= 0;
        while (act <> nil) do begin
            cap:= v[act^.datos.codCamion].capacidad;
            anio:= act^.datos.anio - v[act^.datos.codCamion].anio;
            if ((cap > 30.5) and (anio > 5)) then
                c:= c + 1;
            act:= act^.psig;
        end;
        WriteLn('La cantidad de viajes que se realizaron es: ', c);
    end;

procedure viajesDNI (var l: lista);
    var
        act: lista;
        dni, n: Integer;
        par: Boolean;
    begin
        act:= l;
        while (act <> nil) do begin
            dni:= act^.datos.dni;
            par:= True;
            while ((dni <> 0) and (par = True)) do begin
                n:= dni mod 10;
                if (n mod 2 <> 0) then
                    par:= False;
                dni:= dni div 10;
            end;
            if (par = True) then
                WriteLn('Codigo de viaje con DNI par: ', act^.datos.codViaje);
            act:= act^.psig;
        end;
    end;

var
    l: lista;
    v: vector;

begin
    inicializar(l, v);
    kmMasMenosRecorridos(l, v);
    cantViajes(l, v);
    viajesDNI(l);
end.