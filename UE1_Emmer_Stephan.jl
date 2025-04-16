
#=
Fuege in dieses Template deine Loesungscodes ein.
Wichtig 1: Die Datei gemaess der Namensrichtlinien benennen.
Wichtig 2: Bitte nur die Funktionen ausprogrammieren und keine Funktionsaufrufe vornehmen.
=#


### Beispiel 1:

function greatest(x::Vector{T}, k::Integer = 1) :: Vector{T} where {T <: Real}
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
    
    return
end


### Beispiel 3

function swap!(x::Vector, i::Integer, j::Integer) :: Nothing
    # Fuege hier deinen Loesungscode ein
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

