
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
    X[j] = res
    return
end

function bubblesort!(x::Vector{<:Real}; rev::Bool = false) :: Nothing
    # Fuege hier deinen Loesungscode ein
    return
end


### Beispiel 4

function canonicaltour(x::Vector{T}) :: Vector{T} where {T <: Integer}
    # Fuege hier deinen Loesungscode ein
    return
end


### Beispiel 5

function distance(x::Vector{<:Real}, y::Vector{<:Real}; p::Real = 2)
    # Fuege hier deinen Loesungscode ein
    return
end

