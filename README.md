# HEITZ_Lab1

## **I. Introduction :**

Ce rapport a pour but de présenter le travail effectué lors des travaux pratiques de l'UE Conception Conjointe, visant à approfondir et à mettre en œuvre nos connaissances via la mise en place d'une architecture NIOS nous permettant ici de coder un chenillard en C. Pour ce faire, le cahier des charges était simple. En se basant sur la plate-forme DE-10 embarquant un FPGA Max-10, il nous était demandé de créer un chenillard basé sur les LEDs de la board disposant de 16 vitesses choisies via 4 switches, le tout mis à jour par un push-button générant une interruption.

## **II. Architecture :**

De ce cahier des charges nous en déduisons par la suite l'architecture à mettre en place sur plate-forme designer. Le schéma ci-dessous vous présente mon choix :
  
![image](https://github.com/ESN2024/HEI1TZ_Lab1/blob/main/sch%C3%A9ma_lab_1.jpg)

Pour aller plus loin, on peut ajouter que le CPU est un NIOS II lite, ou encore que le bus LED a une taille de 8 bits, le bus switch 4 bits. La clock choisie pour cadencer toute l'architecture sera la 50 MHz de la DE10. Une fois le fichier VHDL généré et le design compilé, j'ai affecté les différents pins de mon design aux I/O de la DE-10 via le Pin Planner de Quartus. Il est important de noter qu'ici le JTAG UART a pour vocation d'aider au débogage de l'application via l'utilisation de la console NIOS II.

## **III. Design du code C :**

Nous arrivons maintenant à l'essence même du TP. Les avantages d'utiliser une architecture NIOS consistent à nous permettre de nous affranchir du VHDL en codant notre application via un code en C qui mettra en œuvre la dynamique de notre système, pouvant être composé de différentes IP VHDL bien évidemment. Cependant, la partie opérative sera effectuée en C. Ainsi, cela nous permet de rester sur un raisonnement séquentiel classique, nous permettant de coder plus aisément.

Rappelons le but du TP : nous souhaitons faire avancer un train de 3 LEDs de la droite vers la gauche en allumant et en éteignant les LEDs à une certaine vitesse que l'on choisit via les switches de la DE-10. Lorsque l'opérateur choisit une nouvelle vitesse, la mise à jour est faite via l'appui sur un bouton générant une interruption.

Le clignotement des LEDs se fera donc via une boucle for itérant sur le nombre de LEDs, avec un décalage de 1 bit vers la gauche de la valeur envoyée sur le bus de sortie connecté aux LEDs. Afin de garantir la continuation du processus, nous imbriquons cette première boucle for dans une boucle for infinie. La vitesse est gérée par une variable speed, et à chaque appui sur le bouton, nous générons une interruption qui déclenche la fonction irqHandler. Cette fonction va lire la valeur du bus switch et diviser le délai entre chaque décalage de bit par celle-ci (de 0 à 16), avec l'état zéro où toutes les LEDs sont allumées. Je ne vais pas détailler ici la totalité du code ; vous pouvez le retrouver dans le dossier software/main.c.

## **IV. Conclusion**

Ce TP est une bonne entrée en matière me permettant de mettre en œuvre interruption, design d'une architecture à base de Nios et implémentation d'un code C sur celle-ci.
Vous pouvez retrouver une vidéo démontrant mon système :

https://github.com/ESN2024/HEI1TZ_Lab1/assets/114926533/4c08c795-841a-4ec4-84d7-8214376d4a80



