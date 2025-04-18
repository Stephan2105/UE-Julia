using StatsBase
#=
Fuege in dieses Template deine Loesungscodes ein.
Wichtig 1: Die Datei gemaess der Namensrichtlinien benennen.
Wichtig 2: Bitte nur die Funktionen ausprogrammieren und keine Funktionsaufrufe vornehmen.
=#


### Beispiel 1:

function greatest(x::Vector{T}, k::Integer = 1) :: Vector{T} where {T <: Real}
    # x ist ein beliebiger Zahlenvektor, dessen maximal Stellen man finden moechte
    # k zeigt an, wie viele der groessten Stllen zurueckgegeben werden sollen

    # Fehlermeldung ausgeben wenn Bedingungen an k nicht erfuellt
    if k <= 0 || k > length(x)
        throw(ArgumentError("k muss groesser als 0 sein und kleiner bzw. gleich als die laenge von x"))
    end

    # x sortieren
    srt = reverse(sort(x))

    # ersten k elemente selektieren
    maxis = srt[1:k]

    # ret initialsieren
    ret = []

    # schleife um die k groessten elemente zu selektieren
    for i in 1:length(x)
        for j in 1:k
            # ueberpruefen, ob das naechste Element im Vektor zu den k groessten gehoert
            if srt[j] == x[i]
                # Wenn ja, dann zu ret hinzufuegen
                push!(ret, x[i])
            end
        end
    end
    # loesung ausgeben
    return ret
end


### Beispiel 2

function nearestindex(x::Vector{<:Real}, y::Real) :: Int
    # x ist ein beliebiger Zahlenvektor, wo man die Stelle des Elements mit dem gerinsgten Abstand zu einer Zahl haben moechte
    # y ist die Zahl zu der der geringste Abstand gefunden werden soll

    # abstandsvektor indizieren
    abstand = []

    # den abstand der einzelnen Elemente von x zu y berechnen
    for i in 1:length(x)
        abst = abs(x[i] - y)
        push!(abstand, abst)
    end

    # den geringsten Abstand finden
    indi = findmin(abstand)[1]

    # gleich indizieren
    gleich = []
    # die Stellen finden, wo der Abstand am geringsten ist
    for i in 1:length(x)
        if abstand[i] == indi
            push!(gleich, i)
        end
    end

    # fuer den Fall, dass es mehrere minimale Abstaende gibt die Indizes samplen 
    ind = sample(gleich)
    
    # die Stelle mit dem geringsten Abstand zurueckgeben
    return ind  
end


### Beispiel 3

function swap!(x::Vector, i::Integer, j::Integer) :: Nothing
    # X ist der Vektor in dem Positionen vertauscht werden sollen
    # i erste Stelle die vertauscht werden soll
    # j zweite Stelle die vertauscht werden soll

    # zwischenspeichern eines Werts
    res = x[i]
    # einen Wert an die andere Stelle einfuegen
    x[i] = x[j]
    # zwischengespeicherten Wert an anderer Stelle einfuegen
    x[j] = res
    return
end

function bubblesort!(x::Vector{<:Real}; rev::Bool = false) :: Nothing
    # x ist der Vektor, der sortiert werden soll
    # wenn rev = true, dann wird absteigend sortiert

    # wenn rev = false absteigend sortieren
    if rev == false
        # Schleifendurchlauf außen um einen Wert mehrmals wechseln zu koennen
        for j in 1:(length(x) - 1)
            # Schleife um jeden Wert der groesser als sein Nachfolgender ist mit diesem zu wechseln
            for i in 1:(length(x) - 1)
                # Bedingung, dass der nachfolgende Wert kleiner ist
                if x[i] > x[i + 1]
                    # tausch der beiden Werte
                     swap!(x, i, i + 1)
                end
            end
        end
    # Fall, dass rev = true
    else
        # Schleifendurchlauf außen um einen Wert mehrmals wechseln zu koennen
        for j in 1:(length(x) - 1)
            # Schleife um jeden Wert der kleiner als sein Nachfolgender ist mit diesem zu wechseln
            for i in 1:(length(x) - 1)
                # Bedingung, dass der nachfolgende Wert groesser ist
                if x[i] < x[i + 1]
                    # tausch der beiden Werte
                     swap!(x, i, i + 1)
                end
            end
        end
    end
    return
