#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char placa[8];
    char chassi[17];    
} Veiculo;

typedef struct {
    char nome[30];
    char cpf[11];
    int num_carros;
    char carros[100][7];
} Pessoa;

Pessoa pessoa;
Veiculo carro;

     

int main(){

    FILE *arqPessoas;
    FILE *arqCarros;
    int opc;
    int num_pessoas;

    do{
    printf("\n -----------------Cadastro-------------\n\n");
    printf("Escolha uma das opções:\n");
        printf("1 - Cadastrar nova pessoa e seus veiculos\n");
        printf("2 - Listar pessoas e automoveis\n");
        printf("3 - Sair\n");
        printf("Opção: ");
        scanf("%d", &opc);
    
    switch (opc){
    case 1:
        printf("Quantas pessoas serão cadastradas? ");
                scanf("%d", &num_pessoas);
                for(int i = 0; i < num_pessoas; i++){
                    arqPessoas = fopen("pessoas.txt", "a");
                    arqCarros = fopen("veiculos.txt", "a");

                    printf("Digite o nome da pessoa: ");
                    scanf(" %[^\n]", pessoa.nome);
                    printf("Digite o CPF da pessoa: ");
                    scanf(" %s", pessoa.cpf);

                    printf("Quantos carros essa pessoa tem? ");
                    scanf("%d", &pessoa.num_carros);

                    for(int j = 0; j < pessoa.num_carros; j++){
                        printf("Digite a placa do carro: ");
                        scanf(" %[^\n]", carro.placa);
                        strcpy(pessoa.carros[j], carro.placa);

                        printf("Digite o numero do chassi do carro: ");
                        scanf(" %[^\n]", carro.chassi);
                        
                        fwrite(&carro,1, sizeof(Veiculo), arqCarros);
                    }
                    fwrite(&pessoa,1, sizeof(Pessoa), arqPessoas);

                    fclose(arqPessoas);
                    fclose(arqCarros);
                }
                printf("\n\nPessoa cadastrada\n\n");
                break;
    case 2:
        arqPessoas = fopen("pessoas.txt", "r");
                arqCarros = fopen("veiculos.txt", "r");
                printf("Pessoas cadastradas: \n");
                while(fread(&pessoa, sizeof(Pessoa), 1, arqPessoas)){
                    printf("------------------------\n");
                    printf("Nome: %s - CPF: %s\nCarros:\n", pessoa.nome, pessoa.cpf);
                    for(int j = 0; j < pessoa.num_carros; j++){
                        printf("-> %s\n", pessoa.carros[j]);
                    }
                    printf("------------------------\n");
                }

                printf("Carros cadastrados: \n");
                while(fread(&carro, sizeof(Veiculo), 1, arqCarros)){
                    printf("------------------------\n");
                    printf("Placa: %s\nChassi: %s\n", carro.placa, carro.chassi);
            
                }
                printf("------------------------\n");
                
                fclose(arqPessoas);
                fclose(arqCarros);

                break;
}
     }while (opc != 3);
    

    return 0;
}
