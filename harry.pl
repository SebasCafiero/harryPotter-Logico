/*
Para determinar en qué casa queda una persona cuando ingresa a Hogwarts, 
el Sombrero Seleccionador tiene en cuenta el carácter de la persona, 
lo que prefiere y en algunos casos su status de sangre.
*/

sangre(harry, mestiza).
sangre(draco, pura).
sangre(hermione, impura).

caracteristicas(harry, [coraje, amistad, orgullo, inteligencia]).
caracteristicas(draco, [inteligencia, orgullo]).
caracteristicas(hermione, [inteligencia, orgullo, responsabilidad]).

casaOdiada(harry, slytherin).
casaOdiada(draco, hufflepuff).

sombrero(gryffindor, Alumno):-
    caracteristicas(Alumno,ListaDeCaracteristicas),
    member(coraje, ListaDeCaracteristicas).

sombrero(slytherin, Alumno):-
    caracteristicas(Alumno,ListaDeCaracteristicas),
    member(orgullo, ListaDeCaracteristicas),
    member(inteligencia, ListaDeCaracteristicas).

sombrero(ravenclaw, Alumno):-
    caracteristicas(Alumno,ListaDeCaracteristicas),
    member(inteligencia, ListaDeCaracteristicas),
    member(responsabilidad, ListaDeCaracteristicas).

sombrero(hufflepuff, Alumno):-
    caracteristicas(Alumno, ListaDeCaracteristicas),
    member(amistad, ListaDeCaracteristicas).

gryffindorPermite(Alumno):- sombrero(gryffindor, Alumno).
ravenclawPermite(Alumno):- sombrero(ravenclaw, Alumno).
hufflepuffPermite(Alumno):- sombrero(hufflepuff, Alumno).

slytherinPermite(Alumno):- 
    sombrero(slytherin, Alumno),
    not(sangre(Alumno, impura)).