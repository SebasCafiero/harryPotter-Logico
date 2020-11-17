/*
Para determinar en qué casa queda una persona cuando ingresa a Hogwarts, 
el Sombrero Seleccionador tiene en cuenta el carácter de la persona, 
lo que prefiere y en algunos casos su status de sangre.
*/

sangre(harry, mestiza).
sangre(draco, pura).
sangre(hermione, impura).

tieneCaracteristica(harry, coraje).
tieneCaracteristica(harry, amistad).
tieneCaracteristica(harry, orgullo).
tieneCaracteristica(harry, inteligencia).
tieneCaracteristica(draco, inteligencia).
tieneCaracteristica(draco, orgullo).
tieneCaracteristica(hermione, inteligencia).
tieneCaracteristica(hermione, orgullo).
tieneCaracteristica(hermione, responsabilidad).

casaOdiada(harry, slytherin). % REALIZAR DE OTRA FORMA
casaOdiada(draco, hufflepuff).

caracteristicaContemplada(gryffindor, coraje).
caracteristicaContemplada(slytherin, orgullo).
caracteristicaContemplada(slytherin, inteligencia).
caracteristicaContemplada(ravenclaw, inteligencia).
caracteristicaContemplada(ravenclaw, responsabilidad).
caracteristicaContemplada(hufflepuff, amistad).

casa(gryffindor).
casa(slytherin).
casa(ravenclaw).
casa(hufflepuff).

mago(Alguien):- sangre(Alguien, _).


% 1.
casaPermiteEntrar(slytherin, Alumno):-
    mago(Alumno),
    sangre(Alumno, Sangre),
    Sangre \= impura.
/*
casaPermiteEntrar(slytherin, Alumno):- sangre(Alumno, pura).
casaPermiteEntrar(slytherin, Alumno):- sangre(Alumno, mestiza).
*/

casaPermiteEntrar(Casa, Alumno):-
    casa(Casa),
    mago(Alumno),
    Casa \= slytherin.
/*
casaPermiteEntrar(gryffindor, Alumno).
casaPermiteEntrar(ravenclaw, Alumno).
casaPermiteEntrar(hufflepuff, Alumno).
*/


% 2.
magoCaracterApropiado(Casa, Alumno):-
    casa(Casa),
    mago(Alumno),
    forall(caracteristicaContemplada(Casa, Caracteristica),
            tieneCaracteristica(Alumno, Caracteristica)).


% 3.
magoPuedeQuedarEnCasa(gryffindor, hermione).
magoPuedeQuedarEnCasa(Casa, Alumno):-
    casa(Casa),
    mago(Alumno),
    magoCaracterApropiado(Casa, Alumno),
    casaPermiteEntrar(Casa, Alumno),
    not(casaOdiada(Alumno, Casa)).


% 4. FALTA REVISAR BIEN
cadenaDeAmistades(ListaDeMagos):-
    forall(member(Mago, ListaDeMAgos), tieneCaracteristica(Mago, amistad)). %Falta que vayan a la misma casa.