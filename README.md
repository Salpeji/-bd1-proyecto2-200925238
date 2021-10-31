# -bd1-proyecto2-200925238
BD1_Proyecto2_2doSemestre2021

DOCUMENTACION ANALIZADA PARA ICE PROYETO 2 BASES DE DATOS 1
*.- Se detalla el modelo entidad relacional sobre el cual se aplicara las formas normales uno dos y tres.
![MODELO_ER](https://user-images.githubusercontent.com/15185688/139573785-7ea05979-72ff-46d3-adde-2d73a4cc5612.jpg)

![image](https://user-images.githubusercontent.com/15185688/139573624-1b2a3e61-82c1-4350-a4cc-7f262b634e06.png)


PRIMERA FORMA NORMAL:
Se aplico primera forma normal a elecciones electorales Instituto Centroamerica Electoral  ICE, En el cual se elimina la redundancia:
![image](https://user-images.githubusercontent.com/15185688/139573447-f49c8c5c-69f6-4fcd-8afa-e9e18eb9546c.png)


SEGUNDA FORMA NORMAL:
Se aplica segunda forma normal en el cual las tablas son independientes para cada conjunto de valores del cual se aplica a varios registros. En este caso se relacional las tablas con una clave externa.
![image](https://user-images.githubusercontent.com/15185688/139573396-c1eb88e8-af7a-4b71-b997-6538ab8dd03a.png)

TERCERA FORMA NORMAL:
En este caso se eliminan todos los campos del cual no dependan de la clave, del cual podemos decir que no forman parte de la clave primaria del cual deben depender sol de la clave mas nunca de otra columna no clave. del cual se aplica la dependencia funcional:

![image](https://user-images.githubusercontent.com/15185688/139573592-2c88a128-0ea6-47ad-bed0-0f6397c4c542.png)

