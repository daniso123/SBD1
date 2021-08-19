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

FILE *conferir;
Pessoa conferida;

Pessoa grupo[100];

int compararCPF (const void *x, const void *y){
    return strcmp(((Pessoa *)x)->cpf, ((Pessoa *)y)->cpf);
}

void ordenarCPF() {
    int i = 0;
    conferir = fopen("pessoas.txt", "r");
    while(fread(&grupo[i], sizeof(Pessoa), 1, conferir)){
        i++;
    }

    qsort(grupo, i, sizeof(Pessoa), compararCPF);
    fclose(conferir);

    conferir = fopen("pessoas.txt", "w");
    int tam = 0;
    while(tam < i){
        fwrite(&grupo[tam], 1, sizeof(Pessoa), conferir);
        tam++;
    }

    fclose(conferir);
}


int cpfExiste(char vetor[11]){
    conferir = fopen("pessoas.txt", "r");
    while(fread(&conferida, sizeof(Pessoa), 1, conferir)){
        if(strcmp(vetor, conferida.cpf) == 0){
            return 1;
        }
    }
    fclose(conferir);
    return 0;
}

int compararNome (const void *x, const void *y){
    return strcmp(((Pessoa *)x)->nome, ((Pessoa *)y)->nome);
}

void ordenarNome() {
    int i = 0;
    conferir = fopen("pessoas.txt", "r");
    while(fread(&grupo[i], sizeof(Pessoa), 1, conferir)){
        i++;
    }

    qsort(grupo, i, sizeof(Pessoa), compararNome);
    fclose(conferir);

    conferir = fopen("pessoas.txt", "w");
    int tam = 0;
    while(tam < i){
        fwrite(&grupo[tam], 1, sizeof(Pessoa), conferir);
        tam++;
    }

    fclose(conferir);
}
     

int main(){

    FILE *arqPessoas;
    FILE *arqCarros;
    int opc;
    int num_pessoas;
    char conferirCPF[11];
    int conferirCarro;

    do{
    printf("\n -----------------Cadastro-------------\n\n");
    printf("Escolha uma das opções:\n");
        printf("1 - Cadastrar nova pessoa e seus veiculos\n");
	printf("2 - Listar pessoas e veiculos ordenados por nome\n");
	printf("3 - Listar pessoas e veiculos ordenados por CPF\n");
        printf("4 - Sair\n");
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
                    scanf(" %s", conferirCPF);
		    
		    while(strlen(conferirCPF) != 11){
                        printf("CPF não tem 11 dígitos, digite CPF válido.\n");
                        scanf(" %s", conferirCPF);
                    }

                    while(cpfExiste(conferirCPF)){
                        printf("Já existe esse CPF cadastrado. Digite outro CPF válido: ");
                        scanf(" %s", conferirCPF);
                    }

                    strcpy(pessoa.cpf, conferirCPF);

                    printf("Quantos carros essa pessoa tem? ");
                    scanf("%d", &conferirCarro);
		    
		    while(conferirCarro == 0){
                        printf("Para você conseguir se cadastrar precisa ter um veiculo, por favor digite um numero maior que 0: ");
                        scanf("%d", &conferirCarro);
                    }

                    pessoa.num_carros = conferirCarro;

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
		
		ordenarNome();

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

    case 3:
        	arqPessoas = fopen("pessoas.txt", "r");
                arqCarros = fopen("veiculos.txt", "r");
	
		ordenarCPF();		

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
     }while (opc != 4);
    

    return 0;
}