end


### Beispiel 4

function canonicaltour(x::Vector{T}) :: Vector{T} where {T <: Integer}
    # x ist der Vektor fuer den eine Route mit den Vorrausetzungen aus der Angabe gebildet werden soll
    # y ist der sortierte Vektor von x
    y = sort(x)

    # durch die laenge von y durchiterieren
    for i in 1:length(y)
        # sollte y an der iten Stelle ungleich i sein, dann liegt keine Permuatation der Zahlen 1 bis length(x) vor
        if i != y[i]
            throw(ArgumentError("x ist keine Permutation der Zahlen 1 bis length(x)"))
        end
    end

    # Stelle mit der 1 finden
    stell = findmin(x)[2]
    
    if stell == 1
        # wenn 1 am Anfang des Vektors ist
        # die Zahlen davor und danach bzw danach und am Ende ansehen und die kleinere waehlen
        hilfs = [x[2], x[length(x)]]
        indikator = findmin(hilfs)[2]
        
        if indikator == 1
            #Variante 1: indikator = 1
            # wenn die kleinere Zahl danach ist
            # dann ist der vektor selbst die Loesung
            res = x
        
        else        
            # Variante 2 indikator = 2
            # wenn die kleinere Zahl die daor bzw am Ende ist
            # dann ist die erste Zahl und dann die anderen rueckwaerts die Loesung
            res = [x[1]]
            res2 = reverse(x[2:length(x)])
            append!(res, res2)
        end

    elseif stell == length(x)
        # wenn die 1 am Ende des Vektors ist
        # dann muss man die Zahl davor und die am Anfang des Vektors untersuchen
        hilfs = [x[1], x[length(x) - 1]]
        indikator = findmin(hilfs)[2]
        
        if indikator == 1
            # Variante 1: indikator = 1
            # wenn die kleinere Zahl die am Anfang des Vektors ist
            # dann ist die letzte Zahl und dann der Vektor von der 1. bis zu vorletzten Stelle die Loesung
            res = [x[length(x)]]
            res2 = x[1:(length(x)- 1)]
            append!(res, res2)
    
        else
            # Variante 2: indikator = 2
            # wenn die kleinere Zahl davor kommt
            # dann ist der Vektor rueckwaerts die Loesung
            res = reverse(x)
        end

    else
        # wenn 1 in der mitte des Vektors
        # dann muss die Zahl davor und die danach untersucht werden
        hilfs = [x[stell - 1], x[stell + 1]]
        indikator = findmin(hilfs)[2]
    
        if indikator == 1
            # variante 1: indikator = 1
            # sollte die kleinere Zahl zuvor kommen
            # dann ist die 1 und bis zur 1. Stelle rueckwaerts und dann das Ende des Vektors bis eins vor der 1 rueckwaerts die Loesung
            res = reverse(x[1:stell])
            res2 =  reverse(x[(stell + 1):length(x)])
            append!(res, res2)
    
        else
            # sollte die kleinere Zahl danach kommen
            # dann ist die 1 bis zur letzten Stelle und die erste Stelle bis eine Stelle vor der 1 die Loesung
            res = x[stell: length(x)]
            res2 = x[1:(stell - 1)]
            append!(res, res2)
        end
    end
    return res
end


### Beispiel 5

function distance(x::Vector{<:Real}, y::Vector{<:Real}; p::Real = 2)
    # x und y sind die Vektoren deren Abstand bestimmt werden soll
    # p ist die Norm, die verwendet werden soll

    # Fehlermeldung wenn x und y nicht dieslbe laenge haben
    if length(y) != length(x)
        throw(ArgumentError("x und y haben nicht dieslebe laenge"))
    end

    # Fehlermeldung wenn p <= 0
    if p <= 0
        throw(ArgumentError("p muss > 0 sein"))
    end

    # subtraktionsvektor initialsieren
    subvek = []
    # die absoluten abstaende hoch p zwischen x und y in einen vektor einfuegen
    for i in 1:length(x)
        subi = (abs(x[i] - y[i]))^p
        push!(subvek, subi)
    end

    # die summe der abstaende bestimmen
    summe = sum(subvek)
    # die pte Wurzel ziehen
    res = summe^(1 / p)
    
    return res
end

