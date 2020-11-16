/*
Para determinar en qué casa queda una persona cuando ingresa a Hogwarts, 
el Sombrero Seleccionador tiene en cuenta el carácter de la persona, 
lo que prefiere y en algunos casos su status de sangre.
*/

sangre(harry, mestiza).
sangre(draco, pura).
sangre(hermione, impura).

caracteristicas(harry, [coraje, amistad, orgullo, inteligencia]). % VER DE SEPARAR CARACTERISTICAS NO EN LISTAS
caracteristicas(draco, [inteligencia, orgullo]).
caracteristicas(hermione, [inteligencia, orgullo, responsabilidad]).

esCaracteristica(Alguien, Caracteristica):-
    caracteristicas(Alguien, ListaDeCaracteristicas),
    member(Caracteristica, ListaDeCaracteristicas).

casaOdiada(harry, slytherin).
casaOdiada(draco, hufflepuff).


sombrero(gryffindor, Alumno):- esCaracteristica(Alumno, coraje).

sombrero(slytherin, Alumno):-
    esCaracteristica(Alumno, orgullo),
    esCaracteristica(Alumno, inteligencia).

sombrero(ravenclaw, Alumno):-
    esCaracteristica(Alumno, inteligencia),
    esCaracteristica(Alumno, responsabilidad).

sombrero(hufflepuff, Alumno):- esCaracteristica(Alumno, amistad).


casaPermite(gryffindor, Alumno):- sombrero(gryffindor, Alumno).
casaPermite(ravenclaw, Alumno):- sombrero(ravenclaw, Alumno).
casaPermite(hufflepuff, Alumno):- sombrero(hufflepuff, Alumno).

casaPermite(slytherin, Alumno):- 
    sombrero(slytherin, Alumno),
    not(sangre(Alumno, impura)).

magoCaracterApropiado(Casa, Alumno):- sombrero(Casa, Alumno).


magoPuedeQuedarEnCasa(gryffindor, hermione).
magoPuedeQuedarEnCasa(Casa, Alumno):-
    casaPermite(Casa, Alumno),
    not(casaOdiada(Alumno, Casa)).

cadenaDeAmistades(ListaDeMagos):-
    forall(member(Mago, ListaDeMAgos), esCaracteristica(Mago, amistad)). %Falta que vayan a la misma casa.