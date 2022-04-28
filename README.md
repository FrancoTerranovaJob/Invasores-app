# Solucion del challenger de Urbetrack 

Este proyecto es la solucion al challenger planteado para acceder al puesto de flutter developer.

## Nombre del proyecto

Invasores

## Finalidad

La aplicacion debe mostrar los detalles de los "invasores" de la serie de star wars, 
mostrando primero un listado de todos los personajes junto con los atributos principales (nombre,altura,género).
Luego se puede acceder al perfil mas detallado de cualquier personaje donde se detallan otros atributos
(planeta de origen, color de cabello,ojos y piel)

## Arquitectura de la solución

La solucion se realizo aplicando una arquitectura CLEAN, dividiendo las distintas responsabilidades
en el formato: provider, repositorio y presentacion.

## Detalles de las interfaces

apis utilizadas: (GETS) swapi.dev , (POST) jsonplaceholder.typecode.com

IApiProvider: 
 - getPeople : Retorna un objeto  GetCharactersResponse, el cual contiene un listado de personajes con sus atributos
 - getPlanetsResponse: Retorna un objeto GetPlanetsResponse, el cual contiene un listado de planetas con sus atributos
 - getVehicles: Retorna un objeto GetVehiclesResponse, el cual contiene un listado de vehiculos con sus atributos
 - getStarShipsResponse: Retorna un objeto GetStarshipsResponse, el cual contiene un listado de naves espaciales con sus atributos
 - reportPerson: Se realiza el reporte de la persona seleccionada con un POST

IDataBaseProvider:
 - createDataBase: Crea las distintas tablas necesarias en la base de datos local.
 - addCharacters: Inserta un listado de personajes con sus datos personales y sus naves y vehiculos
 - addPlanets: Inserta un listado de planetas con sus datos correspondientes
 - addTransports: Inserta un listado de transportes(naves o vehiculos) con sus datos correspondientes
 - getConsolidatedCharacters: Retorna un objeto GetConsolidatedCharacters, el cual contiene un listado de todos los personajes
 almacenados en la DB local, junto con sus naves, vehiculos y datos personales.

IRepository:
 - initializeApp: si es la primera vez que se inicia la app, llama a los metodos "createDataBase" y  "getConsolidatedData"
  para crear las tablas necesarias en la DB local y luego obtener todos los datos requeridos desde la api respectivamente
 - getConsolidatedData: Trae todos los datos de la api, y los consolida o trae todos los datos ya consolidados de la DB local
 dependiendo de si el usuario se encuentra en modo ONLINE u OFFLINE respectivamente
 - syncData: realiza un llamado a "getConsolidateData" 
 - reportPerson: se realiza el llamado al metodo reportPerson del apiProvider 

Presentacion:
- Core: Aqui se se inicia la app, y se muestra en caso de ser necesario el splash de la misma.
- Drawer: Aqui se encuentra la definicion de UI del menu lateral y se maneja el estado de la misma.
- Home: Ubicacion principal de la aplicacion, donde se encuentra la definicion de UI de la lista de personajes y se maneja el estado de la lista de la misma.
- Show_people: Aqui se encuentra la definicion de UI de la pantalla responsable de mostrar los datos adicionales de los personajes y se controla su estado.

## Detalles tecnicos 

- version del sdk de flutter: 2.10.4 
- liberia de inyeccion de dependencia: Kiwi
- libreria para el manejo de estados: flutter_bloc
- libreria para test: mockito
