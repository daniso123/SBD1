#include<stdio.h>
#include<stdlib.h>
#include "Exercicio_de_fixacao_Daniela_S_O_180015222.h"


void Cadastrar_Pessoa(){
     DADOS d;
    FILE *bd;
    bd*fopen("bd.txt", "ab");

if(bd == NULL){
    printf("[!] Proplemas com o arquivo");
}
else{
    do
    {
        system("cls");
        printf("\n -----------------Cadastro------------\n");
        fflush(stdin);
        printf("\n\n> Nome:");
        gets(&d.nome);
        fflush(stdin);
        printf("\n\n >formato: ***_***_***-** > CPF: ");
        gets(&d.cpf);
        fflush(stdin);
        printf("\n\n > formato: (**) ****-****> Telefone: ");
        scanf("&d", &d.telefone);
        fflush(stdin);
        printf("\n\n >Automovel: ");
        gets(&d.aut.marca);
        fflush(stdin);
        printf("\n\n> Placa: ");
        gets(&d.aut.placa);

        fwrite(&d, sizeof(DADOS), 1, bd);

        printf("Deseja cadastrar outras pessoas? (s/n)");
        getchar();
    } while (getchar() =='S' || getchar()=="s");
    fclose(bd);
    
}
}